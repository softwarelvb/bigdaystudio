import 'package:bigdaystudio/longin3.dart';
import 'package:bigdaystudio/screens/RegisterWed/RegisterWed.dart';
import 'package:bigdaystudio/screens/Reservation/Wedding.dart';
import 'package:bigdaystudio/screens/auth/register.dart';
import 'package:bigdaystudio/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final colortheme = ThemeData(
    fontFamily: "NotoSansLao",
    primaryColor: Colors.amberAccent,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow));

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: colortheme,
      home: LoginPage3(),
      initialRoute: "/login",
      routes: {
        "/homepage": (context) => const HomePage(),
        "/register": (context) => PhotographerReservationForm(),
        "/login": (context) => LoginPage3(),
        "/register-user": (context) => Registeruser()
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
