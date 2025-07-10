class HomePageResponse {
  final List<HomePageSection> data;

  HomePageResponse({required this.data});

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      HomePageResponse(
        data: (json['data'] as List<dynamic>?)
                ?.map(
                    (e) => HomePageSection.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );
}

extension HomePageResponseHelpers on HomePageResponse {
  HomePageSection? get profileInfoSection =>
      data.firstWhere((s) => s.viewType == 'profile_info',);

  HomePageSection? get bannerSection =>
      data.firstWhere((s) => s.viewType == 'banner_auto_scroll_carousel', );

  List<HomePageSection> get productSections =>
      data.where((s) => s.viewType == 'product_widget_2' || s.viewType == 'homepageproduct').toList();
}

class HomePageSection {
  // Common fields
  final String? viewType;
  final String? subViewType;
  final int? msgCode;
  final String? msgText;
  final String? title;
  final String? imageUrl;
  final int? count;
  final String? today;
  final String? viewtype; // for inconsistent key
  final String? subTitle;
  final String? isShow;
  final List<dynamic>? results; // Always keep raw results

  HomePageSection({
    this.viewType,
    this.subViewType,
    this.msgCode,
    this.msgText,
    this.title,
    this.imageUrl,
    this.count,
    this.today,
    this.viewtype,
    this.subTitle,
    this.isShow,
    this.results,
  });

  factory HomePageSection.fromJson(Map<String, dynamic> json) {
    final viewType = json['view_type'] ?? json['viewtype'];
    final results = json['results'] as List<dynamic>?;
    return HomePageSection(
      viewType: viewType,
      subViewType: json['sub_view_type'],
      msgCode: json['msgcode'],
      msgText: json['msgtext'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      count: json['count'],
      today: json['today'],
      viewtype: json['viewtype'],
      subTitle: json['sub_title'],
      isShow: json['is_show'],
      results: results,
    );
  }

  /// Helper: parse results to a specific model based on viewType
  /// Usage: section.parseResults((e) => CategoryItem.fromJson(e))
  List<T> parseResults<T>(T Function(Map<String, dynamic>) fromJson) {
    if (results == null) return [];
    return results!
        .whereType<Map<String, dynamic>>()
        .map((e) => fromJson(e))
        .toList();
  }
}

extension HomePageSectionHelpers on HomePageSection {
  List<InfoResult> get infoResults =>
      results?.map((e) => InfoResult.fromJson(e)).toList() ?? [];

  List<BannerItem> get bannerResults =>
      results?.map((e) => BannerItem.fromJson(e)).toList() ?? [];

  List<ProductItem> get productResults =>
      results?.map((e) => ProductItem.fromJson(e)).toList() ?? [];
}

class InfoResult {
  final String? title;
  final String? desc;
  final String? actionUrl;

  InfoResult({this.title, this.desc, this.actionUrl});

  factory InfoResult.fromJson(Map<String, dynamic> json) => InfoResult(
        title: json['title'],
        desc: json['desc'],
        actionUrl: json['actionUrl'],
      );
}

class CategoryItem {
  final String? id;
  final String? label;
  final int? displaySequence;
  final String? actionUrl;
  final String? imageUrl;
  final String? transKey;
  final String? comments;

  CategoryItem({
    this.id,
    this.label,
    this.displaySequence,
    this.actionUrl,
    this.imageUrl,
    this.transKey,
    this.comments,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json['id'],
        label: json['Label'],
        displaySequence: json['DisplaySequence'],
        actionUrl: json['ActionUrl'],
        imageUrl: json['ImageUrl'],
        transKey: json['TransKey'],
        comments: json['Commnets'],
      );
}

class BannerItem {
  final String? bannerId;
  final String? pagePlaceholder;
  final String? placeholder;
  final int? displaySeq;
  final String? startDate;
  final String? endDate;
  final String? apiVersion;
  final int? resolutionType;
  final String? deviceType;
  final String? bannerImage;
  final String? webImage;
  final String? entryPoint;
  final String? subCat;
  final String? innerCat;
  final String? categoryTitle;
  final String? categoryId;
  final dynamic warehouseId;
  final String? tierCategoryId;
  final String? longDesc;
  final int? isNewShopBanner;
  final String? webImageUrl;
  final List<int>? tierCategoryIds;

  BannerItem({
    this.bannerId,
    this.pagePlaceholder,
    this.placeholder,
    this.displaySeq,
    this.startDate,
    this.endDate,
    this.apiVersion,
    this.resolutionType,
    this.deviceType,
    this.bannerImage,
    this.webImage,
    this.entryPoint,
    this.subCat,
    this.innerCat,
    this.categoryTitle,
    this.categoryId,
    this.warehouseId,
    this.tierCategoryId,
    this.longDesc,
    this.isNewShopBanner,
    this.webImageUrl,
    this.tierCategoryIds,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
        bannerId: json['BannerId'],
        pagePlaceholder: json['PagePlaceholder'],
        placeholder: json['Placeholder'],
        displaySeq: json['DisplaySeq'],
        startDate: json['StartDate'],
        endDate: json['EndDate'],
        apiVersion: json['APIVersion'],
        resolutionType: json['ResolutionType'],
        deviceType: json['DeviceType'],
        bannerImage: json['BannerImage'],
        webImage: json['WebImage'],
        entryPoint: json['Entry_Point'],
        subCat: json['Sub_Cat'],
        innerCat: json['Inner_Cat'],
        categoryTitle: json['Category_Title'],
        categoryId: json['Category_Id'],
        warehouseId: json['WarehouseId'],
        tierCategoryId: json['TierCategoryId'],
        longDesc: json['LongDesc'],
        isNewShopBanner: json['IsNewShopBanner'],
        webImageUrl: json['WebImageUrl'],
        tierCategoryIds: (json['TierCategoryIds'] as List?)
            ?.map((e) => e is int ? e : int.tryParse(e.toString()) ?? 0)
            .toList(),
      );
}

class ProductItem {
  final int? productId;
  final String? productName;
  final String? productImage;
  final num? mrp;
  final num? offerPrice;
  final String? productImageUrl;
  final String? prescriptionOtc;
  final int? displaySeq;
  final String? encodeProdId;
  final String? mfgGroup;
  final String? displayName;
  final int? discount;
  final int? minQty;
  final int? discountPercent;
  final num? ptr;
  final int? ptrDiscPercent;

  ProductItem({
    this.productId,
    this.productName,
    this.productImage,
    this.mrp,
    this.offerPrice,
    this.productImageUrl,
    this.prescriptionOtc,
    this.displaySeq,
    this.encodeProdId,
    this.mfgGroup,
    this.displayName,
    this.discount,
    this.minQty,
    this.discountPercent,
    this.ptr,
    this.ptrDiscPercent,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        productId: json['ProductId'],
        productName: json['ProductName'],
        productImage: json['ProductImage'],
        mrp: json['MRP'] ?? json['Mrp'],
        offerPrice: json['OfferPrice'] ?? json['Offerprice'],
        productImageUrl: json['ProductImageUrl'],
        prescriptionOtc: json['PrescriptionOTC'] ?? json['PrescriptionOtc'],
        displaySeq: json['DisplaySeq'],
        encodeProdId: json['EncodeProdId'],
        mfgGroup: json['MfgGroup'],
        displayName: json['DisplayName'],
        discount: json['Discount'] ?? json['Discountpercentage'],
        minQty: json['MinQty'],
        discountPercent: json['DiscountPercent'] ?? json['Discountpercentage'],
        ptr: json['PTR'],
        ptrDiscPercent: json['PTRDiscPercent'],
      );
}

class ProductWidgetGroup {
  final String? title;
  final String? permalink;
  final String? showViewAll;
  final String? homePageDesc;
  final String? homePageBanner;
  final int? displaySequence;
  final List<ProductItem>? products;

  ProductWidgetGroup({
    this.title,
    this.permalink,
    this.showViewAll,
    this.homePageDesc,
    this.homePageBanner,
    this.displaySequence,
    this.products,
  });

  factory ProductWidgetGroup.fromJson(Map<String, dynamic> json) =>
      ProductWidgetGroup(
        title: json['Title'],
        permalink: json['Permalink'],
        showViewAll: json['Showviewall'],
        homePageDesc: json['HomePageDesc'],
        homePageBanner: json['HomePageBanner'],
        displaySequence: json['Displaysequence'],
        products: (json['Products'] as List?)
            ?.map((e) => ProductItem.fromJson(e))
            .toList(),
      );
}
