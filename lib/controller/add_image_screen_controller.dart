import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_gallery/utils/app_strings.dart';

class AddImageScreenController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;

  XFile? get selectedImage => _selectedImage;

  Future<void> pickImage() async {
    final XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _selectedImage = pickedImage;
      update();
    }
  }

  Future<bool> uploadImage(String label) async {
    bool isSuccess = false;

    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('${AppStrings.storageDatabaseName}/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = storageRef.putFile(File(_selectedImage!.path));
      await uploadTask;

      final imageUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance.collection(AppStrings.firesStorageDatabaseName).add({
        'imageUrl': imageUrl,
        'label': label,
        'uploadedAt': DateTime.now(),
      });

      isSuccess = true;
    } catch (e) {
      isSuccess = false;
    } finally {
      _selectedImage = null;
      update();
    }

    return isSuccess;
  }
}
