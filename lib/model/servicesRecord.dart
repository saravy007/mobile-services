import 'dart:convert';
import 'package:http/http.dart' as http;
class ServiceRecord {
  String? id;
  String? byUser;
  String name;
  String gender;
  DateTime dob;
  String? address;
  DateTime? examDate;
  String? examCenter;
  int? room;
  int? seat;
  String? grade;
  String? phone;
  String service;
  ServiceTake? serviceTake;
  int? status;
  DateTime? createdDate;
  ServiceRecord({
    this.id,
    this.byUser,
    required this.name,
    required this.gender,
    required this.dob,
    this.address,
    this.examDate,
    this.examCenter,
    this.room,
    this.seat,
    this.grade,
    this.phone,
    required this.service,
    this.serviceTake,
    this.status,
    this.createdDate,
  });

  factory ServiceRecord.fromJson(Map<String, dynamic> json) {
    return ServiceRecord(
      id: json['_id'],
      byUser: json['byUser'],
      name: json['name'],
      gender: json['gender'],
      dob: DateTime.parse(json['dob']),
      address: json['address'],
      examDate: json['examDate'] != null ? DateTime.parse(json['examDate']) : null,
      examCenter: json['examCenter'],
      room: json['room'],
      seat: json['seat'],
      grade: json['grade'],
      phone: json['phone'],
      service: json['service'],
      serviceTake: json['serviceTake'] != null ? ServiceTake.fromJson(json['serviceTake']) : null,
      status: json['status'],
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'byUser': byUser,
      'name': name,
      'gender': gender,
      'dob': dob.toIso8601String(),
      'address': address,
      'examDate': examDate?.toIso8601String(),
      'examCenter': examCenter,
      'room': room,
      'seat': seat,
      'grade': grade,
      'phone': phone,
      'service': service,
      'serviceTake': serviceTake?.toJson(),
      'status': status,
      'createdDate': createdDate?.toIso8601String(),
    };
  }
}

class ServiceTake {
  String? id;
  bool? isName;
  String? oldName;
  String? newName;
  bool? isGender;
  String? oldGender;
  String? newGender;
  bool? isDob;
  String? oldDob;
  String? newDob;
  bool? isPob;
  String? oldPob;
  String? newPob;
  bool? isFather;
  String? oldFather;
  String? newFather;
  bool? isMother;
  String? oldMother;
  String? newMother;
  String? editAttach1;
  String? editAttach2;
  String? editAttach3;
  String? editAttach4;
  String? editAttach5;
  String? editAttach6;
  String? verifyByCertType;
  String? verifyAttach1;
  String? reissueAttach1;
  String? reissueAttach2;
  String? reissueAttach3;
  String? reissueAttach4;
  DateTime? createdDate;
  ServiceTake({
    this.id,
    this.isName,
    this.oldName,
    this.newName,
    this.isGender,
    this.oldGender,
    this.newGender,
    this.isDob,
    this.oldDob,
    this.newDob,
    this.isPob,
    this.oldPob,
    this.newPob,
    this.isFather,
    this.oldFather,
    this.newFather,
    this.isMother,
    this.oldMother,
    this.newMother,
    this.editAttach1,
    this.editAttach2,
    this.editAttach3,
    this.editAttach4,
    this.editAttach5,
    this.editAttach6,
    this.verifyByCertType,
    this.verifyAttach1,
    this.reissueAttach1,
    this.reissueAttach2,
    this.reissueAttach3,
    this.reissueAttach4,
    this.createdDate,
  });

  factory ServiceTake.fromJson(Map<String, dynamic> json) {
    return ServiceTake(
      id: json['_id'],
      isName: json['is_name'],
      oldName: json['old_name'],
      newName: json['new_name'],
      isGender: json['is_gender'],
      oldGender: json['old_gender'],
      newGender: json['new_gender'],
      isDob: json['is_dob'],
      oldDob: json['old_dob'],
      newDob: json['new_dob'],
      isPob: json['is_pob'],
      oldPob: json['old_pob'],
      newPob: json['new_pob'],
      isFather: json['is_father'],
      oldFather: json['old_father'],
      newFather: json['new_father'],
      isMother: json['is_mother'],
      oldMother: json['old_mother'],
      newMother: json['new_mother'],
      editAttach1: json['edit_attach1'],
      editAttach2: json['edit_attach2'],
      editAttach3: json['edit_attach3'],
      editAttach4: json['edit_attach4'],
      editAttach5: json['edit_attach5'],
      editAttach6: json['edit_attach6'],
      verifyByCertType: json['verifyByCertType'],
      verifyAttach1: json['verify_attach1'],
      reissueAttach1: json['reissue_attach1'],
      reissueAttach2: json['reissue_attach2'],
      reissueAttach3: json['reissue_attach3'],
      reissueAttach4: json['reissue_attach4'],
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'is_name': isName,
      'old_name': oldName,
      'new_name': newName,
      'is_gender': isGender,
      'old_gender': oldGender,
      'new_gender': newGender,
      'is_dob': isDob,
      'old_dob': oldDob,
      'new_dob': newDob,
      'is_pob': isPob,
      'old_pob': oldPob,
      'new_pob': newPob,
      'is_father': isFather,
      'old_father': oldFather,
      'new_father': newFather,
      'is_mother': isMother,
      'old_mother': oldMother,
      'new_mother': newMother,
      'edit_attach1': editAttach1,
      'edit_attach2': editAttach2,
      'edit_attach3': editAttach3,
      'edit_attach4': editAttach4,
      'edit_attach5': editAttach5,
      'edit_attach6': editAttach6,
      'verifyByCertType': verifyByCertType,
      'verify_attach1': verifyAttach1,
      'reissue_attach1': reissueAttach1,
      'reissue_attach2': reissueAttach2,
      'reissue_attach3': reissueAttach3,
      'reissue_attach4': reissueAttach4,
      'createdDate': createdDate?.toIso8601String(),
    };
  }
}
Future<void> insertServiceRecord(ServiceRecord serviceRecord) async {
  const url = 'YOUR_API_ENDPOINT_URL';
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        // Add authorization headers if required
      },
      body: jsonEncode(serviceRecord.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('Service record inserted successfully');
    } else {
      throw Exception('Failed to insert service record');
    }
  } catch (e) {
    print('Error inserting service record: $e');
    rethrow;
  }
}