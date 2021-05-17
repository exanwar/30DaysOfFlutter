import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtechviral/pages/home_page.dart';
import 'package:mtechviral/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtechviral/utils/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // int days = 30;
    // String name = "Codepur";
    // double currency = 3.1416;
    // bool isMale = true;

    // //! num will takle both int and double
    // num temp = 30.5;

    // //! any value will take and on compile will decide the type
    // var day = "Thursday";

    // //! const value will never change, like constants
    // const pi = 3.1416;

    // //! const can not change but final can modified. Like a const list can cot add more data but final list can to add more
    // final data = [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      //For Light Theme
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),

      //for Dark Theme Mode
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
