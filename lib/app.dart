import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled03/language/app_local.dart';
import 'home_page.dart';

class MyApp extends StatefulWidget {
  static Locale local = const Locale('tr', '');
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SafeArea(
        child: MyHomePage(),
      ),
      locale: MyApp.local,
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('tr', ''),
      ],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MyAppLocal.delegate,
      ],
      localeResolutionCallback: (currentLocal, supportedLocals){
        if (currentLocal != null) {
          if(supportedLocals.where((supportedLocal) => supportedLocal.languageCode == currentLocal.languageCode).isNotEmpty){
            return currentLocal;
          }
          return supportedLocals.first;
        }
        return supportedLocals.first;
        // return supportedLocals.where((supportedLocal) => supportedLocal.languageCode == MyApp.local).first;
      },
    );
  }
}