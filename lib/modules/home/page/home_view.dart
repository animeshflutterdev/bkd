import 'package:bkd/modules/home/bloc/home_bloc.dart';
import 'package:bkd/modules/home/bloc/home_bloc.dart';
import 'package:bkd/modules/home/models/home_response_models.dart';
import 'package:bkd/services/custom_widgets/custom_button.dart';
import 'package:bkd/services/custom_widgets/custom_image.dart';
import 'package:bkd/services/custom_widgets/custom_ui.dart';
import 'package:bkd/services/custom_widgets/sizing.dart';
import 'package:bkd/utils/constants/image_const.dart';
import 'package:flutter/material.dart';
import 'package:bkd/services/custom_widgets/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/color_const.dart';
import '../../../utils/constants/hex_color.dart';
import '../widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
              child: Column(children: state.widgetList.value??[])
              /*Column(
                children: [
                  12.ph,
                  // Custom App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextEnum('AppLogo').textMediumMD(),
                        Row(
                          children: [
                            const CustomSvgAssetImageView(
                                path: ImageConst.notificationSVG,
                                width: 30,
                                height: 30),
                            16.pw,
                            const CustomSvgAssetImageView(
                                path: ImageConst.cartSVG, width: 30, height: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: CustomContainer(
                      color: HexColor.fromHex(ColorConst.gray100),
                      height: 50,
                      borderRadius: BorderRadius.circular(12),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Icon(Icons.search,
                              color: HexColor.fromHex(ColorConst.gray500)),
                          8.pw,
                          Expanded(
                            child: CustomTextEnum('Search products',
                                    color: HexColor.fromHex(ColorConst.gray500))
                                .textMediumMD(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Top Banner
                  Stack(
                    children: [
                      const SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: CustomNetWorkImageView(
                          url:
                              'https://images.unsplash.com/photo-1517841905240-472988babdf9',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        left: 16,
                        bottom: 65,
                        child: CustomText(
                          'Fashion\nsale',
                          color: Colors.white,
                          size: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: CustomGOEButton(
                          backGroundColor: HexColor.fromHex(ColorConst.red),
                          onPressed: () {},
                          child: CustomTextEnum("Check", color: Colors.white)
                              .textMediumXS(),
                        ),
                      ),
                    ],
                  ),

                  24.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextEnum('New').textMediumMD(),
                        CustomTextEnum('View all',
                                color: HexColor.fromHex(ColorConst.gray500))
                            .textSM(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: CustomContainer(
                      height: 180,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, i) => const ProductCard(),
                      ),
                    ),
                  ),
                  12.ph,
                ],
              ),*/
            ),
          );
        },
      ),
    );
  }
}
