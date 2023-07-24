// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.status,
    required this.message,
    required this.objList,
  });

  bool status;
  String message;
  List<ObjList> objList;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["Status"],
    message: json["Message"],
    objList: List<ObjList>.from(json["ObjList"].map((x) => ObjList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "ObjList": List<dynamic>.from(objList.map((x) => x.toJson())),
  };
}

class ObjList {
  ObjList({
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.categoryName,
    required this.discountInAmount,
    required this.mrp,
    required this.categoryId,
    required this.discountPrice,
    required this.posId,
    required this.redeemPoint,
    required this.vendorId,
    required this.businessValue,
  });

  int productId;
  String productName;
  String productImageUrl;
  CategoryName categoryName;
  int discountInAmount;
  int mrp;
  int categoryId;
  int discountPrice;
  int posId;
  int redeemPoint;
  int vendorId;
  int businessValue;

  factory ObjList.fromJson(Map<String, dynamic> json) => ObjList(
    productId: json["ProductId"],
    productName: json["ProductName"],
    productImageUrl: json["ProductImageUrl"],
    categoryName: categoryNameValues.map[json["CategoryName"]]!,
    discountInAmount: json["DiscountInAmount"],
    mrp: json["MRP"],
    categoryId: json["CategoryId"],
    discountPrice: json["DiscountPrice"],
    posId: json["POSId"],
    redeemPoint: json["RedeemPoint"],
    vendorId: json["VendorId"],
    businessValue: json["BusinessValue"],
  );

  Map<String, dynamic> toJson() => {
    "ProductId": productId,
    "ProductName": productName,
    "ProductImageUrl": productImageUrl,
    "CategoryName": categoryNameValues.reverse[categoryName],
    "DiscountInAmount": discountInAmount,
    "MRP": mrp,
    "CategoryId": categoryId,
    "DiscountPrice": discountPrice,
    "POSId": posId,
    "RedeemPoint": redeemPoint,
    "VendorId": vendorId,
    "BusinessValue": businessValue,
  };
}

enum CategoryName { FRUITS, VEGETABLES, EXOTIC_VEGETABLES }

final categoryNameValues = EnumValues({
  "Exotic Vegetables": CategoryName.EXOTIC_VEGETABLES,
  "Fruits": CategoryName.FRUITS,
  "Vegetables": CategoryName.VEGETABLES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
