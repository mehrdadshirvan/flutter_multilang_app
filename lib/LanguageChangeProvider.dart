import 'package:flutter/cupertino.dart';

class LanguageChangeProvider with ChangeNotifier {
  Locale _currentLocale = new Locale("en");

  Locale get currentLocaleLang => _currentLocale;

  void ChangeLocale(String _local) {
    this._currentLocale = new Locale(_local);
    notifyListeners();
  }
}
