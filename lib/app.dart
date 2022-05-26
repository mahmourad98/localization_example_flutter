import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled03/language/app_local.dart';
import 'package:untitled03/language/language_change_notifier.dart';
import 'home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext buildContext, Locale locale,){
    final _MyAppState? myAppState = buildContext.findAncestorStateOfType<_MyAppState>();
    myAppState?.setLocale(buildContext, locale,);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SafeArea(
        child: MyHomePage(),
      ),
      locale: AppLanguage.of(buildContext)?.languageLocal,
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
      // localeResolutionCallback: (currentLocal, supportedLocals){
      //   if (currentLocal != null) {
      //     if(supportedLocals.where((supportedLocal) => supportedLocal.languageCode == currentLocal.languageCode).isNotEmpty){
      //       return currentLocal;
      //     }
      //     return supportedLocals.first;
      //   }
      //   return supportedLocals.first;
      //   // return supportedLocals.where((supportedLocal) => supportedLocal.languageCode == MyApp.local).first;
      // },
    );
  }

  void setLocale(BuildContext _buildContext, Locale locale,) {
    setState(() {
      AppLanguage.of(_buildContext)?.languageLocal = locale;
    });
  }
}