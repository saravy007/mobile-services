import 'dart:convert';

List<ApplicantModel> applicantModelFromJson(String str) => List<ApplicantModel>.from(json.decode(str).map((x) => ApplicantModel.fromJson(x)));

String applicantModelToJson(List<ApplicantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<ApplicantModel> parseApplicantModels(String responseBody) {
  final parsed = jsonDecode(responseBody) as List;
  return parsed.map((json) => ApplicantModel.fromJson(json)).toList();
}

class ApplicantModel {
  final String name;
  final String? byUser;
  final String gender;
  final String dob;
  final String address;
  final String examDate;
  final String examCenter;
  final int room;
  final int seat;
  final String grade;
  final String phone;
  final String service;
  final bool? isName;
  final String? oldName;
  final String? newName;
  final bool? isGender;
  final String? oldGender;
  final String? newGender;
  final bool? isDob;
  final String? oldDob;
  final String? newDob;
  final bool? isPob;
  final String? oldPob;
  final String? newPob;
  final bool? isFather;
  final String? oldFather;
  final String? newFather;
  final bool? isMother;
  final String? oldMother;
  final String? newMother;
  final String? editAttach1;
  final String? editAttach2;
  final String? editAttach3;
  final String? editAttach4;
  final String? editAttach5;
  final String? editAttach6;
  final String? verifyAttach;
  final String? verifyAttach1;
  final String? verifyAttach2;
  final String? verifyAttach3;
  final String? verifyAttach4;
  final String? verifyByCertType;
  final String? reissueAttach1;
  final String? reissueAttach2;
  final String? reissueAttach3;
  final String? reissueAttach4;
  final ServiceTake? serviceTake;
  ApplicantModel({
    required this.name,
    this.byUser,
    required this.gender,
    required this.dob,
    required this.address,
    required this.examDate,
    required this.examCenter,
    required this.room,
    required this.seat,
    required this.grade,
    required this.phone,
    required this.service,
    this.isName,
    this.oldName,
    this.newName,
    this.isGender,
    this.oldGender,
    this.newGender,
    this.serviceTake,
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
    this.verifyAttach,
    this.verifyAttach1,
    this.verifyAttach2,
    this.verifyAttach3,
    this.verifyAttach4,
    this.verifyByCertType,
    this.reissueAttach1,
    this.reissueAttach2,
    this.reissueAttach3,
    this.reissueAttach4,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'byUser': byUser,
      'gender': gender,
      'dob': dob,
      'address': address,
      'examDate': examDate,
      'examCenter': examCenter,
      'room': room,
      'seat': seat,
      'grade': grade,
      'phone': phone,
      'service': service,
      'is_name': isName,
      'old_name': oldName,
      'new_name': newName,
      'is_gender': isGender,
      'old_gender': oldGender,
      'new_gender': newGender,
      'serviceTake': serviceTake?.toJson(),
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
      'verify_attach': verifyAttach,
      'verify_attach1': verifyAttach1,
      'verify_attach2': verifyAttach2,
      'verify_attach3': verifyAttach3,
      'verify_attach4': verifyAttach4,
      'verify_by_cert_type': verifyByCertType,
      'reissue_attach1': reissueAttach1,
      'reissue_attach2': reissueAttach2,
      'reissue_attach3': reissueAttach3,
      'reissue_attach4': reissueAttach4,
    };
  }
  factory ApplicantModel.fromJson(Map<String, dynamic> json) {
 return ApplicantModel(
   name: json['name'] ?? '',
   byUser: json['byUser'],
   gender: json['gender'] ?? '',
   dob: json['dob'] ?? '',
   address: json['address'] ?? '',
   examDate: json['examDate'] ?? '',
   examCenter: json['examCenter'] ?? '',
   serviceTake: json['serviceTake'] != null ? ServiceTake.fromJson(json['serviceTake']) : null,
   room: json['room'] ?? 0,
   seat: json['seat'] ?? 0,
   grade: json['grade'] ?? '',
   phone: json['phone'] ?? '',
   service: json['service'] ?? '',
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
   verifyAttach: json['verify_attach'],
   verifyAttach1: json['verify_attach1'],
   verifyAttach2: json['verify_attach2'],
   verifyAttach3: json['verify_attach3'],
   verifyAttach4: json['verify_attach4'],
   verifyByCertType: json['verify_by_cert_type'],
   reissueAttach1: json['reissue_attach1'],
   reissueAttach2: json['reissue_attach2'],
   reissueAttach3: json['reissue_attach3'],
   reissueAttach4: json['reissue_attach4'],
 );
}
}

class edit {
    String? id;
    bool? isName;
    String? oldName="";
    String? newName="";
    bool? isGender=false;
    String? oldGender="";
    String? newGender="";
    bool? isDob=false;
    String? oldDob="";
    String? newDob="";
    bool? isPob=false;
    String? oldPob="";
    String? newPob="";
    bool? isFather=false;
    String? oldFather="";
    String? newFather="";
    bool? isMother=false;
    String? oldMother="";
    String? newMother="";
    String? editAttach1="";
    String? editAttach2="";
    String? editAttach3="";
    String? editAttach4="";
    String? editAttach5="";
    String? editAttach6="";
    DateTime? createdDate=DateTime.now();
    int? v;
    String? verifyByCertType;
    String? verifyAttach1;
    String? reissueAttach1;
    String? reissueAttach2;
    String? reissueAttach3;
    String? reissueAttach4;

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
         this.createdDate,
         this.v,
         this.verifyByCertType,
         this.verifyAttach1,
         this.reissueAttach1,
         this.reissueAttach2,
         this.reissueAttach3,
         this.reissueAttach4,
    });

    factory ServiceTake.fromJson(Map<String, dynamic> json) => ServiceTake(
        id: json["_id"],
        isName: json["is_name"],
        oldName: json["old_name"],
        newName: json["new_name"],
        isGender: json["is_gender"],
        oldGender: json["old_gender"],
        newGender: json["new_gender"],
        isDob: json["is_dob"],
        oldDob: json["old_dob"],
        newDob: json["new_dob"],
        isPob: json["is_pob"],
        oldPob: json["old_pob"],
        newPob: json["new_pob"],
        isFather: json["is_father"],
        oldFather: json["old_father"],
        newFather: json["new_father"],
        isMother: json["is_mother"],
        oldMother: json["old_mother"],
        newMother: json["new_mother"],
        editAttach1: json["edit_attach1"],
        editAttach2: json["edit_attach2"],
        editAttach3: json["edit_attach3"],
        editAttach4: json["edit_attach4"],
        editAttach5: json["edit_attach5"],
        editAttach6: json["edit_attach6"],
        createdDate: DateTime.parse(json["createdDate"]),
        v: json["__v"],
        verifyByCertType: json["verifyByCertType"],
        verifyAttach1: json["verify_attach1"],
        reissueAttach1: json["reissue_attach1"],
        reissueAttach2: json["reissue_attach2"],
        reissueAttach3: json["reissue_attach3"],
        reissueAttach4: json["reissue_attach4"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "is_name": isName,
        "old_name": oldName,
        "new_name": newName,
        "is_gender": isGender,
        "old_gender": oldGender,
        "new_gender": newGender,
        "is_dob": isDob,
        "old_dob": oldDob,
        "new_dob": newDob,
        "is_pob": isPob,
        "old_pob": oldPob,
        "new_pob": newPob,
        "is_father": isFather,
        "old_father": oldFather,
        "new_father": newFather,
        "is_mother": isMother,
        "old_mother": oldMother,
        "new_mother": newMother,
        "edit_attach1": editAttach1,
        "edit_attach2": editAttach2,
        "edit_attach3": editAttach3,
        "edit_attach4": editAttach4,
        "edit_attach5": editAttach5,
        "edit_attach6": editAttach6,
        "createdDate": createdDate,
        "__v": v,
        "verifyByCertType": verifyByCertType,
        "verify_attach1": verifyAttach1,
        "reissue_attach1": reissueAttach1,
        "reissue_attach2": reissueAttach2,
        "reissue_attach3": reissueAttach3,
        "reissue_attach4": reissueAttach4,
    };
}