import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_gallery/controller/welcome_screen_controller.dart';
import 'package:personal_gallery/core/app_route.dart';
import 'package:personal_gallery/utils/app_color.dart';
import 'package:personal_gallery/utils/app_strings.dart';
import 'package:personal_gallery/utils/asset_paths.dart';
import 'package:personal_gallery/view/widgets/custom_elevated_button.dart';
import 'package:personal_gallery/view/widgets/rich_text_two_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeScreenController>(
      builder: (welcomeScreenController) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 45, right: 45, top: 20, bottom: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ///------Top view pager image part------///
                  SizedBox(
                    height: 280,
                    child: PageView(
                      controller: welcomeScreenController.pageController,
                      onPageChanged: welcomeScreenController.updateCurrentPageIndex,
                      children: const [
                        Image(
                          width: 190,
                          height: 190,
                          image: AssetImage(AssetPaths.pageViewImg01),
                        ),
                        Image(
                          width: 190,
                          height: 190,
                          image: AssetImage(AssetPaths.pageViewImg02),
                        ),
                      ],
                    ),
                  ),

                  ///------View pager text part------///
                  RichTextTwoWidget(
                    firstText: welcomeScreenController.currentPageIndex == 0
                        ? AppStrings.viewPageTextTitle01
                        : AppStrings.viewPageTextTitle02,
                    secondText:
                        "\n\n${welcomeScreenController.currentPageIndex == 0 ? AppStrings.viewPageTextDesc01 : AppStrings.viewPageTextDesc02}",
                    firstTextColor: AppColor.textColorPrimary,
                    secondTextColor: AppColor.textColorSecondary,
                    firstTextSize: 18,
                    secondTextSize: 14,
                    firstTextFontWeight: FontWeight.w600,
                    secondTextFontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    topPadding: 20,
                    bottomPadding: 15,
                    height: 1.2,
                  ),
                  // Adjust as needed

                  ///------Dot indicator part------///
                  DotsIndicator(
                    dotsCount: 2,
                    position: welcomeScreenController.currentPageIndex.toDouble(),
                    decorator: const DotsDecorator(
                      color: Colors.grey, // Inactive color
                      activeColor: AppColor.themeColor, // Active color
                    ),
                  ),

                  const SizedBox(height: 30),

                  ///------Get start button part------///
                  CustomElevatedButton(
                    buttonText: AppStrings.getStarted,
                    buttonIcon: Icons.arrow_forward_ios_outlined,
                    leftIconPadding: 10,
                    onTap: () {
                      Get.offNamed(AppRoute.homeScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
