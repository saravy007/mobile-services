import 'dart:convert';
import 'package:caf/api/api_constant.dart';
import 'package:caf/model/applicant_model.dart';
import 'package:caf/model/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ApplicationService {
  final String baseUrl = ApiConstant.postApplicant;
  Future<ResponseModel> postData(ApplicantModel data, String token) async {
   if (token.isEmpty) {
     return ResponseModel(
       success: false,
       message: 'No token found. Please log in again.',
     );
   }

   try {
     final response = await http.post(
       Uri.parse("${ApiConstant.postApplicant}${data.byUser}"),
       headers: {
         'Content-Type': 'application/json',
         'Authorization': 'Bearer $token',
       },
       body: jsonEncode(data.toJson()),
     );
     
     if (response.statusCode == 200) {
       return ResponseModel(
         success: true,
         message: 'Data posted successfully',
         data: json.decode(response.body),
       );
     } else {
       return ResponseModel(
         success: false,
         message: 'Failed to post data',
         error: response.body,
       );
     }
   } catch (e) {
     return ResponseModel(
       success: false,
       message: 'Error posting data',
       error: e.toString(),
     );
   }
 }
  Future<List<ApplicantModel>> getByID (String userId,String token) async{
    print("${ApiConstant.postApplicant}by-user/${userId}");
    final response=await http.get(Uri.parse("${ApiConstant.postApplicant}by-user/${userId}"),
     headers: {
         'Content-Type': 'application/json',
         'Authorization': 'Bearer $token',
       },
    );
    print(response.headers);
    print(token);
    print(response.body);
    if (response.statusCode == 200) {
      return compute(applicantModelToJson, response.body);
    } else {
      throw Exception('Failed to load applicants');
    }
  }
}
