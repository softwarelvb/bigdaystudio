import 'package:bigdaystudio/longin3.dart';
import 'package:bigdaystudio/screens/RegisterWed/RegisterWed.dart';
import 'package:bigdaystudio/screens/Reservation/Wedding.dart';
import 'package:bigdaystudio/screens/auth/ResetPassword.dart';
import 'package:bigdaystudio/screens/auth/register.dart';
import 'package:bigdaystudio/screens/homepage/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final colortheme = ThemeData(
    fontFamily: "NotoSansLao",
    primaryColor: Colors.amberAccent,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: colortheme,
      home: const LoginFirebase(),
      initialRoute: "/login",
      routes: {
        "/homepage": (context) => const HomePage(),
        "/register": (context) => const PhotographerReservationForm(),
        "/login": (context) => const LoginFirebase(),
        "/register-user": (context) => const RegisterUser(),
        "/reset-password": (context) => const ResetPassword()
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
