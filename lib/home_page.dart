import 'package:flutter/material.dart';
import 'package:untitled03/app.dart';
import 'package:untitled03/language/app_local.dart';

import 'language/language_change_notifier.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var values = [];
  @override
  Widget build(BuildContext buildContext,) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48,),
        child: AppBar(
          title: const Text('Flutter Demo Project 03',),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                child: Text(MyAppLocal.of(buildContext,).getKeyTranslated('welcomeText',),),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  MyApp.setLocale(context, const Locale('en', '',),);
                });
              },
              child: const Text('EN',),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  MyApp.setLocale(context, const Locale('ar', '',),);
                });
              },
              child: const Text('AR',),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  MyApp.setLocale(context, const Locale('tr', '',),);
                });
              },
              child: const Text('TR',),
            ),
          ],
        ),
      ),
    );
  }
}
