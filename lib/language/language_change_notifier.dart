import 'package:flutter/material.dart';

class AppLanguage extends InheritedWidget {
  Locale languageLocal = const Locale('en', '');

  AppLanguage({Key? key, required Widget child,}) : super(key: key, child: child,);

  static AppLanguage? of(BuildContext context,) {
    return context.dependOnInheritedWidgetOfExactType<AppLanguage>();
  }

  @override
  bool updateShouldNotify(AppLanguage oldWidget,) {
    // return this.languageLocal.languageCode != oldWidget.languageLocal.languageCode
    //   || this.languageLocal.countryCode != oldWidget.languageLocal.countryCode;
    return true;
  }
}