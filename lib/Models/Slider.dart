// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.objList,
  });

  final List<ObjList>? objList;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    objList: json["ObjList"] == null ? [] : List<ObjList>.from(json["ObjList"]!.map((x) => ObjList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ObjList": objList == null ? [] : List<dynamic>.from(objList!.map((x) => x.toJson())),
  };
}

class ObjList {
  ObjList({
    this.subCategoryId,
    this.subCategoryName,
    this.sliderId,
    this.sliderImageUrl,
  });

  final int? subCategoryId;
  final dynamic subCategoryName;
  final int? sliderId;
  final String? sliderImageUrl;

  factory ObjList.fromJson(Map<String, dynamic> json) => ObjList(
    subCategoryId: json["SubCategoryID"],
    subCategoryName: json["SubCategoryName"],
    sliderId: json["SliderID"],
    sliderImageUrl: json["SliderImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "SubCategoryID": subCategoryId,
    "SubCategoryName": subCategoryName,
    "SliderID": sliderId,
    "SliderImageUrl": sliderImageUrl,
  };
}
