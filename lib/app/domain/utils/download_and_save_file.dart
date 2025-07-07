import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

Future<bool?> downloadAndSaveFile(String imageUrl) async {
  return await GallerySaver.saveImage(imageUrl);
}

Future<bool?> downloadAndSaveFileFromZip(Uint8List fileZip) async {
  bool? result = false;
  try{
    String dir = (await getDownloadsDirectory())!.path;
    var file = File('$dir/imagesOleZIp.zip');
    File zippedFile = await file.writeAsBytes(fileZip);
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    for (var file in archive) {
      var fileName = '$dir/${file.name}';
      if (file.isFile && !fileName.contains("__MACOSX")) {
        var outFile = File(fileName);
        outFile = await outFile.create(recursive: true);
        File imgSave = await outFile.writeAsBytes(file.content);
        result = await downloadAndSaveFile(imgSave.path);
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }catch(e){
    log('error ${e.toString()}');
  }
  return result;
}
