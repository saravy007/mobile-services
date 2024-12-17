import 'dart:convert';
import 'dart:ffi';
import 'dart:ui' as ui;
import 'package:caf/basic_app.dart';
import 'package:caf/language/language_constant.dart';
import 'package:caf/main.dart';
import 'package:caf/model/applicant_model.dart';
import 'package:caf/provider/applicant_provider.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/screen/application/edit_application_screen.dart';
import 'package:caf/settings/app_color.dart';
import 'package:caf/settings/app_font.dart';
import 'package:caf/widget/tabar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VerifyApplicationScreen extends StatefulWidget {
  const VerifyApplicationScreen({super.key});

  @override
  State<VerifyApplicationScreen> createState() =>
      _VerifyApplicationScreenScreenState();
}

class _VerifyApplicationScreenScreenState extends State<VerifyApplicationScreen>
    with SingleTickerProviderStateMixin {
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

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: ui.Size.fromHeight(1.5),
            child: Column(
              children: [
                ClipRRect(
                  child: Container(
                    height: 50,
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        // borderRadius: const BorderRadius.all(Radius.circular(10)),
                        // color: Colors.green.shade100,
                        ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.only(left: 3, right: 2),
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: AppColors.ibuttonColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.blue,
                      isScrollable: true,
                      physics: ScrollPhysics(),
                      tabs: [
                        TabItem(
                          title: _lang.applicationInfo,
                          count: 6,
                          icon: CupertinoIcons.person_alt_circle_fill,
                        ),
                        TabItem(
                          title: _lang.serviceInfo,
                          count: 3,
                          icon: CupertinoIcons.doc_text_fill,
                        ),
                        TabItem(
                          title: _lang.doccument,
                          count: 1,
                          icon: CupertinoIcons.folder_circle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildPersonInfo(context),
            _buildServiceType(),
            _buildDobTxt()
          ],
        ),
        floatingActionButton: Padding(
            padding: EdgeInsets.all(0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.errorColor),
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(25),
                    padding: EdgeInsets.only(left: 25, right: 25),
                    onPressed: () {
                      _backTab();
                    },
                    child: Text(
                      _lang.back,
                      style: TextStyle(
                          fontFamily: AppFont.buttonFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
              SizedBox(width: 8),
              _tabController.index == _tabController.length - 1
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.ibuttonColor),
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(25),
                        padding: EdgeInsets.only(left: 40, right: 40),
                        onPressed: () {
                          // Implement the save logic here
                          // _saveData();
                        },
                        child: Text(
                          _lang.saveButton,
                          style: TextStyle(
                              fontFamily: AppFont.buttonFont,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.ibuttonColor),
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(25),
                        padding: EdgeInsets.only(left: 40, right: 40),
                        onPressed: () {
                          _goToNextTab();
                        },
                        child: Text(
                          _lang.next,
                          style: TextStyle(
                              fontFamily: AppFont.buttonFont,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
            ])),
      ),
    );
  }

  void _goToNextTab() {
    setState(() {
      if (_tabController.index < _tabController.length - 1) {
        _tabController.animateTo(_tabController.index + 1);
      }
    });
  }

  void _backTab() {
    setState(() {
      if (_tabController.index > 0) {
        _tabController.animateTo(_tabController.index - 1);
      }
    });
  }

  Widget _buildPersonInfo(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Title Container
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFFCCDAEE),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1), // Changes position of shadow
                ),
              ],
            ),
            child: Text(
              _lang.personalInfo,
              style: TextStyle(
                  fontSize: 19,
                  color: AppColors.primaryButtonColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // Information Text Fields
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            margin: EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSurName(),
                const SizedBox(height: 12),
                _buildLastName(),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: _buildGenderTxt()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildDobTxt()),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildPhoneTxt()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildAddressTxt()),
                  ],
                ),
                // const SizedBox(height: 12),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFCCDAEE),
                  Color(0xFFCCDAEE), // Soft Blue
                  // Light Blue
                  Color(0xFFCCDAEB), // Primary Blue
                ],
              ),
            ),
            child: Text(
              _lang.examinfo,
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.ibuttonColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // Grouping Exam Center, Room, Seat, Exam Date
          Container(
            // margin: EdgeInsets.only(top: 12, bottom: 12),
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: _buildExamCentrTxt()),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildexamDateTxt()),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildRoomTxt()),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildSeatTxt()),
                    const SizedBox(height: 12),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildGradeList()),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 60),
        ],
      ),
    );
  }

  String? _servicetype;
  Widget _buildServiceType() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(_lang.verifyAttach),
            leading: Radio<String>(
              value: 'verify',
              groupValue: _servicetype,
              onChanged: (String? value) {
                setState(() {
                  _servicetype = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(_lang.edit),
            leading: Radio<String>(
              value: 'edit',
              groupValue: _servicetype,
              onChanged: (String? value) {
                setState(() {
                  _servicetype = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(_lang.reissue),
            leading: Radio<String>(
              value: '',
              groupValue: _certifcate,
              onChanged: (String? value) {
                setState(() {
                  _certifcate = value;
                });
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  TextEditingController surnameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  Widget _buildSurName() {
    return TextFormField(
      controller: surnameController,
      readOnly: true,
      decoration: InputDecoration(labelText: _lang.surname),
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: nameController,
      readOnly: true,
      decoration: InputDecoration(labelText: _lang.firstname),
    );
  }

  Grade? _grade;

  List<Grade> _gradeList = [
    Grade(grade: "A"),
    Grade(grade: "B"),
    Grade(grade: "C"),
    Grade(grade: "D"),
    Grade(grade: "E"),
    Grade(grade: "F")
  ];
  Widget _buildGradeList() {
    return DropdownButtonFormField(
        isDense: true,
        isExpanded: true,
        value: _grade,
        hint: Text(_lang.grade),
        items: _gradeList.map((item) {
          return DropdownMenuItem<Grade>(value: item, child: Text(item.grade!));
        }).toList(),
        onChanged: (value) {
          setState(() {
            _grade = value;
            print(_grade);
          });
        });
  }

  Widget _buildexamDateTxt() {
    return TextFormField(
      controller: dobController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: _lang.examDate,
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.blue[700],
        ),
        border: OutlineInputBorder(),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900), // Earliest date selectable
          lastDate: DateTime.now(), // Latest date selectable
        );
        if (pickedDate != null) {
          // Format the selected date
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          dobController.text = formattedDate;
        }
      },
    );
  }

  Widget _buildPhoneTxt() {
    return TextFormField(
      controller: phoneController,
      readOnly: true,
      decoration: InputDecoration(labelText: _lang.phone),
    );
  }

  TextEditingController addressController = TextEditingController();
  Widget _buildAddressTxt() {
    return TextFormField(
      controller: addressController,
      readOnly: true,
      decoration: InputDecoration(labelText: _lang.pob),
    );
  }

  Widget _buildGenderTxt() {
    return TextFormField(
      controller: genderController,
      readOnly: true,
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

          // ApplicantModel data = ApplicantModel(
          //   byUser: userId,
          //   grade: gradeController.text,
          //   phone: phoneController.text,
          //   name: nameController.text,
          //   gender: genderController.text,
          //   examDate: examDateController.text,
          //   dob: dobController.text,
          //   examCenter: examCenterController.text,
          //   room: int.tryParse(roomController.text) ?? 0,
          //   seat: int.tryParse(seatController.text) ?? 0,
          //   address: addressController.text,
          //   service: "edit",
          //   isDob: is_dob,
          //   isFather: is_father,
          //   isMother: is_mother,
          //   isGender: is_gender,
          //   isName: is_name,
          //   isPob: is_pob,
          //   reissueAttach1: "",
          //   oldName: oldNameController.text,
          //   newName: newNameController.text,
          //   oldGender: oldGenderController.text,
          //   newGender: newGenderController.text,
          //   oldDob: oldDobController.text,
          //   newDob: newDobController.text,
          //   newPob: newPobController.text,
          //   oldPob: oldPobController.text,
          //   oldFather: oldFatherController.text,
          //   newFather: newFatherController.text,
          //   oldMother: oldMotherController.text,
          //   newMother: newMotherController.text,
          //   editAttach1: "",
          //   editAttach2: "",
          //   editAttach3: "",
          //   editAttach4: "",
          //   editAttach5: "",
          //   editAttach6: "",
          //   verifyAttach1: "",
          //   reissueAttach2: "",
          //   reissueAttach3: "",
          //   reissueAttach4: "",
          // );

          // final applicanProvider = context.read<ApplicantProvider>();
          // if (applicanProvider.isLoading == true) {
          //   const CircularProgressIndicator();
          // }
          // applicanProvider.insertData(data, token);
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
                      // final tabController = DefaultTabController.of(context);
                      // if (tabController != null && tabController.index < 2) {
                      //   tabController.animateTo(tabController.index + 1);
                      // }
                      // String? token = await getToken() ?? '';
                      // String? userId = await getUserID() ?? '';

                      // ApplicantModel data = ApplicantModel(
                      //   byUser: userId,
                      //   grade: gradeController.text,
                      //   phone: phoneController.text,
                      //   name: nameController.text,
                      //   gender: genderController.text,
                      //   examDate: examDateController.text,
                      //   dob: dobController.text,
                      //   examCenter: examCenterController.text,
                      //   room: int.tryParse(roomController.text) ?? 0,
                      //   seat: int.tryParse(seatController.text) ?? 0,
                      //   address: addressController.text,
                      //   service: "edit",
                      //   isDob: is_dob,
                      //   isFather: is_father,
                      //   isMother: is_mother,
                      //   isGender: is_gender,
                      //   isName: is_name,
                      //   isPob: is_pob,
                      //   reissueAttach1: "",
                      //   oldName: oldNameController.text,
                      //   newName: newNameController.text,
                      //   oldGender: oldGenderController.text,
                      //   newGender: newGenderController.text,
                      //   oldDob: oldDobController.text,
                      //   newDob: newDobController.text,
                      //   newPob: newPobController.text,
                      //   oldPob: oldPobController.text,
                      //   oldFather: oldFatherController.text,
                      //   newFather: newFatherController.text,
                      //   oldMother: oldMotherController.text,
                      //   newMother: newMotherController.text,
                      //   editAttach1: "",
                      //   editAttach2: "",
                      //   editAttach3: "",
                      //   editAttach4: "",
                      //   editAttach5: "",
                      //   editAttach6: "",
                      //   verifyAttach1: "",
                      //   reissueAttach2: "",
                      //   reissueAttach3: "",
                      //   reissueAttach4: "",
                      // );
                      // await applicantProvider.insertData(data, token);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(applicantProvider.message.toString()),
                      //     backgroundColor: Colors.green,
                      //   ),
                      // );
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

  Widget _buildTabBar() {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          color: Colors.blue, // Background color of TabBar
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Personal Info'),
              Tab(text: 'Address'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [_buildAddressTxt(), _buildAddressTxt()],
          ),
        ),
      ],
    ));
  }

  Widget _builEditApplicant() {
    return Container(
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
          // _buildNameTxt(),
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
    );
  }

  String? _certifcate = "";
  Widget _buildCertificate() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(_lang.grade12),
            leading: Radio<String>(
              value: 'diploma',
              groupValue: _certifcate,
              onChanged: (String? value) {
                setState(() {
                  _certifcate = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(_lang.grade12_temp),
            leading: Radio<String>(
              value: 'temp_cert',
              groupValue: _certifcate,
              onChanged: (String? value) {
                setState(() {
                  _certifcate = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(_lang.grade12_complete),
            leading: Radio<String>(
              value: 'graduate_cert',
              groupValue: _certifcate,
              onChanged: (String? value) {
                setState(() {
                  _certifcate = value;
                });
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Grade {
  String? grade;
  Grade({required this.grade});
}
