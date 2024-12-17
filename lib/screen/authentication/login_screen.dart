import 'package:caf/language/language_constant.dart';
import 'package:caf/provider/auth_provider.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/screen/authentication/create_account_screen.dart';
import 'package:caf/screen/home_screen.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameTxt = TextEditingController();
  final TextEditingController passwordTxt = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Language _lang = Khmer();
  final AuthProvider _authProvider = AuthProvider();
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    int langIndex = context.watch<LanguageProvider>().langIndex;
    _lang = context.watch<LanguageProvider>().lang;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLogo("pictures/moeys_logo.png"),
                const SizedBox(height: 40.0),
                _buildForm(),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildForgetPassword(),
                    _builRememberMe(),
                    Text(_lang.remeberMe),
                  ],
                ),
                const SizedBox(height: 10.0),
                _buildLoginButton(),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLanguageToggle(),
                    _buildCreateNewAccount(),
                  ],
                )
              ],
            ),
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

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildUserNameTextField(),
          const SizedBox(height: 10.0),
          _buildPasswordTextField(),
        ],
      ),
    );
  }

  Widget _buildForgetPassword() {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {}, // Handle forget password logic
        child: Text(
          _lang.passwordForget,
          style: const TextStyle(color: Color(0xFF3074FD), fontSize: 18.0),
        ),
      ),
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
        style: const TextStyle(color: Color(0xFF3074FD), fontSize: 18.0),
      ),
    );
  }

  Widget _buildUserNameTextField() {
    return TextFormField(
      controller: usernameTxt,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.phone),
        ),
        labelText: _lang.userLogin,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.usernameValid;
        }
        return null;
      },
    );
  }
  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: passwordTxt,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.key),
        ),
        labelText: _lang.password,
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _lang.passwordValid;
        }
        return null;
      },
    );
  }

  Widget _buildLanguageToggle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
        onPressed: () {
          final lang = context.read<LanguageProvider>();
          lang.changeLanguage();
        },
        icon: context.watch<LanguageProvider>().langIndex == 0
            ? CountryFlag.fromCountryCode(
                "GB",
                height: 24,
                width: 24,
              )
            : CountryFlag.fromCountryCode(
                "KH",
                height: 24,
                width: 24,
              ),
        label: Text(
          context.watch<LanguageProvider>().langIndex == 0
              ? _lang.changeToEnglish
              : _lang.changeToKhmer,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
  Widget _builRememberMe() {
    return Checkbox(
      value: _rememberMe,
      onChanged: (value) {
        setState(() {
          _rememberMe = value ?? false; // Update the checkbox state
          print(_rememberMe);
        });
      },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _authProvider.login(
                usernameTxt.text, passwordTxt.text, _rememberMe);
            if (_authProvider.isLogIn == true) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3074FD),
          padding: const EdgeInsets.symmetric(vertical: 13),
        ),
        child: Text(
          _lang.login,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
