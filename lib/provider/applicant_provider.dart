import 'dart:convert';

import 'package:caf/model/applicant_model.dart';
import 'package:caf/services/applicant_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApplicantProvider extends ChangeNotifier {
  final ApplicationService _applicationService = ApplicationService();
  List<ApplicantModel> _applicants = [];
  List<ApplicantModel> get applicants => _applicants;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? _message;
  String? get message=>_message;
  String? get errorMessage => _errorMessage;
  void setLoading(bool loading){
    _isLoading=loading;
    _errorMessage=null;
    notifyListeners();
  }
  Future<void> insertData(ApplicantModel applicantData,String token) async {
    try {
      setLoading(true);
      await Future.delayed(const Duration(microseconds: 3));
      final response = await _applicationService.postData(applicantData,token);
      if(response.success){
        _message=response.message.toString();
      }
      else{
        _errorMessage=response.message;
      }
      setLoading(false);
      notifyListeners();
    } catch (e) {
      setLoading(false);
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  Future<String?> getUserID() async {
    return await _secureStorage.read(key: 'id');
  }

  Future<void> getApplicantsByUserId() async {
    try {
      String? userId=await getUserID()??"";
      String? token=await getToken()??"";
      
      setLoading(true);
      Future.delayed(const Duration(microseconds: 2));
      List<ApplicantModel> applicants = await ApplicationService().getByID(userId, token);
      _applicants = applicants;
      setLoading(false);
      notifyListeners();
    } catch (e) {
       setLoading(false);
      // Handle error
    }
  }


  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
