import 'package:get/get.dart';
import 'package:personal_gallery/data/model/image_data_model.dart';
import 'package:personal_gallery/view/screens/add_image_screen.dart';
import 'package:personal_gallery/view/screens/full_image_view_screen.dart';
import 'package:personal_gallery/view/screens/home_screen.dart';
import 'package:personal_gallery/view/screens/welcome_screen.dart';

class AppRoute {
  static const String welcomeScreen = "/welcome_screen";
  static const String homeScreen = "/home_screen";
  static const String addImageScreen = "/add_image_screen";
  static const String fullImageViewScreen = "/full_image_view_screen";

  static List<GetPage> route = [
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: addImageScreen, page: () => const AddImageScreen()),
    GetPage(
      name: fullImageViewScreen,
      page: () => FullImageViewScreen(
        imageDataModel: Get.arguments as ImageDataModel,
      ),
    ),
  ];
}
