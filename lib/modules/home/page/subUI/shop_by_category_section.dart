import 'package:flutter/material.dart';
import '../../models/shop_by_category.dart';

class ShopByCategorySection extends StatelessWidget {
  final ShopByCategory shopByCategory;
  const ShopByCategorySection({Key? key, required this.shopByCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Enhance UI for shop by category section
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shopByCategory.results?.length ?? 0,
        itemBuilder: (context, i) {
          final cat = shopByCategory.results![i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (cat.imageUrl != null)
                  Image.network(cat.imageUrl!, width: 60, height: 60, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image)),
                if (cat.label != null)
                  Text(cat.label!),
              ],
            ),
          );
        },
      ),
    );
  }
} 