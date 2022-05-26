import 'package:flutter/cupertino.dart';

class LanguageChangeNotifier extends ChangeNotifier{
  static Locale _languageLocal = const Locale('en', '');

  void setLanguage(Locale locale){
    _languageLocal = locale;
    notifyListeners();
  }

  Locale getLanguage(){
    notifyListeners();
    return _languageLocal;
  }
}