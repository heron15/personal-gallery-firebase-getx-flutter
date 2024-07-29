import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_gallery/controller/home_screen_controller.dart';
import 'package:personal_gallery/core/app_route.dart';
import 'package:personal_gallery/data/model/image_data_model.dart';
import 'package:personal_gallery/utils/app_color.dart';
import 'package:personal_gallery/utils/app_strings.dart';
import 'package:personal_gallery/view/widgets/center_progress_indicator.dart';
import 'package:personal_gallery/view/widgets/custom_toast.dart';
import 'package:personal_gallery/view/widgets/grid_view_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController _homeScreenController = Get.find<HomeScreenController>();

  @override
  void initState() {
    super.initState();
    _getImageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///------App bar part------///
      appBar: AppBar(
        title: const Text(AppStrings.home),
        actions: [
          IconButton(
            onPressed: () {
              _onTapAddIconButton();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),

      ///------Body part------///
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _getImageData();
          },
          child: GetBuilder<HomeScreenController>(
            builder: (homeScreenController) {
              return homeScreenController.isLoading
                  ? const CenterProgressIndicator(
                      indicatorSize: 50,
                    )
                  : homeScreenController.imageDataList.isEmpty
                      ? const Center(
                          child: Text(AppStrings.noImagesFound),
                        )
                      : OrientationBuilder(
                          builder: (BuildContext context, Orientation orientation) {
                            return GridView.builder(
                              padding: const EdgeInsets.all(15),
                              itemCount: homeScreenController.imageDataList.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: (orientation == Orientation.portrait ? 2 : 4),
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 25,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) {
                                final imageData = homeScreenController.imageDataList[index];

                                ///------Custom grid view item------///
                                return GridViewItemWidget(
                                  imageUrl: imageData.imageUrl,
                                  label: imageData.label,
                                  onTap: () {
                                    _onTapGridViewItem(imageData);
                                  },
                                );
                              },
                            );
                          },
                        );
            },
          ),
        ),
      ),
    );
  }

  void _onTapAddIconButton() async {
    final result = await Get.toNamed(AppRoute.addImageScreen);
    if (result == true) {
      _getImageData();
    }
  }

  void _onTapGridViewItem(ImageDataModel imageData) {
    Get.toNamed(AppRoute.fullImageViewScreen, arguments: imageData);
  }

  void _getImageData() async {
    final bool result = await _homeScreenController.fetchImages();

    if (!result) {
      if (mounted) {
        setCustomToast(
          AppStrings.failedToLoadImageData,
          Icons.error_outline,
          AppColor.red,
          AppColor.white,
        ).show(context);
      }
    }
  }
}
