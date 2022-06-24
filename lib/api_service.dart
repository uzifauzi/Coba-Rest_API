import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:coba_rest_api/constants.dart';
import 'package:coba_rest_api/user_model.dart';
import 'package:flutter/services.dart';

class ApiService {

  Future<List<UserModel>?> getUsers() async {
     try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
       var _model = usersModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  Future<UserModel?> getUser(int z) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint + '/$z');
      var response = await http.get(url);
      if (response.statusCode == 200) {
       var _model = UserModel.fromJson(jsonDecode(response.body));
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}