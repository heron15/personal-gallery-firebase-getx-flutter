import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  final PageController pageController = PageController();
  var _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      updateCurrentPageIndex(pageController.page!.round());
    });
  }

  void updateCurrentPageIndex(int index) {
    _currentPageIndex = index;
    update();
  }
}
