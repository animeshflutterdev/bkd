import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImg extends StatelessWidget {
  const NetworkImg(
      {super.key,
      required this.url,
      this.height,
      this.width,
      this.fit,
      this.color,
      this.errorWidget,
      this.loadingWidget,
      this.seoAlt});

  final String url;
  final String? seoAlt;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final Widget? loadingWidget, errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      color: color,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return loadingWidget ??
            Container(
              width: width,
              height: height,
              color: Colors.white, // Shimmer background color
            );
      },
      errorWidget: (_, __, ___) {
        return errorWidget ??
            Image.asset(
              "AssetsConst.ssNoImageLogo", // Use your local error image asset
              width: width,
              height: height,
              fit: fit,
            );
      },
      imageBuilder: (context, imageProvider) {
        return Image(
          image: imageProvider,
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
      },
    );
  }
}
