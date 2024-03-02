import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel {
  String? name;
  String? mobileNum;
  String? userType;

  UserModel(
      {required this.name, required this.mobileNum, required this.userType});

  //from Json
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      mobileNum: map['mobileNum'] != null ? map['mobileNum'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
    );
    //factory UserModel.fromJson(Map<String, dynamic> map )=> _$UserModelFromJson(map);
  }

  //toJson
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNum': mobileNum,
      'userType': userType,
    };
    //Map<String, dynamic> toJson() => _$UserModelToJson(this);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
