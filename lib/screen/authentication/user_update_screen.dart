
import 'package:caf/language/language_constant.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/provider/user_provider.dart';
import 'package:caf/widget/snackbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserUpdateScreen extends StatefulWidget {
  const UserUpdateScreen({super.key});
  @override
  State<UserUpdateScreen> createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
  TextEditingController nameTxt = TextEditingController();
  TextEditingController passwordTxt = TextEditingController();
  TextEditingController confirmPassTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    // int langIndex = context.watch<LanguageProvider>().langIndex;
    _lang = context.watch<LanguageProvider>().lang;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                _buildLogo("https://static.thenounproject.com/png/1743560-200.png"),
                const SizedBox(height: 35.0),
                
                _buildForm(),
                const SizedBox(
                  height: 10,
                ),
                _EditButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(String img) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.transparent,
      child: Image.network(
        img,
        fit: BoxFit.cover,
        alignment: Alignment.center,
         
      ),
    );
  }

  Widget _buildForm() {
    final userprovider = context.watch<UserProvider>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildNameTextField(),
          const SizedBox(height: 10.0),
          _builPhoneTextField(),
          const SizedBox(height: 10.0),
          _buildPasswordTextEdit(userprovider),
          const SizedBox(height: 10.0),
          _buildConfirmPasswordTextEdit(userprovider)
        ],
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
              userpro.showPassword(); // Toggle visibility
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
  Widget _buildNameTextField() {
    return TextFormField(
      controller: nameTxt,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.people),
        ),
        labelText: _lang.name,
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
          child: Icon(Icons.phone),
        ),
        labelText: _lang.phone,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.phone;
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

  Widget _buildRegisterTextEdit() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3074FD),
          padding: const EdgeInsets.symmetric(vertical: 13),
        ),
        child: Text(
          _lang.edit,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  Widget _EditButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            if (passwordTxt.text != confirmPassTxt.text) {
              SnackbarScreen.showSnackbarSuccess(context, _lang.passwordMacthMsg);
              return;
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3074FD),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          _lang.edit,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
