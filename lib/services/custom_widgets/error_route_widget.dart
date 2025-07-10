import 'package:bkd/route/app_route_names.dart';
import 'package:bkd/services/custom_widgets/sizing.dart';
import 'package:flutter/material.dart';

import '../../route/custom_router/custom_route.dart';
import '../../utils/constants/color_const.dart';
import '../../utils/constants/hex_color.dart';
import 'custom_button.dart';
import 'custom_image.dart';
import 'custom_text.dart';

class ErrorRouteWidget extends StatelessWidget {
  const ErrorRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: CustomText("TextUtils.notFound",
            color: HexColor.fromHex(ColorConst.primaryDark), size: 20),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomAssetImageView(
                path: "AssetsConst.pageNotFound",
                height: 200,
                width: 200,
              ),
              8.ph,
              CustomText(
                'Oops! Something went wrong...',
                color: HexColor.fromHex(ColorConst.primaryDark),
                size: 20,
              ),
              8.ph,
              CustomText(
                '404',
                color: HexColor.fromHex(ColorConst.primaryDark),
                size: 50,
              ),
              8.ph,
              CustomText(
                'Page Not Found',
                color: HexColor.fromHex(ColorConst.primaryDark),
                size: 20,
              ),
              12.ph,
              CustomGOEButton(
                radius: 6,
                backGroundColor: Colors.blueAccent,
                onPressed: () {
                  CustomRoute().clearAndNavigate(AppRouteNames.initialRoot);
                },
                child: const CustomText(
                  "Back to Home",
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
