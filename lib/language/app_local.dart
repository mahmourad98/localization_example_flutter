import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyAppLocal{
  final Locale theLocal;
  late final Map<String, String> _localizedTitles;

  MyAppLocal._(this.theLocal);

  static const LocalizationsDelegate<MyAppLocal> delegate = _MyAppLocalDelegate();

  static Future<MyAppLocal> init(Locale locale) async{
    final MyAppLocal _instance = MyAppLocal._(locale);
    await _instance._loadLocalizationFile();
    return _instance;
  }

  static MyAppLocal of(BuildContext buildContext){
    return Localizations.of<MyAppLocal>(buildContext, MyAppLocal) ?? Localizations.of(buildContext, MyAppLocal);
  }

  String getKeyTranslated(String key,){
    return _localizedTitles[key] ?? '';
  }

  Future<void> _loadLocalizationFile() async{
    String fileData = await rootBundle.loadString('assets/lang/${theLocal.languageCode}.json',);
    Map<String, dynamic> fileDataDecoded = jsonDecode(fileData,);
    Map<String, String> fileDataAsMap = fileDataDecoded.map((key, value,) => MapEntry(key.toString(), value.toString(),),);
    this._localizedTitles = fileDataAsMap;
    return;
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
    final MyAppLocal _myAppLocal = await MyAppLocal.init(locale);
    return _myAppLocal;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MyAppLocal> old) {
    return MyAppLocal.delegate != old;
  }

}