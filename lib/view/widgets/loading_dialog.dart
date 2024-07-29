import 'package:flutter/material.dart';
import 'package:personal_gallery/app.dart';
import 'package:personal_gallery/utils/app_color.dart';
import 'package:personal_gallery/view/widgets/center_progress_indicator.dart';

Future<void> loadingDialog() async {
  return showDialog(
    context: PersonalGallery.navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColor.white,
          ),
          child: const CenterProgressIndicator(
            indicatorSize: 40,
          ),
        ),
      );
    },
  );
}
