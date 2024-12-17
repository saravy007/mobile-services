import 'package:caf/language/language_constant.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceTakeScreen extends StatefulWidget {
  const ServiceTakeScreen({super.key});

  @override
  State<ServiceTakeScreen> createState() => _ServiceTakeScreenState();
}

class _ServiceTakeScreenState extends State<ServiceTakeScreen> {
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    _lang = context.read<LanguageProvider>().lang;
    return Container(
      child: Text(_lang.address),
    );
  }
}
