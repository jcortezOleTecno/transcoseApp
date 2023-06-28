import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vemare/app/view/theme/color.dart';

class ImageUtil {
  static void getImagePicker(
    BuildContext context,
    ImageSource source,
    Function(File) getPhoto, {
    // bool allow = true,
    bool allowCropImage = true,
    int compressQuality = 90,
  }) async {
    // if (!allow) return;

    // allow = false;

    final pickedFile = await ImagePicker()
        .pickImage(source: source, imageQuality: compressQuality);

    if (pickedFile == null) {
      // allow = true;

      return;
    }

    File image = File(pickedFile.path);

    File? croppedImage = allowCropImage
        // ignore: use_build_context_synchronously
        ? await cropImage(
            context,
            image,
            compressQuality: compressQuality,
          )
        : image;

    if (croppedImage == null) return;

    getPhoto(croppedImage);
  }

  static Future<File?> cropImage(BuildContext context, File image,
      {int compressQuality = 90,
      List<CropAspectRatioPreset> aspectRatioPresets = const [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      CropAspectRatio? aspectRatio}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      compressQuality: compressQuality,
      aspectRatio: aspectRatio,
      aspectRatioPresets: aspectRatioPresets,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Editar foto',
          toolbarColor: AppColor.primaryBlue,
          toolbarWidgetColor: Colors.white,
          backgroundColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Editar foto',
        ),
      ],
    );
    if (croppedImage != null) {
      return File(croppedImage.path);
    }
    return null;
  }
}
