import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:personal_gallery/data/model/image_data_model.dart';
import 'package:personal_gallery/utils/app_strings.dart';

class HomeScreenController extends GetxController {
  final List<ImageDataModel> _imageDataList = [];
  bool _isLoading = false;

  List<ImageDataModel> get imageDataList => _imageDataList;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<bool> fetchImages() async {
    bool isSuccess = false;
    _isLoading = true;
    update();

    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection(AppStrings.firesStorageDatabaseName).get();
      final data = snapshot.docs
          .map((doc) => ImageDataModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      _imageDataList.assignAll(data);
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
    } finally {
      _isLoading = false;
      update();
    }

    return isSuccess;
  }
}
