import 'package:flutter/material.dart';
import '../../models/home_page_view_all_product.dart';

class HomePageViewAllProductSection extends StatelessWidget {
  final HomePageViewAllProductList homePageViewAllProductList;
  const HomePageViewAllProductSection({Key? key, required this.homePageViewAllProductList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Enhance UI for view all product section
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final result in homePageViewAllProductList.results ?? []) ...[
          if (result.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(result.title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: result.products?.length ?? 0,
            itemBuilder: (context, i) {
              final prod = result.products![i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    if (prod.productImageUrl != null)
                      Image.network(prod.productImageUrl!, width: 60, height: 60, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image)),
                    if (prod.productName != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(prod.productName!),
                      ),
                  ],
                ),
              );
            },
          ),
        ]
      ],
    );
  }
} 