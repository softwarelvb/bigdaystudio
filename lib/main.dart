import 'package:bigdaystudio/bloc/Login/AuthBloc.dart';
import 'package:bigdaystudio/screens/UserProfile/UserProfile.dart';
import 'package:bigdaystudio/screens/auth/longin3.dart';
import 'package:bigdaystudio/screens/RegisterWed/RegisterWed.dart';
import 'package:bigdaystudio/screens/Reservation/Wedding.dart';
import 'package:bigdaystudio/screens/auth/ResetPassword.dart';
import 'package:bigdaystudio/screens/auth/register.dart';
import 'package:bigdaystudio/screens/homepage/home.dart';
import 'package:bigdaystudio/services/UserService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _authState = BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(AuthService()));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [_authState],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: colortheme,
        home: const LoginFirebase(),
        initialRoute: "/login",
        routes: {
          "/homepage": (context) => const HomePage(),
          "/register": (context) => const PhotographerReservationForm(),
          "/login": (context) => const LoginFirebase(),
          "/register-user": (context) => const RegisterUser(),
          "/reset-password": (context) => const ResetPassword(),
          "/profile": (context) => const UserProfilePage()
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
