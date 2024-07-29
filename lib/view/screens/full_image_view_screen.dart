import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_gallery/data/model/image_data_model.dart';
import 'package:personal_gallery/utils/app_color.dart';
import 'package:personal_gallery/utils/app_strings.dart';
import 'package:personal_gallery/view/widgets/center_progress_indicator.dart';
import 'package:personal_gallery/view/widgets/rich_text_two_widget.dart';

class FullImageViewScreen extends StatelessWidget {
  const FullImageViewScreen({super.key, required this.imageDataModel});

  final ImageDataModel imageDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: const Text(AppStrings.imageDetails),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///------Image show part------///
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: CachedNetworkImage(
                  imageUrl: imageDataModel.imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const CenterProgressIndicator(
                    indicatorSize: 40,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),

              ///------Label and date text show part------///
              RichTextTwoWidget(
                firstText: imageDataModel.label,
                secondText:
                    "\n${AppStrings.uploadedAt} ${_formatDateTime(imageDataModel.uploadedAt)}",
                firstTextColor: AppColor.textColorPrimary,
                secondTextColor: AppColor.textColorSecondary,
                firstTextSize: 24,
                secondTextSize: 16,
                firstTextFontWeight: FontWeight.w600,
                secondTextFontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                height: 1.6,
                topPadding: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('M/d/yyyy - hh:mm a');
    return formatter.format(dateTime);
  }
}
