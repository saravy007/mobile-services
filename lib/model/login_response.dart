
import 'package:caf/model/user_model.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String token;
    String tokenType;
    UserModel user;
    bool success;
    String message;

    LoginResponse({
        required this.token,
        required this.tokenType,
        required this.user,
        required this.success,
        required this.message,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        tokenType: json["token_type"],
        user: UserModel.fromJson(json["user"]),
        
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user.toJson(),
        "success": success,
        "message": message,
    };
}

