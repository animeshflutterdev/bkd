import 'package:bkd/services/helpers/value_handler.dart';

class BannerAutoScroll {
  String? viewType;
  String? subViewType;
  int? msgcode;
  String? msgtext;
  String? title;
  List<Results>? results;

  BannerAutoScroll(
      {this.viewType,
        this.subViewType,
        this.msgcode,
        this.msgtext,
        this.title,
        this.results});

  BannerAutoScroll.fromJson(Map<String, dynamic> json) {
    viewType = json['view_type'];
    subViewType = json['sub_view_type'];
    msgcode = json['msgcode'];
    msgtext = json['msgtext'];
    title = json['title'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view_type'] = this.viewType;
    data['sub_view_type'] = this.subViewType;
    data['msgcode'] = this.msgcode;
    data['msgtext'] = this.msgtext;
    data['title'] = this.title;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? bannerId;
  String? pagePlaceholder;
  String? placeholder;
  String? displaySeq;
  String? startDate;
  String? endDate;
  String? aPIVersion;
  String? resolutionType;
  String? deviceType;
  String? bannerImage;
  String? webImage;
  String? entryPoint;
  String? subCat;
  String? innerCat;
  String? categoryTitle;
  String? categoryId;
  String? warehouseId;
  String? tierCategoryId;
  String? longDesc;
  String? isNewShopBanner;
  String? webImageUrl;
  List<int>? tierCategoryIds;

  Results(
      {this.bannerId,
        this.pagePlaceholder,
        this.placeholder,
        this.displaySeq,
        this.startDate,
        this.endDate,
        this.aPIVersion,
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
        this.tierCategoryIds});

  Results.fromJson(Map<String, dynamic> json) {
    bannerId = ValueHandler().stringify(json['BannerId']);
    pagePlaceholder = ValueHandler().stringify(json['PagePlaceholder']);
    placeholder = ValueHandler().stringify(json['Placeholder']);
    displaySeq = ValueHandler().stringify(json['DisplaySeq']);
    startDate = ValueHandler().stringify(json['StartDate']);
    endDate = ValueHandler().stringify(json['EndDate']);
    aPIVersion = ValueHandler().stringify(json['APIVersion']);
    resolutionType = ValueHandler().stringify(json['ResolutionType']);
    deviceType = ValueHandler().stringify(json['DeviceType']);
    bannerImage = ValueHandler().stringify(json['BannerImage']);
    webImage = ValueHandler().stringify(json['WebImage']);
    entryPoint = ValueHandler().stringify(json['Entry_Point']);
    subCat = ValueHandler().stringify(json['Sub_Cat']);
    innerCat = ValueHandler().stringify(json['Inner_Cat']);
    categoryTitle = ValueHandler().stringify(json['Category_Title']);
    categoryId = ValueHandler().stringify(json['Category_Id']);
    warehouseId = ValueHandler().stringify(json['WarehouseId']);
    tierCategoryId = ValueHandler().stringify(json['TierCategoryId']);
    longDesc = ValueHandler().stringify(json['LongDesc']);
    isNewShopBanner = ValueHandler().stringify(json['IsNewShopBanner']);
    webImageUrl = ValueHandler().stringify(json['WebImageUrl']);
    tierCategoryIds = json['TierCategoryIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BannerId'] = this.bannerId;
    data['PagePlaceholder'] = this.pagePlaceholder;
    data['Placeholder'] = this.placeholder;
    data['DisplaySeq'] = this.displaySeq;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['APIVersion'] = this.aPIVersion;
    data['ResolutionType'] = this.resolutionType;
    data['DeviceType'] = this.deviceType;
    data['BannerImage'] = this.bannerImage;
    data['WebImage'] = this.webImage;
    data['Entry_Point'] = this.entryPoint;
    data['Sub_Cat'] = this.subCat;
    data['Inner_Cat'] = this.innerCat;
    data['Category_Title'] = this.categoryTitle;
    data['Category_Id'] = this.categoryId;
    data['WarehouseId'] = this.warehouseId;
    data['TierCategoryId'] = this.tierCategoryId;
    data['LongDesc'] = this.longDesc;
    data['IsNewShopBanner'] = this.isNewShopBanner;
    data['WebImageUrl'] = this.webImageUrl;
    data['TierCategoryIds'] = this.tierCategoryIds;
    return data;
  }
}
