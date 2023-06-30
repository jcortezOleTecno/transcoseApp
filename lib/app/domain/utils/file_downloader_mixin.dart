import 'dart:developer';
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:path_provider/path_provider.dart';

mixin FileDownloader {
  Future downloadFile({required String url, required String name}) async {
    if (url.isEmpty) return;

    final fileName =
        "${DateTime.now().millisecondsSinceEpoch}_${name.replaceAll(" ", "_")}";

    String? localPath = await findLocalPath();

    if (localPath == null) return;

    // String savedDir = await prepareSaveDir(localPath);

    log(fileName);

    // FlutterDownloader.enqueue(
    //   url: url,
    //   savedDir: savedDir,
    //   showNotification: true,
    //   openFileFromNotification: true,
    //   fileName: fileName,
    // );
  }

  Future<String> prepareSaveDir(String path) async {
    final savedDir = Directory(path);

    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      await savedDir.create();
    }

    return path;
  }

  Future<String?> findLocalPath() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (_) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      externalStorageDirPath = directory.path;
    }

    return externalStorageDirPath;
  }
}
