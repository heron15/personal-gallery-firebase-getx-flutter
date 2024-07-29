import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:personal_gallery/core/app_route.dart';
import 'package:personal_gallery/core/dependency_injection.dart';
import 'package:personal_gallery/themes/app_bar_theme.dart';
import 'package:personal_gallery/themes/elevated_button_theme.dart';
import 'package:personal_gallery/themes/text_field_theme.dart';

class PersonalGallery extends StatefulWidget {
  const PersonalGallery({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<PersonalGallery> createState() => _PersonalGalleryState();
}

class _PersonalGalleryState extends State<PersonalGallery> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //status bar color change
        statusBarIconBrightness: Brightness.dark //status bar icon color change
        ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: AppRoute.welcomeScreen,
      getPages: AppRoute.route,
      initialBinding: DependencyInjection(),
      navigatorKey: PersonalGallery.navigatorKey,
      theme: ThemeData(
        appBarTheme: getAppBarTheme(),
        elevatedButtonTheme: getElevatedButtonTheme(),
        inputDecorationTheme: getInputDecorationTheme(),
      ),
    );
  }
}
