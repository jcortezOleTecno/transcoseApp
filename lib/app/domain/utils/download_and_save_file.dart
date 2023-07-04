import 'package:gallery_saver/gallery_saver.dart';

Future<bool?> downloadAndSaveFile(String imageUrl) async {
  return await GallerySaver.saveImage(imageUrl);
}
