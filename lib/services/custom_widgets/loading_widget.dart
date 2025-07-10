import 'package:flutter/material.dart';

import '../../route/context_service.dart';
import '../../utils/constants/shadow_const.dart';
import 'custom_image.dart';
import 'custom_ui.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.height = 300,
    this.width = 300,
    this.backgroundColor = Colors.transparent,
    this.child,
  });

  final double width;
  final double height;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: width,
      height: height,
      child: child ??
          Center(
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: CustomContainer(
                  borderRadius: BorderRadius.circular(12),
                  height: 60,
                  width: 60,
                  color: Colors.white,
                  boxShadow: ShadowConst.shadowXS,
                  child: const CustomAssetImageView(
                    radius: 12,
                    path: "AssetsConst.loaderAnimation",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

void showLoading() {
  showGeneralDialog(
    context: CurrentContext().context,
    pageBuilder: (_, __, ___) => Material(
      color: Colors.transparent,
      child: Center(
        child: CustomContainer(
          borderRadius: BorderRadius.circular(12),
          height: 60,
          width: 60,
          color: Colors.white,
          child: const CustomAssetImageView(
            radius: 12,
            path: "AssetsConst.loaderAnimation",
            height: 60,
            width: 60,
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
