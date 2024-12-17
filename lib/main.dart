import 'package:caf/basic_app.dart';
import 'package:caf/provider/applicant_provider.dart';
import 'package:caf/provider/auth_provider.dart';
import 'package:caf/provider/carousel_provider.dart';
import 'package:caf/provider/event_provider.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() async {
    HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => CarouselProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ApplicantProvider()),
      ],
      child: const BasicaApp(), // Corrected spelling
    ),
  );
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}