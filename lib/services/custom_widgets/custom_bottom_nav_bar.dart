import 'package:flutter/material.dart';
import '../../utils/constants/hex_color.dart';
import '../../utils/constants/color_const.dart';
import '../../utils/constants/hex_color.dart';
import 'custom_text.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.storefront, 'label': 'Shop'},
      {'icon': Icons.shopping_bag, 'label': 'Bag'},
      {'icon': Icons.favorite, 'label': 'Favorites'},
      {'icon': Icons.person, 'label': 'Profile'},
    ];
    return Container(
      decoration: BoxDecoration(
        color: HexColor.fromHex("1D1D1F"), // Updated background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final selected = index == currentIndex;
            final color = selected
                ? HexColor.fromHex("827BEB") // Selected color
                : HexColor.fromHex("676D75"); // Unselected color
            final fontWeight = selected ? FontWeight.w700 : FontWeight.w400;
            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[index]['icon'] as IconData,
                        color: color,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        items[index]['label'] as String,
                        color: color,
                        size: 12,
                        fontWeight: fontWeight,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
} 