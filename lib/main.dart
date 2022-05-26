import 'package:flutter/material.dart';
import 'app.dart';
import 'language/language_change_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppLanguage(child: MyApp(),));
}

