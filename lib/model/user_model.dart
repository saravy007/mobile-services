import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String username;
  String email;
  String? id;  // Public id field
  String? phone;
  String? token;
  String? role;
  String? password;
  
  String? firstName;
  String? lastName;
  String? gender;
  DateTime? dob;
  String? address;
  String? msg="";

  String? confirmedPassword;
  UserModel({
    required this.username,
    required this.email,
     this.address,
     this.gender,
     this.dob,
     this.lastName,
     this.firstName,
     this.msg,
    this.role,
    this.id,
    this.token,
    this.confirmedPassword,
    required this.phone,
    required this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],  // Correct mapping for API
    username: json["username"],
    address: json["address"],
    gender: json["gender"],
    lastName: json["lastName"],
    firstName: json["firstName"],
    dob: json["dob"],
    email: json["email"],
    phone: json["phone"],
    role: json["role"],
    password: json["password"],
    msg: json["msg"],
    confirmedPassword: json["confirmedPassword"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,  // Correct mapping for API
    "username": username,
    "email": email,
    "role": role,
    "phone": phone,
    "password": password,
    "lastName":lastName,
    "firstName":firstName,
    "gender":gender,
    "dob":dob,
    "msg":msg,
    "confirmedPassword":confirmedPassword,
    "token": token,
  };
}
