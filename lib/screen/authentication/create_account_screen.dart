import 'dart:convert';
import 'dart:ffi';

import 'package:caf/language/language_constant.dart';
import 'package:caf/model/province_model.dart';
import 'package:caf/model/user_model.dart';
import 'package:caf/provider/auth_provider.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/provider/user_provider.dart';
import 'package:caf/screen/home_screen.dart';
import 'package:caf/settings/app_color.dart';
import 'package:caf/settings/app_font.dart';
import 'package:caf/widget/snackbar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordTxt = TextEditingController();
  TextEditingController emailTxt = TextEditingController();
  TextEditingController confirmPassTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Language _lang = Khmer();
  String? _gender = "choose";
  List<String> _genderList = ["choose", "male", "female"];
  List<ProvinceModel> provinces = [
    ProvinceModel(
        proCode: 1,
        nameEn: "Banteay Meanchey",
        nameKh: "បន្ទាយមានជ័យ",
        active: 1),
    ProvinceModel(
        proCode: 2, nameEn: "Battambang", nameKh: "បាត់ដំបង", active: 1),
    ProvinceModel(
        proCode: 3, nameEn: "Kampong Cham", nameKh: "កំពង់ចាម", active: 1),
    ProvinceModel(
        proCode: 4,
        nameEn: "Kampong Chhnang",
        nameKh: "កំពង់ឆ្នាំង",
        active: 1),
    ProvinceModel(
        proCode: 5, nameEn: "Kampong Speu", nameKh: "កំពង់ស្ពឺ", active: 1),
    ProvinceModel(
        proCode: 6, nameEn: "Kampong Thom", nameKh: "កំពង់ធំ", active: 1),
    ProvinceModel(proCode: 7, nameEn: "Kampot", nameKh: "កំពត", active: 1),
    ProvinceModel(proCode: 12, nameEn: "Kandal", nameKh: "កណ្តាល", active: 1),
    ProvinceModel(proCode: 9, nameEn: "Koh Kong", nameKh: "កោះកុង", active: 1),
    ProvinceModel(proCode: 10, nameEn: "Kratie", nameKh: "ក្រចេះ", active: 1),
    ProvinceModel(
        proCode: 11, nameEn: "Mondul Kiri", nameKh: "មណ្ឌលគិរី", active: 1),
    ProvinceModel(
        proCode: 12, nameEn: "Phnom Penh", nameKh: "ភ្នំពេញ", active: 1),
    ProvinceModel(
        proCode: 12, nameEn: "Preah Vihear", nameKh: "ព្រះវិហារ", active: 1),
    ProvinceModel(
        proCode: 12, nameEn: "Prey Veng", nameKh: "ព្រៃវែង", active: 1),
    ProvinceModel(
        proCode: 15, nameEn: "Pursat", nameKh: "ពោធិ៍សាត់", active: 1),
    ProvinceModel(
        proCode: 12, nameEn: "Ratanak Kiri", nameKh: "រតនគិរី", active: 1),
    ProvinceModel(proCode: 17, nameEn: "Siemreap", nameKh: "សៀមរាប", active: 1),
    ProvinceModel(
        proCode: 112, nameEn: "Preah Sihanouk", nameKh: "ព្រះសីហនុ", active: 1),
    ProvinceModel(
        proCode: 19, nameEn: "Stung Treng", nameKh: "ស្ទឹងត្រែង", active: 1),
    ProvinceModel(
        proCode: 20, nameEn: "Svay Rieng", nameKh: "ស្វាយរៀង", active: 1),
    ProvinceModel(proCode: 21, nameEn: "Takeo", nameKh: "តាកែវ", active: 1),
    ProvinceModel(
        proCode: 22,
        nameEn: "Oddar Meanchey",
        nameKh: "ឧត្តរមានជ័យ",
        active: 1),
    ProvinceModel(proCode: 23, nameEn: "Kep", nameKh: "កែប", active: 1),
    ProvinceModel(proCode: 24, nameEn: "Pailin", nameKh: "ប៉ែលិន", active: 1),
    ProvinceModel(
        proCode: 25, nameEn: "Tboung Khmum", nameKh: "ត្បូងឃ្មុំ", active: 1),
    ProvinceModel(
        proCode: 99,
        nameEn: "Central Ministry",
        nameKh: "ក្រសួងអប់រំ យុវជន និងកីឡា",
        active: 1),
  ];

  ProvinceModel? _provinceModel;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    dobController = TextEditingController(text: formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    // int langIndex = context.watch<LanguageProvider>().langIndex;
    _lang = context.watch<LanguageProvider>().lang;
    UserProvider userProvider = context.watch<UserProvider>();

    AuthProvider authProvider = context.watch<AuthProvider>();
    bool _loading = authProvider.loading;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(_lang.createAccount),
      ),
      
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
          : SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.only(left: 12),
                height: 50,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2), // Changes position of shadow
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    _buildForm(),
                    const SizedBox(
                      height: 10,
                    ),
                    // _buildRegisterButton()
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                height: 50,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2), // Changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  _lang.accountInfo,
                  style: TextStyle(
                      fontSize: 19,
                      color: AppColors.primaryButtonColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: _buildUserNameTextField(),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: _builEmailTextField(),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: _buildPasswordTextEdit(userProvider),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: _buildConfirmPasswordTextEdit(userProvider),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: _buildSaveButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildGenderDropdownList() {
    return DropdownButtonFormField(
        isDense: true,
        isExpanded: true,
        value: _gender,
        hint: Text(_lang.gender),
        alignment: Alignment.center,
        items: _genderList.map((String? item) {
          return DropdownMenuItem<String>(
              value: item,
              child: Text(item == "male"
                  ? _lang.male
                  : (item == "female" ? _lang.female : _lang.genderChoose)));
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _gender = value;
            print(_gender);
          });
        });
  }

  Widget _buildPoBDropDown() {
    return DropdownButtonFormField<ProvinceModel>(
        isDense: true,
        isExpanded: true,
        value: _provinceModel,
        hint: Text(_lang.pob),
        items: provinces.map((item) {
          return DropdownMenuItem<ProvinceModel>(
              value: item,
              child: Text(
                  _lang.language == "English" ? item.nameEn : item.nameKh));
        }).toList(),
        onChanged: (value) {
          setState(() {
            _provinceModel = value;
            // print(_provinceModel!.nameKh.toString());
          });
        });
  }

  Widget _buildForm() {
    final userProvider = context.watch<UserProvider>();
    return Container(
      // key: _formKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        // padding: const EdgeInsets.all(12.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSurName(),
            const SizedBox(height: 12),
            _buildFirstName(),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildGenderDropdownList(),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _buildDobTxt(),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            _buildPoBDropDown(),
            SizedBox(
              height: 12,
            ),
            _buildPhoneTxt(),
          ],
        ),
      ),
    );
  }

  TextEditingController surnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String? _validateGender(value) {
    if (value == null || value.isEmpty) {
      return _lang.gender;
    }
    return null;
  }

  Widget _buildDobTxt() {
    return TextFormField(
      controller: dobController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: _lang.dob,
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

// TextEditingController surname=TextEditingController();
  Widget _buildSurName() {
    return TextFormField(
      controller: surnameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: _lang.surname, prefixIcon: Icon(Icons.person)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.inputValid + _lang.surname;
        }
        // if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
        //   return _lang.textValid;
        // }
        return null;
      },
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      controller: firstnameController,
      decoration: InputDecoration(
          labelText: _lang.firstname, prefixIcon: Icon(Icons.person)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.inputValid + _lang.firstname;
        }
        return null;
      },
    );
  }

  Widget _buildPhoneTxt() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone), labelText: _lang.phone),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.inputValid + _lang.phone;
        }
        // Validate phone number format
        if (RegExp(r'^\d{10,15}$').hasMatch(value)) {
          return _lang.textValid;
        }
        return null;
      },
    );
  }

  Widget _buildCreateNewAccount() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
        );
      }, // Handle account creation logic
      child: Text(
        _lang.createAccount,
        style: const TextStyle(color: Color(0xFF3074FD), fontSize: 112.0),
      ),
    );
  }

  Widget _buildPasswordTextEdit(UserProvider userpro) {
    return TextFormField(
      controller: passwordTxt,
      obscureText: userpro.isObscured,
      decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.key),
          ),
          labelText: _lang.password,
          suffixIcon: IconButton(
            icon: Icon(
              userpro.isObscured ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              userpro.showPassword();
            },
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.passwordValid;
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordTextEdit(UserProvider userpro) {
    return TextFormField(
      controller: confirmPassTxt,
      obscureText: userpro.isConfirmObscure,
      decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.key_rounded),
          ),
          labelText: _lang.confirmPassword,
          suffixIcon: IconButton(
            icon: Icon(
              userpro.isConfirmObscure
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              userpro.showConfirmPass(); // Toggle visibility
            },
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.confirmPassValid;
        }
        return null;
      },
    );
  }

  Widget _buildUserNameTextField() {
    return TextFormField(
      controller: usernameController,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.people),
        ),
        labelText: _lang.username,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.usernameValid;
        }
        return null;
      },
    );
  }

  Widget _builPhoneTextField() {
    return TextFormField(
      controller: phoneTxt,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.people),
        ),
        labelText: _lang.phone,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.phoneValid;
        }
        return null;
      },
    );
  }

  Widget _builEmailTextField() {
    return TextFormField(
      controller: emailTxt,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.email),
        ),
        labelText: _lang.email,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.email;
        }
        return null;
      },
    );
  }

  Widget _buildLogoText() {
    return Text(
      _lang.logoTitle,
      style: const TextStyle(
          fontFamily: "Koulen",
          fontSize: 32.0,
          fontWeight: FontWeight.w200,
          color: Color(0xFF3074FD)),
    );
  }
  // Widget _buildSaveButton() {
  //   return Container(
  //     padding: EdgeInsets.only(top: 12.0),
  //     width: double.infinity,
  //     child: CupertinoButton(
  //       focusColor: AppColors.primaryButtonColor,
  //       color: Color(0xFF007AFF),
  //       padding: EdgeInsets.all(9),
  //       onPressed: () {
  //         if (_formKey.currentState?.validate() == true) {
  //           if (passwordTxt.text != confirmPassTxt.text) {
  //             SnackbarScreen.showSnackbarSuccess(
  //                 context, _lang.passwordMacthMsg);
  //           } else {
  //             final user = UserModel(
  //               username: usernameController.text,
  //               email: emailTxt.text,
  //               password: passwordTxt.text,
  //               dob: dobController.text,
  //               firstName: firstnameController.text,
  //               lastName: surnameController.text,
  //               gender: _gender,
  //               address: _provinceModel!.nameKh,

  //               phone: phoneTxt.text,
  //               confirmedPassword: confirmPassTxt.text,
  //             );

  //            context.read<AuthProvider>().signUp(user).then(onValue)

  //           }
  //         }
  //       },

  //       child: Text(
  //         _lang.register,
  //          style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: AppFont.bodyFont,fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   );
  // }
  Widget _buildSaveButton() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF0077ED), // Background color (your blue color code)
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      width: double.infinity,
      child: CupertinoButton(
        // focusColor: AppColors.ibuttonColor,
        padding: EdgeInsets.all(10),
      
        onPressed: () async{
          AuthProvider provider = context.read<AuthProvider>();
          if (_formKey.currentState!.validate()) {
            // Trigger form validation and save logic
            _formKey.currentState!.save();

            // Here you can handle account creation logic
            // For example:
            String username = usernameController.text.trim();
            String email = emailTxt.text.trim();
            String password = passwordTxt.text.trim();
            String confirmPassword = confirmPassTxt.text.trim();
            String? gender = _gender;
            // ProvinceModel? province = _provinceModel;

            String address = _provinceModel!.nameKh;

            if (password != confirmPassword) {
             ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_lang.passwordMacthMsg),
                  duration:Duration(seconds: 3),
                ),
              );
              return;
            }
            
            await provider.signUp(UserModel(
              username: username,
              email: email,
              password: password,
              lastName: surnameController.text,
              firstName: firstnameController.text,
              confirmedPassword: confirmPassword,
              gender: gender,
              dob: DateTime.tryParse(dobController.text),
              address: address,
              phone: phoneController.text,
            ));
            if (provider.msg == "success") {
              
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              
            }else

             { ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(provider.msg.toString()),
                  duration:Duration(seconds: 2),
                  backgroundColor: Colors.blue[200],
                ),
              );}
            
          }
        },
        child: Text(
          _lang.register,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            fontFamily: AppFont.buttonFont,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
