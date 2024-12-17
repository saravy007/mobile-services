import 'package:caf/language/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

List<Language> langList = [
  Khmer(),
  Language(),
];
class LanguageProvider extends ChangeNotifier {
  Language _lang = Khmer();
  Language get lang => _lang;
  int _langIndex = 0;
  int get langIndex => _langIndex;
  final _storage = const FlutterSecureStorage();
  final _key = "_language_key";
  Future<void> readLanguage() async {
    String langIndexString = await _storage.read(key: _key) ?? "0";
    _langIndex = int.parse(langIndexString);
    _lang = langList[_langIndex];
    notifyListeners();
  }
  void changeToKhmer() {
    _langIndex = 0;
    _lang = langList[_langIndex];
    _storage.write(key: _key, value: _langIndex.toString());
    notifyListeners();
  }

  void changeToEnglish() {
    _langIndex = 1;
    _lang = langList[_langIndex];
    _storage.write(key: _key, value: _langIndex.toString());
    notifyListeners();
  }

  void changeLanguage() {
    if (_langIndex == 0) {
      changeToEnglish();
    } else {
      changeToKhmer();
    }
    notifyListeners();
  }
}
