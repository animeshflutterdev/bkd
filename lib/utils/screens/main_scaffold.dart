import 'package:bkd/utils/constants/color_const.dart';
import 'package:bkd/utils/constants/hex_color.dart';
import 'package:flutter/material.dart';
import '../../modules/home/page/home_view.dart';
import '../../modules/category/page/category_view.dart';
import '../../modules/cart/page/cart_view.dart';
import '../../modules/favorites/page/favorites_view.dart';
import '../../modules/profile/page/profile_view.dart';
import '../../services/custom_widgets/custom_bottom_nav_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeView(),
    CategoryView(),
    CartView(),
    FavoritesView(),
    ProfileView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: HexColor.fromHex(ColorConst.white),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
} 