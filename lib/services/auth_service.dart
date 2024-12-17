import 'dart:async';
import 'dart:convert';
import 'package:caf/api/api_constant.dart';
import 'package:caf/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserModel> login(String username, String password) async {
    try {
      print(ApiConstant.login);
      final response = await http.post(
        Uri.parse(ApiConstant.login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ',
        },
        body: json.encode({
          "email": username,
          "password": password
          // "remember_me": rememberMe
        }),
      );

      if (response.statusCode == 200) {
        return await compute(userModelFromJson, response.body);
      } else {
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the request or JSON parsing
      throw Exception('Login failed: $e');
    }
  }

Future<UserModel> signUp(UserModel user) async {
  print('Sending request to: ${ApiConstant.register}');
  try {
    final response = await http.post(
      Uri.parse(ApiConstant.register),
       headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return compute(userModelFromJson, response.body);
    } else {
      final errorJson = jsonDecode(response.body);
      final List<String> errorMessages = (errorJson['error'] as List)
          .map((e) => e['msg'] as String)
          .toList();

      UserModel userModel=UserModel(
        email: user.email,
        phone: user.phone,
        username: user.username,
        password: user.password,
        msg: errorMessages.first,
      );
      // Return a UserModel with the `errors` field containing messages
      return  userModel;
    }
  } catch (e) {
    print('An error occurred: $e');
    rethrow; // Keeps the original exception
  }
}
}