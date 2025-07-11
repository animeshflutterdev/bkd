import 'package:flutter/material.dart';
import '../../models/home_page_product.dart';

class HomePageProductSection extends StatelessWidget {
  final HomePageProduct homePageProduct;
  const HomePageProductSection({Key? key, required this.homePageProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Enhance UI for home page product section
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homePageProduct.results?.length ?? 0,
        itemBuilder: (context, i) {
          final prod = homePageProduct.results![i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (prod.productImageUrl != null)
                  Image.network(prod.productImageUrl!, width: 100, height: 100, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image)),
                if (prod.productName != null)
                  Text(prod.productName!),
              ],
            ),
          );
        },
      ),
    );
  }
} 