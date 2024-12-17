import 'package:caf/api/api_constant.dart';
import 'package:caf/model/message_model.dart';
import 'package:caf/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<MessageModel> insertData(UserModel userModel) async {
    http.Response response =
        await http.post(Uri.parse(ApiConstant.register), body: userModel.toJson());
    return compute(messageModelFromJson, response.body);
  }
  Future<MessageModel> updateData(UserModel userModel) async {
    http.Response response =
        await http.put(Uri.parse("userl"), body: userModel.toJson());
    return compute(messageModelFromJson, response.body);
  }
  Future<MessageModel> deleteData(dynamic id) async {
    http.Response response = await http.delete(Uri.parse("userl"), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer your_token',
    });
    return compute(messageModelFromJson, response.body);
  }
}
