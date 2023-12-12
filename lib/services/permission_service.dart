import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService {
  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.request();
    return status == PermissionStatus.granted ||
        status == PermissionStatus.limited;
  }

  Future<bool> requestGalleryPermission() async {
    var status = await Permission.photos.request();
    return status == PermissionStatus.granted ||
        status == PermissionStatus.limited;
  }

  Future<bool> requestMicrophonePermission() async {
    var status = await Permission.microphone.request();
    print(status);

    return status == PermissionStatus.granted ||
        status == PermissionStatus.limited;
  }

  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    return status == PermissionStatus.granted ||
        status == PermissionStatus.limited;
  }

  Future<bool> checkGalleryPermission() async {
    var status = await Permission.photos.status;

    return status == PermissionStatus.granted ||
        status == PermissionStatus.limited;
  }

  Future<bool> checkMicrophonePermission() async {
    var status = await Permission.microphone.status;
    return status == PermissionStatus.granted ||
        status == PermissionStatus.limited;
  }
}
