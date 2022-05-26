import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled03/language/app_local.dart';
import 'package:untitled03/language/language_change_notifier.dart';
import 'home_page.dart';
import 'main.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key,}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static Future<void> setLocale(BuildContext buildContext, Locale locale,) async {
    final _MyAppState? myAppState = buildContext.findAncestorStateOfType<_MyAppState>();
    SharedPreferences sharedPreferences = await SharedPreferencesHelper.getInstance();
    sharedPreferences.setString('lang', locale.languageCode.toString(),);
    myAppState?.setLocale(buildContext, locale,);
  }
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    getLocale(buildContext);
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

  void setLocale(BuildContext _buildContext, Locale locale,) {
    setState(() {
      AppLanguage.of(_buildContext)?.languageLocal = locale;
    });
  }

  Future<void> getLocale(BuildContext _buildContext) async{
    SharedPreferences sharedPreferences = await SharedPreferencesHelper.getInstance();
    String _language = 'en';
    if(sharedPreferences.getString('lang',) != null){
      _language = sharedPreferences.getString('lang',).toString();
      setLocale(_buildContext, Locale(_language, '',),);
    }
    else{
      sharedPreferences.setString('lang', _language.toString(),);
      setLocale(_buildContext, Locale(_language, '',),);
    }
  }
}