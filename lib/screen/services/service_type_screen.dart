import 'package:caf/language/language_constant.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/screen/application/edit_application_screen.dart';
import 'package:caf/screen/application/applicant_screen.dart';
import 'package:caf/settings/app_color.dart';
import 'package:caf/settings/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ServiceTypeScreen extends StatefulWidget {
  const ServiceTypeScreen({super.key});
  @override
  State<ServiceTypeScreen> createState() => _ServiceTypeScreenState();
}

class _ServiceTypeScreenState extends State<ServiceTypeScreen> {
  Language _lang = Khmer();

  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageProvider>().lang;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //     height: 60,
                //     child: Container(
                //       alignment: Alignment.centerLeft,
                //       color: const Color(0XFF0078d4),
                //       width: screenWidth * 0.9,
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           "ជ្រើសរើស ប្រភេទសេវា",
                //           style: TextStyle(
                //             fontSize: 25,
                //             fontFamily: AppFont.appBarFont,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //     )),
                // const SizedBox(
                //   height: 16,
                // ),
                _buildCorrectButton(),
                const SizedBox(
                  height: 16,
                ),
                _buildEditButton(),
                const SizedBox(
                  height: 16,
                ),
                _builReissueButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _certifcate = "";
  Widget _buildCertificate(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(_lang.certType),
        leading: Radio<String>(
          value: 'Male',
          groupValue: _certifcate,
          onChanged: (String? value) {
            setState(() {
              _certifcate = value;
            });
          },
        ),
      ),
      ListTile(
          title: Text('Female'),
          leading: Radio<String>(
            value: 'Female',
            groupValue: _certifcate,
            onChanged: (String? value) {
              setState(() {
                _certifcate = value;
              });
            },
          ))
    ]);
  }

  _buildProfile() {
    return Container(
      color: Colors.grey.shade300,
      child: const Column(
        children: [],
      ),
    );
  }

  Widget _buildEditButton() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:
            AppColors.ibuttonColor, // Background color (your blue color code)
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        child: CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditApplicationScreen(),
                ),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.edit_document,
                  size: 35,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  _lang.editAttach,
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: AppFont.bodyFont,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                )
              ],
            )),
      ),
    );
  }

  Widget _builReissueButton() {
    {
      double screenWidth = MediaQuery.of(context).size.width;
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:
              AppColors.ibuttonColor, // Background color (your blue color code)
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        // margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: CupertinoButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.new_label,
                  size: 35,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  _lang.reissue,
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: AppFont.bodyFont,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                )
              ],
            )),
      );
    }
  }

  Widget _buildCorrectButton() {
    {
      double screenWidth = MediaQuery.of(context).size.width;
      return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors
                .ibuttonColor, // Background color (your blue color code)
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          child: CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyApplicationScreen(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.verified),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    _lang.verifyAttach,
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: AppFont.bodyFont,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  )
                ],
              )));
    }
  }
}
