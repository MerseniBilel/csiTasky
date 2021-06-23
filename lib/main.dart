import 'package:csitasky/pages/DetailsPage.dart';
import 'package:csitasky/pages/HomePage.dart';
import 'package:csitasky/pages/LoginPage.dart';
import 'package:csitasky/pages/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'globals.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPurpleColor,
      ),
      debugShowCheckedModeBanner: false,
      title: 'csiTasky',
      routes: {
        '': (_) => WelcomePage(),
        '/home': (_) => HomePage(),
        '/details': (_) => DetailsPage(),
        '/login': (_) => LoginPage()
      },
      home: WelcomePage(),
    );
  }
}
