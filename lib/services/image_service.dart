import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static ImageSource camera = ImageSource.camera;
  static ImageSource gallery = ImageSource.gallery;

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    return await pickImage(ImageSource.camera);
  }

  Future<File?> pickImageFromGallery() async {
    return await pickImage(ImageSource.gallery);
  }
}
