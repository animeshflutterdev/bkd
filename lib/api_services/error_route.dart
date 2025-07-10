import 'package:bkd/services/custom_widgets/sizing.dart';
import 'package:flutter/material.dart';
import '../services/custom_widgets/custom_app_bar.dart';
import '../services/custom_widgets/custom_button.dart';
import '../services/custom_widgets/custom_image.dart';
import '../services/custom_widgets/custom_text.dart';
import '../utils/constants/color_const.dart';
import '../utils/constants/hex_color.dart';

Scaffold errorRoute() {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: const CustomAppBar(
      title: "Not found",
      leading: null,
    ),
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNetWorkImageView(
              url: "404_page_not_found.png",
              height: 300,
              width: 300,
            ),
            20.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomGOEButton(
                radius: 6,
                size: const Size(double.infinity, 40),
                backGroundColor: HexColor.fromHex(ColorConst.primary70),
                onPressed: () {
                  // CustomRoute().clearAndNavigate(RouteName.home);
                },
                child: const CustomText(
                  "Back to Home",
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
