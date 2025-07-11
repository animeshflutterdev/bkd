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

class HomePageProduct {
  int? msgcode;
  String? msgtext;
  String? viewtype;
  List<Results>? results;
  int? count;
  String? title;
  String? subTitle;
  String? viewType;

  HomePageProduct(
      {this.msgcode,
        this.msgtext,
        this.viewtype,
        this.results,
        this.count,
        this.title,
        this.subTitle,
        this.viewType});

  HomePageProduct.fromJson(Map<String, dynamic> json) {
    msgcode = json['msgcode'];
    msgtext = json['msgtext'];
    viewtype = json['viewtype'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    count = json['count'];
    title = json['title'];
    subTitle = json['sub_title'];
    viewType = json['view_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msgcode'] = this.msgcode;
    data['msgtext'] = this.msgtext;
    data['viewtype'] = this.viewtype;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['view_type'] = this.viewType;
    return data;
  }
}

class Results {
  String? productId;
  String? productName;
  String? productImage;
  String? mRP;
  String? offerPrice;
  String? productImageUrl;
  String? prescriptionOTC;
  String? displaySeq;
  String? encodeProdId;
  String? mfgGroup;
  String? displayName;
  String? discount;
  String? minQty;
  String? discountPercent;
  String? pTR;
  String? pTRDiscPercent;

  Results(
      {this.productId,
        this.productName,
        this.productImage,
        this.mRP,
        this.offerPrice,
        this.productImageUrl,
        this.prescriptionOTC,
        this.displaySeq,
        this.encodeProdId,
        this.mfgGroup,
        this.displayName,
        this.discount,
        this.minQty,
        this.discountPercent,
        this.pTR,
        this.pTRDiscPercent});

  Results.fromJson(Map<String, dynamic> json) {
    productId = ValueHandler().stringify(json['ProductId']);
    productName = ValueHandler().stringify(json['ProductName']);
    productImage = ValueHandler().stringify(json['ProductImage']);
    mRP = ValueHandler().stringify(json['MRP']);
    offerPrice = ValueHandler().stringify(json['OfferPrice']);
    productImageUrl = ValueHandler().stringify(json['ProductImageUrl']);
    prescriptionOTC = ValueHandler().stringify(json['PrescriptionOTC']);
    displaySeq = ValueHandler().stringify(json['DisplaySeq']);
    encodeProdId = ValueHandler().stringify(json['EncodeProdId']);
    mfgGroup = ValueHandler().stringify(json['MfgGroup']);
    displayName = ValueHandler().stringify(json['DisplayName']);
    discount = ValueHandler().stringify(json['Discount']);
    minQty = ValueHandler().stringify(json['MinQty']);
    discountPercent = ValueHandler().stringify(json['DiscountPercent']);
    pTR = ValueHandler().stringify(json['PTR']);
    pTRDiscPercent = ValueHandler().stringify(json['PTRDiscPercent']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['ProductImage'] = this.productImage;
    data['MRP'] = this.mRP;
    data['OfferPrice'] = this.offerPrice;
    data['ProductImageUrl'] = this.productImageUrl;
    data['PrescriptionOTC'] = this.prescriptionOTC;
    data['DisplaySeq'] = this.displaySeq;
    data['EncodeProdId'] = this.encodeProdId;
    data['MfgGroup'] = this.mfgGroup;
    data['DisplayName'] = this.displayName;
    data['Discount'] = this.discount;
    data['MinQty'] = this.minQty;
    data['DiscountPercent'] = this.discountPercent;
    data['PTR'] = this.pTR;
    data['PTRDiscPercent'] = this.pTRDiscPercent;
    return data;
  }
}
