import 'dart:convert';

import 'package:caf/model/user_model.dart';
import 'package:caf/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLogIn = false;
  String? _token;
  UserModel? _userModel;
  bool get isLogIn => _isLogIn;
  String? get token => _token;
  bool _loading = false;
  bool get loading => _loading;
  UserModel? get user => _userModel;
  String? _msg="";

  String? get msg => _msg;

  void setMsg(String message){
    _msg=message;
    notifyListeners();
  }

  final bool _rememberPassword = false;
  bool get rememberPassword => _rememberPassword;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  Future<void> loginSuccess() async {
    _isLogIn = true;
    notifyListeners();
  }

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  void disableLoading() {
    _loading = false;
    notifyListeners();
  }

  Future<void> loginUnsccess() async {
    _isLogIn = false;
    notifyListeners();
  }

  Future<UserModel?> loadProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    String? token = await _secureStorage.read(key: 'token');
    String? name = await _secureStorage.read(key: 'username');
    String? phone = await _secureStorage.read(key: 'phone');
    String? email = await _secureStorage.read(key: 'email');
    String? password = await _secureStorage.read(key: 'password');
    final String? id = await _secureStorage.read(key: 'id');

    String? lastName = await _secureStorage.read(key: 'firstName');
    String? firstName = await _secureStorage.read(key: 'lastName');
    String? dob = await _secureStorage.read(key: 'dob');
    String? gender = await _secureStorage.read(key: 'gender');
    String? address = await _secureStorage.read(key: 'address');

    if (token != null && email != null) {
      loginSuccess();
      _userModel = UserModel(
          id: id ?? "no id",
          username: name ?? 'Unknown',
          email: email,
          password: password ?? "password",
          phone: phone ?? "");
      return _userModel; // Ensure this always returns a UserModel instance
    } else {
      loginUnsccess();
      return null; // Return null if the user data is incomplete
    }
    notifyListeners();
  }

  Future<void> login(
      String username, String password, bool rememberPassword) async {
    try {
      UserModel response = await _authService.login(username, password);

      if (response.token != null) {
        loginSuccess();
        if (rememberPassword) {
          await _secureStorage.write(key: 'token', value: response.token);
          await _secureStorage.write(key: 'password', value: password);
          await _secureStorage.write(key: 'id', value: response.id.toString());
          await _secureStorage.write(key: 'email', value: response.email);
          await _secureStorage.write(key: 'username', value: response.username);
          await _secureStorage.write(key: 'lastName', value: response.lastName);
          await _secureStorage.write(key: 'firstName', value: response.firstName);
          await _secureStorage.write(key: 'gender', value: response.gender);
          await _secureStorage.write(key: 'dob', value: response.dob.toString());
        } else {
          await _secureStorage.deleteAll();
        }
      } else {

      }
      notifyListeners();
    } catch (error) {}
    notifyListeners();
  }

  Future<void> signUp(UserModel user) async {
  try {
    // Set loading state before making the API call
    setLoading();
    await _secureStorage.deleteAll();
    UserModel response = await _authService.signUp(user);
    

    // If the response contains a valid token, save user data in secure storage
    if (response.token != null) {
      await _secureStorage.write(key: 'token', value: response.token);
      await _secureStorage.write(key: 'password', value: response.password);
      await _secureStorage.write(key: 'id', value: response.id.toString());
      await _secureStorage.write(key: 'email', value: response.email);
      await _secureStorage.write(key: 'username', value: response.username);
      await _secureStorage.write(key: 'phone', value: response.phone);
      await _secureStorage.write(key: 'lastName', value: response.lastName);
      await _secureStorage.write(key: 'firstName', value: response.firstName);
      await _secureStorage.write(key: 'gender', value: response.gender);
      await _secureStorage.write(key: 'dob', value: response.dob.toString());
      await _secureStorage.write(key: 'address', value: response.address.toString());
      setMsg("success");
    } else {
      setMsg(response.msg.toString());
      await _secureStorage.deleteAll();
    }
  } catch (error) {
    setMsg("Signup failed. Please try again.");
  } finally {
    disableLoading();
    notifyListeners();
  }
}
Future<void> logOut() async {
    _token = null;
    _userModel = null;
    _msg="";
    await loginUnsccess();
    await _secureStorage.deleteAll();
    notifyListeners();
  }
}
