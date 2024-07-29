import 'package:get/get.dart';
import 'package:personal_gallery/controller/add_image_screen_controller.dart';
import 'package:personal_gallery/controller/home_screen_controller.dart';
import 'package:personal_gallery/controller/welcome_screen_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => AddImageScreenController(), fenix: true);
  }
}
