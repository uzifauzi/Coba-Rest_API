import 'dart:convert';

List<UserModel> usersModelFromJson(String str) =>
  List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;

  UserModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
    );
  }
}
