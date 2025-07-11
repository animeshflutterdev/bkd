import 'package:flutter/material.dart';
import '../../models/banner_auto_scroll.dart';

class BannerAutoScrollSection extends StatelessWidget {
  final BannerAutoScroll bannerAutoScroll;
  const BannerAutoScrollSection({Key? key, required this.bannerAutoScroll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Enhance UI for banner auto scroll section
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bannerAutoScroll.results?.length ?? 0,
        itemBuilder: (context, i) {
          final banner = bannerAutoScroll.results![i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              banner.webImageUrl ?? '',
              fit: BoxFit.cover,
              width: 300,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
            ),
          );
        },
      ),
    );
  }
} 