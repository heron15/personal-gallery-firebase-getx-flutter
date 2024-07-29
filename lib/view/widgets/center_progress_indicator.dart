import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:personal_gallery/utils/app_color.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({
    super.key,
    required this.indicatorSize,
  });

  final double indicatorSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(
        size: indicatorSize,
        color: AppColor.themeColor,
      ),
    );
  }
}
