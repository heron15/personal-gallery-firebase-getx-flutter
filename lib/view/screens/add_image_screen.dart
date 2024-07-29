import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_gallery/controller/add_image_screen_controller.dart';
import 'package:personal_gallery/utils/app_color.dart';
import 'package:personal_gallery/utils/app_strings.dart';
import 'package:personal_gallery/utils/asset_paths.dart';
import 'package:personal_gallery/view/widgets/custom_elevated_button.dart';
import 'package:personal_gallery/view/widgets/custom_toast.dart';
import 'package:personal_gallery/view/widgets/loading_dialog.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  final AddImageScreenController _addImageScreenController = Get.find<AddImageScreenController>();
  final TextEditingController _labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      ///------App bar part------///
      appBar: AppBar(
        title: const Text(AppStrings.uploadImage),
      ),

      ///------Body part------///
      body: SafeArea(
        child: GetBuilder<AddImageScreenController>(
          builder: (addImageScreenController) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  ///------Select image container part------///
                  GestureDetector(
                    onTap: addImageScreenController.pickImage,
                    child: Container(
                      height: 250,
                      width: 250,
                      margin: const EdgeInsets.only(top: 40, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1,
                          color: AppColor.grey,
                        ),
                        image: DecorationImage(
                          image: _getImageProvider(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  ///------Label text edit field part------///
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: TextField(
                      controller: _labelController,
                      keyboardType: TextInputType.text,
                      cursorColor: AppColor.themeColor,
                      onTapOutside: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter label",
                      ),
                    ),
                  ),

                  ///------Upload button part------///
                  CustomElevatedButton(
                    buttonText: AppStrings.upload,
                    onTap: () {
                      _onTapUploadButton();
                    },
                    buttonWidth: const Size.fromWidth(double.maxFinite),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onTapUploadButton() {
    if (_addImageScreenController.selectedImage != null && _labelController.text.isNotEmpty) {
      _uploadImage();
    } else {
      if (mounted) {
        setCustomToast(
          AppStrings.noImageSelected,
          Icons.error_outline,
          AppColor.red,
          AppColor.white,
        ).show(context);
      }
    }
  }

  void _uploadImage() async {
    loadingDialog();

    bool result = await _addImageScreenController.uploadImage(_labelController.text);

    Get.back();

    if (result) {
      _labelController.clear();
      if (mounted) {
        setCustomToast(
          AppStrings.imageUploadSuccess,
          Icons.check_circle,
          AppColor.green,
          AppColor.white,
        ).show(context);
      }
      Get.back(result: true);
    } else {
      _labelController.clear();
      if (mounted) {
        setCustomToast(
          AppStrings.imageUploadFailed,
          Icons.error_outline,
          AppColor.red,
          AppColor.white,
        ).show(context);
      }
    }
  }

  ImageProvider _getImageProvider() {
    if (_addImageScreenController.selectedImage != null) {
      return FileImage(File(_addImageScreenController.selectedImage!.path));
    } else {
      return const AssetImage(AssetPaths.selectImage);
    }
  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }
}
