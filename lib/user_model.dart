import 'dart:convert';

import 'package:coba_rest_api/address_model.dart';
import 'package:coba_rest_api/company_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

List<UserModel> usersModelFromJson(String str) =>
  List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UserModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json["id"],
  //     name: json["name"],
  //     username: json["username"],
  //     email: json["email"],
  //     address: json["address"],
  //   );
  // }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
