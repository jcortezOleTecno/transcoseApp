import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerClass{

  PermissionHandlerClass() {
    initialData();
  }

  Future initialData() async{
    await permissionManageExternalStorage();
  }

  Future<bool> permissionManageExternalStorage() async {
    bool result = true;
    var status = await Permission.manageExternalStorage.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.manageExternalStorage.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

}

