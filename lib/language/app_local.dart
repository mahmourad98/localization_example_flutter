import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyAppLocal{
  final Locale theLocal;
  late final Map<String, String> localizedTitles;

  static const LocalizationsDelegate<MyAppLocal> delegate = _MyAppLocalDelegate();

  MyAppLocal(this.theLocal){
    //loadLocalizationFile();
  }

  static MyAppLocal of(BuildContext buildContext){
    return Localizations.of(buildContext, MyAppLocal);
  }

  Future<void> loadLocalizationFile() async{
    String fileData = await rootBundle.loadString('assets/lang/${theLocal.languageCode}.json',);
    Map<String, dynamic> fileDataDecoded = jsonDecode(fileData,);
    Map<String, String> fileDataAsMap = fileDataDecoded.map((key, value,) => MapEntry(key.toString(), value.toString(),),);
    this.localizedTitles = fileDataAsMap;
  }

  String getKeyTranslated(String key,){
    return localizedTitles[key] ?? '';
  }
}

class _MyAppLocalDelegate extends LocalizationsDelegate<MyAppLocal>{
  const _MyAppLocalDelegate();

  @override
  bool isSupported(Locale locale) {
    var supportedLocales =  const <Locale>[
      Locale('en', ''),
      Locale('ar', ''),
      Locale('tr', ''),
    ];
    return  supportedLocales.where((myLocal,) => myLocal.languageCode == locale.languageCode,).isNotEmpty;
  }

  @override
  Future<MyAppLocal> load(Locale locale) async{
    final MyAppLocal _myAppLocal = MyAppLocal(locale);
    await _myAppLocal.loadLocalizationFile();
    return _myAppLocal;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MyAppLocal> old) {
    return MyAppLocal.delegate != old;
  }

}