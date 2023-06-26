import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<bool> downloadAndSaveFile(String imageUrl) async {
  try {
    final response = await http.get(Uri.parse(imageUrl));
    final appDir = await getTemporaryDirectory();
    final filePath = appDir.path;

    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return true;
  } catch (e) {
    log(e.toString());
    return false;
  }
}
