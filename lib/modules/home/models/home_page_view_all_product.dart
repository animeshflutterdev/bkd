import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

import 'package:bkd/services/helpers/value_handler.dart';

class HomePageViewAllProductList {
  int? msgcode;
  String? msgtext;
  String? viewType;
  List<Results>? results;

  HomePageViewAllProductList(
      {this.msgcode, this.msgtext, this.viewType, this.results});

  HomePageViewAllProductList.fromJson(Map<String, dynamic> json) {
    msgcode = json['msgcode'];
    msgtext = json['msgtext'];
    viewType = json['view_type'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msgcode'] = this.msgcode;
    data['msgtext'] = this.msgtext;
    data['view_type'] = this.viewType;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? title;
  String? permalink;
  String? showviewall;
  String? homePageDesc;
  String? homePageBanner;
  int? displaysequence;
  List<Products>? products;

  Results(
      {this.title,
        this.permalink,
        this.showviewall,
        this.homePageDesc,
        this.homePageBanner,
        this.displaysequence,
        this.products});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    permalink = json['Permalink'];
    showviewall = json['Showviewall'];
    homePageDesc = json['HomePageDesc'];
    homePageBanner = json['HomePageBanner'];
    displaysequence = json['Displaysequence'];
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Permalink'] = this.permalink;
    data['Showviewall'] = this.showviewall;
    data['HomePageDesc'] = this.homePageDesc;
    data['HomePageBanner'] = this.homePageBanner;
    data['Displaysequence'] = this.displaysequence;
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  String? productName;
  String? displayName;
  String? productAliasName;
  String? mrp;
  String? productImage;
  String? offerprice;
  String? discountpercentage;
  String? position;
  String? isCourierable;
  String? productImageUrl;
  String? isRedeemable;
  String? mfgGroup;
  String? encodeProdId;
  String? pTR;
  String? pTRDiscPercent;
  String? minQty;
  String? prescriptionOTC;

  Products(
      {this.productId,
        this.productName,
        this.displayName,
        this.productAliasName,
        this.mrp,
        this.productImage,
        this.offerprice,
        this.discountpercentage,
        this.position,
        this.isCourierable,
        this.productImageUrl,
        this.isRedeemable,
        this.mfgGroup,
        this.encodeProdId,
        this.pTR,
        this.pTRDiscPercent,
        this.minQty,
        this.prescriptionOTC});

  Products.fromJson(Map<String, dynamic> json) {
    productId = ValueHandler().stringify(json['ProductId']);
    productName = ValueHandler().stringify(json['ProductName']);
    displayName = ValueHandler().stringify(json['DisplayName']);
    productAliasName = ValueHandler().stringify(json['ProductAliasName']);
    mrp =ValueHandler().stringify( json['Mrp']);
    productImage = ValueHandler().stringify(json['ProductImage']);
    offerprice = ValueHandler().stringify(json['Offerprice']);
    discountpercentage = ValueHandler().stringify(json['Discountpercentage']);
    position = ValueHandler().stringify(json['position']);
    isCourierable = ValueHandler().stringify(json['isCourierable']);
    productImageUrl = ValueHandler().stringify(json['ProductImageUrl']);
    isRedeemable = ValueHandler().stringify(json['IsRedeemable']);
    mfgGroup = ValueHandler().stringify(json['MfgGroup']);
    encodeProdId = ValueHandler().stringify(json['EncodeProdId']);
    pTR = ValueHandler().stringify(json['PTR']);
    pTRDiscPercent = ValueHandler().stringify(json['PTRDiscPercent']);
    minQty = ValueHandler().stringify(json['MinQty']);
    prescriptionOTC = ValueHandler().stringify(json['PrescriptionOTC']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['DisplayName'] = this.displayName;
    data['ProductAliasName'] = this.productAliasName;
    data['Mrp'] = this.mrp;
    data['ProductImage'] = this.productImage;
    data['Offerprice'] = this.offerprice;
    data['Discountpercentage'] = this.discountpercentage;
    data['position'] = this.position;
    data['isCourierable'] = this.isCourierable;
    data['ProductImageUrl'] = this.productImageUrl;
    data['IsRedeemable'] = this.isRedeemable;
    data['MfgGroup'] = this.mfgGroup;
    data['EncodeProdId'] = this.encodeProdId;
    data['PTR'] = this.pTR;
    data['PTRDiscPercent'] = this.pTRDiscPercent;
    data['MinQty'] = this.minQty;
    data['PrescriptionOTC'] = this.prescriptionOTC;
    return data;
  }
}
