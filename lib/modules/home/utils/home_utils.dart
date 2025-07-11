import 'package:bkd/modules/home/models/banner_auto_scroll.dart';
import 'package:bkd/modules/home/models/home_page_product.dart';
import 'package:bkd/modules/home/models/home_page_view_all_product.dart';
import 'package:bkd/modules/home/models/profile_info.dart';
import 'package:bkd/modules/home/models/shop_by_category.dart';
import 'package:bkd/modules/home/page/subUI/banner_auto_scroll_section.dart';
import 'package:bkd/modules/home/page/subUI/home_page_view_all_product_section.dart';
import 'package:flutter/cupertino.dart';

import '../../../services/helpers/logger_extension.dart';
import '../models/home_response_models.dart';
import '../page/subUI/home_page_product_section.dart';
import '../page/subUI/profile_info_section.dart';
import '../page/subUI/shop_by_category_section.dart';

class HomeUtils {
  Future<List<Widget>> getWidget(
      {required HomePageResponse? homeSduiResponse}) async {
    List<Widget> widgetList = [];
    for (int index = 0;
        index < (homeSduiResponse?.data?.length ?? 0);
        index++) {
      Map<String, dynamic>? element = homeSduiResponse?.data?.elementAt(index);
      AppLog.i(element?["view_type"], tag: "view_type");

      switch (element?["view_type"]) {
        case "profile_info":
          ProfileInfo profileInfo = ProfileInfo.fromJson(element ?? {});

          widgetList.add(
            ProfileInfoSection(profileInfo: profileInfo),
          );
          break;
        case "banner_auto_scroll_carousel":
          BannerAutoScroll bannerAutoScroll =
              BannerAutoScroll.fromJson(element ?? {});

          widgetList
              .add(BannerAutoScrollSection(bannerAutoScroll: bannerAutoScroll));
          break;
        case "shop_by_categories":
          ShopByCategory shopByCategory =
              ShopByCategory.fromJson(element ?? {});

          widgetList.add(
            ShopByCategorySection(shopByCategory: shopByCategory),
          );
          break;
        case "product_widget_2":
          HomePageProduct homePageProduct =
              HomePageProduct.fromJson(element ?? {});

          widgetList.add(HomePageProductSection(
            homePageProduct: homePageProduct,
          ));
          break;
        case "product_widget_3":
          HomePageViewAllProductList homePageViewAllProductList =
              HomePageViewAllProductList.fromJson(element ?? {});

          widgetList.add(HomePageViewAllProductSection(
              homePageViewAllProductList: homePageViewAllProductList));
          break;
        default:
          widgetList.add(
            Text("Default Widget: No Title"),
          );
      }
    }
    return widgetList;
  }
}
