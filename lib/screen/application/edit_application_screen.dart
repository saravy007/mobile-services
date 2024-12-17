import 'dart:convert';

import 'package:caf/basic_app.dart';
import 'package:caf/language/language_constant.dart';
import 'package:caf/main.dart';
import 'package:caf/model/applicant_model.dart';
import 'package:caf/provider/applicant_provider.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/settings/app_color.dart';
import 'package:caf/settings/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class EditApplicationScreen extends StatefulWidget {
  const EditApplicationScreen({super.key});

  @override
  State<EditApplicationScreen> createState() => _EditApplicationScreenState();
}

class _EditApplicationScreenState extends State<EditApplicationScreen> {
  // Checkbox states
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool is_dob = false;
  bool is_pob = false;
  bool is_name = false;
  bool is_father = false;
  bool is_mother = false;
  bool is_gender = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController seatController = TextEditingController();
  final TextEditingController examCenterController = TextEditingController();
  final TextEditingController dateExamController = TextEditingController();
  // Controllers
  final TextEditingController oldNameController = TextEditingController();
  final TextEditingController newNameController = TextEditingController();
  final TextEditingController oldGenderController = TextEditingController();
  final TextEditingController newGenderController = TextEditingController();
  final TextEditingController oldDobController = TextEditingController();
  final TextEditingController newDobController = TextEditingController();
  final TextEditingController oldPobController = TextEditingController();
  final TextEditingController newPobController = TextEditingController();
  final TextEditingController oldFatherController = TextEditingController();
  final TextEditingController newFatherController = TextEditingController();
  final TextEditingController oldMotherController = TextEditingController();
  final TextEditingController newMotherController = TextEditingController();
  final TextEditingController editAttach1Controller = TextEditingController();
  final TextEditingController editAttach2Controller = TextEditingController();
  final TextEditingController editAttach3Controller = TextEditingController();
  final TextEditingController editAttach4Controller = TextEditingController();
  final TextEditingController editAttach5Controller = TextEditingController();
  final TextEditingController editAttach6Controller = TextEditingController();
  Language _lang = Khmer();
  Widget _buildTextFormField({
    required String labelText,
    required TextEditingController controller,
    bool readOnly = true,
    bool enable = false,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: false,
      decoration: InputDecoration(labelText: labelText, enabled: enable),
    );
  }

  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageProvider>().lang;
    return Scaffold(
      appBar: AppBar(
        title: Text(_lang.editAttach),
      ),
      body: Center(
        child: Container(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              SizedBox(
                  height: 60,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: const Color(0XFF0078d4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _lang.personalInfo,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: AppFont.appBarFont,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 8.0,
              ),
              _buildNameTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildGenderTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildDobTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildPhoneTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildAddressTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildExamCentrTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildRoomTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildSeatTxt(),
              const SizedBox(
                height: 8.0,
              ),
              _buildexamDateTxt(),
              const SizedBox(
                height: 8.0,
              ),
              SizedBox(
                  height: 60,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: const Color(0XFF0078d4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "សូមជ្រើសរើសព័ត៌មានដែលត្រូវកែ",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: AppFont.appBarFont,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 8.0,
              ),
              ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                collapsedBackgroundColor: AppColors.primaryButtonColor,
                title: Text(_lang.changeName),
                leading: Checkbox(
                  value: isChecked1,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isChecked1 = value;
                        is_name = isChecked1;
                      });
                    }
                  },
                ),
                children: [
                  const SizedBox(height: 8.0),
                  _buildTextFormField(
                    labelText: _lang.oldName,
                    controller: oldNameController,
                    enable: is_name,
                  ),
                  const SizedBox(height: 8.0),
                  _buildTextFormField(
                      labelText: _lang.newName,
                      controller: newNameController,
                      enable: is_name),
                  const SizedBox(height: 8.0),
                ],
              ),
              ExpansionTile(
                title: Text(_lang.changeGender),
                tilePadding: const EdgeInsets.all(0),
                childrenPadding: const EdgeInsets.all(8.0),
                initiallyExpanded: isChecked2,
                onExpansionChanged: (_) {},
                trailing: null,
                leading: Checkbox(
                  value: isChecked2,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isChecked2 = value;
                        is_gender = isChecked2;
                      });
                    }
                  },
                ),
                children: [
                  _buildTextFormField(
                    labelText: _lang.oldGender,
                    controller: oldGenderController,
                    enable: is_gender,
                  ),
                  const SizedBox(height: 8.0),
                  _buildTextFormField(
                      labelText: _lang.newGender,
                      controller: newGenderController,
                      enable: is_gender),
                ],
              ),
              ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                collapsedBackgroundColor: AppColors.primaryButtonColor,
                childrenPadding: const EdgeInsets.all(8.0),
                title: Text(
                  _lang.changeDob,
                  style: TextStyle(fontSize: AppFont.buttonFontSize),
                ),
                initiallyExpanded: isChecked3,
                onExpansionChanged: (_) {},
                trailing: null,
                leading: Checkbox(
                  value: isChecked3,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isChecked3 = value;
                        is_dob = isChecked3;
                      });
                    }
                  },
                ),
                children: [
                  _buildTextFormField(
                      labelText: _lang.oldDob,
                      controller: oldDobController,
                      enable: is_dob),
                  const SizedBox(height: 8.0),
                  _buildTextFormField(
                      labelText: _lang.newDob,
                      controller: newDobController,
                      enable: is_dob),
                ],
              ),
              ExpansionTile(
                title: Text(_lang.changePob),
                tilePadding: const EdgeInsets.all(0),
                // collapsedBackgroundColor: AppColors.primaryButtonColor,
                childrenPadding: const EdgeInsets.all(8.0),
                initiallyExpanded: isChecked5,
                onExpansionChanged: (_) {},
                trailing: null,
                leading: Checkbox(
                  value: isChecked5,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isChecked5 = value;
                        is_mother = isChecked5;
                      });
                    }
                  },
                ),
                children: [
                  _buildTextFormField(
                      labelText: _lang.oldPob,
                      controller: oldPobController,
                      readOnly: true,
                      enable: is_pob),
                  const SizedBox(height: 8.0),
                  _buildTextFormField(
                      labelText: _lang.newPob,
                      controller: newPobController,
                      enable: is_pob),
                ],
              ),
              ExpansionTile(
                title: Text(_lang.changeFather),
                tilePadding: const EdgeInsets.all(0),
                childrenPadding: const EdgeInsets.all(8.0),
                collapsedBackgroundColor: AppColors.primaryButtonColor,
                initiallyExpanded: isChecked4,
                onExpansionChanged: (_) {},
                trailing: null,
                leading: Checkbox(
                  value: isChecked4,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isChecked4 = value;
                        is_father = isChecked4;
                      });
                    }
                  },
                ),
                children: [
                  _buildTextFormField(
                      labelText: _lang.oldFather,
                      controller: oldFatherController,
                      readOnly: true,
                      enable: is_father),
                  const SizedBox(height: 8.0),
                  _buildTextFormField(
                      labelText: _lang.newFather,
                      controller: newFatherController,
                      enable: is_father),
                ],
              ),
              ExpansionTile(
                title: Text(_lang.changeMother),
                tilePadding: const EdgeInsets.all(0),
                // collapsedBackgroundColor: AppColors.primaryButtonColor,
                childrenPadding: const EdgeInsets.all(8.0),
                initiallyExpanded: isChecked5,
                onExpansionChanged: (_) {},
                trailing: null,
                leading: Checkbox(
                  value: isChecked6,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isChecked6 = value;
                        is_mother = isChecked6;
                      });
                    }
                  },
                ),
                children: [
                  _buildTextFormField(
                      labelText: _lang.oldFather,
                      controller: oldMotherController,
                      readOnly: true,
                      enable: is_mother),
                  const SizedBox(height: 8.0),
                  _buildTextFormField(
                      labelText: _lang.newMother,
                      controller: newMotherController,
                      enable: is_mother),
                ],
              ),
              const SizedBox(height: 8.0),
              _SaveBtn(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameTxt() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(labelText: _lang.name),
    );
  }

  Widget _buildPhoneTxt() {
    return TextFormField(
      controller: phoneController,
      decoration: InputDecoration(labelText: _lang.phone),
    );
  }

  TextEditingController addressController = TextEditingController();
  Widget _buildAddressTxt() {
    return TextFormField(
      controller: addressController,
      decoration: InputDecoration(labelText: _lang.address),
    );
  }

  Widget _buildGenderTxt() {
    return TextFormField(
      controller: genderController,
      decoration: InputDecoration(labelText: _lang.gender),
    );
  }

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  Future<String?> getUserID() async {
    return await _secureStorage.read(key: 'id');
  }

  TextEditingController examDateController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Widget _SaveBtn1(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          // final action=context.read<ApplicantProvider>();
          String? token = await getToken() ?? '';
          String? userId = await getUserID() ?? '';

          ApplicantModel data = ApplicantModel(
              byUser: userId,
              grade: gradeController.text,
              examDate: examDateController.text,
              examCenter: examCenterController.text,
              room: int.tryParse(roomController.text) ?? 0,
              seat: int.tryParse(seatController.text) ?? 0,
              // address: addressController.text,
              service: "edit",
              edit: Edit(
                  isDob: is_dob,
                  isFather: is_father,
                  isMother: is_mother,
                  isGender: is_gender,
                  isName: is_name,
                  isPob: is_pob,
                  oldName: oldNameController.text,
                  newName: newNameController.text,
                  oldGender: oldGenderController.text,
                  newGender: newGenderController.text,
                  oldDob: oldDobController.text,
                  newDob: newDobController.text,
                  newPob: newPobController.text,
                  oldPob: oldPobController.text,
                  oldFather: oldFatherController.text,
                  newFather: newFatherController.text,
                  oldMother: oldMotherController.text,
                  newMother: newMotherController.text));

          final applicanProvider = context.read<ApplicantProvider>();
          if (applicanProvider.isLoading == true) {
            const CircularProgressIndicator();
          }
          applicanProvider.insertData(data, token);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF0078d4),
          padding: const EdgeInsets.symmetric(vertical: 13),
        ),
        child: Text(
          _lang.request,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }

  Widget _SaveBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer<ApplicantProvider>(
        builder: (context, applicantProvider, child) {
          return ElevatedButton(
            onPressed: applicantProvider.isLoading
                ? null // Disable button when loading
                : () async {
                    try {
                      String? token = await getToken() ?? '';
                      String? userId = await getUserID() ?? '';

                      ApplicantModel data = ApplicantModel(
                          byUser: userId,
                          grade: gradeController.text,
                          examDate: examDateController.text,
                          examCenter: examCenterController.text,
                          room: int.tryParse(roomController.text) ?? 0,
                          seat: int.tryParse(seatController.text) ?? 0,
                          // address: addressController.text,
                          service: "edit",
                          edit: Edit(
                              isDob: is_dob,
                              isFather: is_father,
                              isMother: is_mother,
                              isGender: is_gender,
                              isName: is_name,
                              isPob: is_pob,
                              oldName: oldNameController.text,
                              newName: newNameController.text,
                              oldGender: oldGenderController.text,
                              newGender: newGenderController.text,
                              oldDob: oldDobController.text,
                              newDob: newDobController.text,
                              newPob: newPobController.text,
                              oldPob: oldPobController.text,
                              oldFather: oldFatherController.text,
                              newFather: newFatherController.text,
                              oldMother: oldMotherController.text,
                              newMother: newMotherController.text));

                      await applicantProvider.insertData(data, token);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(applicantProvider.message.toString()),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${e.toString()}')));
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF0078d4),
              padding: const EdgeInsets.symmetric(vertical: 13),
            ),
            child: applicantProvider.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    _lang.request,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildDobTxt() {
    return TextFormField(
      controller: dobController,
      decoration: InputDecoration(labelText: _lang.dob),
    );
  }

  Widget _buildexamDateTxt() {
    return TextFormField(
      controller: examDateController,
      decoration: InputDecoration(labelText: _lang.examDate),
    );
  }

  Widget _buildExamCentrTxt() {
    return TextFormField(
      controller: examCenterController,
      decoration: InputDecoration(labelText: _lang.examCenter),
    );
  }

  Widget _buildSeatTxt() {
    return TextFormField(
      controller: seatController,
      decoration: InputDecoration(labelText: _lang.seat),
    );
  }

  TextEditingController roomController = TextEditingController();
  Widget _buildRoomTxt() {
    return TextFormField(
      controller: roomController,
      decoration: InputDecoration(labelText: _lang.room),
    );
  }
}
