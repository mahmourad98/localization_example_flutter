import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'language/language_change_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppLanguage(child: const MyApp(),),);
}

class SharedPreferencesHelper{
  static SharedPreferences? _sharedPreferences;

  SharedPreferencesHelper._();

  static Future getInstance() async{
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences;
  }
}

