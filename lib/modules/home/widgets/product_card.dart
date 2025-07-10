import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {final bool onSale;
const ProductCard({super.key, this.onSale = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              'https://images.unsplash.com/photo-1512436991641-6745cdb1723f',
              height: 90,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (onSale)
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('-20%',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                const SizedBox(height: 4),
                const Text('Evening Dress',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    if (onSale)
                      const Text('126',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    if (onSale) const SizedBox(width: 4),
                    Text(
                      onSale ? '195' : '126',
                      style: TextStyle(
                        color: onSale ? Colors.grey : Colors.black,
                        decoration: onSale ? TextDecoration.lineThrough : null,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
