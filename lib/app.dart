import 'package:bigdaystudio/screens/auth/longin3.dart';
import 'package:bigdaystudio/screens/routes.dart';
import 'package:bigdaystudio/services/UserService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/Login/AuthBloc.dart';

final colortheme = ThemeData(
    fontFamily: "NotoSansLao",
    primaryColor: Colors.amberAccent,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow));

class MyApp extends StatelessWidget {
  final _authState = BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(AuthService()));

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [_authState],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: colortheme,
        home: const LoginFirebase(),
        initialRoute: "/login",
        routes: AppRoute.all,
        // routes: {
        //   "/homepage": (context) => const HomePage(),
        //   "/register": (context) => const PhotographerReservationForm(),
        //   "/login": (context) => const LoginFirebase(),
        //   "/register-user": (context) => const RegisterUser(),
        //   "/reset-password": (context) => const ResetPassword(),
        //   "/profile": (context) => const UserProfilePage()
        // },
      ),
    );
  }
}