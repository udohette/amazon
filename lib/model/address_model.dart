import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AddressModel{
  String? name;
  String? mobileNumber;
  String? houseNumber;
  String? area;
  String? landmark;
  String? pinCode;
  String? town;
  String? state;
  bool? isDefault;
  String? docID;

  //AddressModel.addressModel();

  AddressModel([this.name, this.mobileNumber, this.houseNumber, this.area, this.landmark, this.pinCode, this.town, this.state, this.isDefault, this.docID]);

  factory AddressModel.fromMap(Map<String, dynamic> json) {
    return AddressModel(
    json['name'] != null ? json['name'] as String : null,
    json['mobileNumber'] != null ? json['mobileNumber'] as String : null,
    json['houseNumber'] != null ? json['houseNumber'] as String?: null,
    json['area'] != null ? json['area'] as String:null,
    json['landmark']  != null ? json['landmark'] as String: null,
    json['pinCode'] != null ? json['pinCode'] as String: null,
    json['town'] != null ? json['town'] as String: null,
    json['state'] != null ? json['state'] as String:null,
    json['isDefault'] != null ? json['isDefault'] as bool:null,
      json['docID'] != null ? json['docID'] as String:null,
  );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
        'name': name,
        'mobileNumber': mobileNumber,
        'houseNumber': houseNumber,
        'area':area,
        'landmark': landmark,
        'pinCode': pinCode,
        'town': town,
        'state': state,
        'isDefault': isDefault,
        'docID': docID
      };
  }
  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>  AddressModel.fromMap(json.decode(source));


}