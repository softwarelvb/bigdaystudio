import 'package:bigdaystudio/screens/Reservation/Wedding.dart';
import 'package:bigdaystudio/screens/UserProfile/UpdateUserProfilePage.dart';
import 'package:bigdaystudio/screens/UserProfile/UserProfile.dart';
import 'package:bigdaystudio/screens/auth/ResetPassword.dart';
import 'package:bigdaystudio/screens/auth/longin3.dart';
import 'package:bigdaystudio/screens/auth/register.dart';
import 'package:bigdaystudio/screens/homepage/home.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static const home = 'homepage';
  static const login = 'login';
  static const profile = 'profile';
  static const register = 'register-user';
  static const resetPassword = 'reset-password';
  static const reservation = 'reservation';
  static const updateUserProfile = 'update-user-profile';

  static get all => <String, WidgetBuilder>{
        home: (context) => const HomePage(),
        login: (context) => const LoginFirebase(),
        register: (context) => const RegisterUser(),
        profile: (context) => const UserProfilePage(),
        updateUserProfile: (context) => const UpdateUserProfilePage(),
        resetPassword: (context) => const ResetPassword(),
        reservation: (context) => const PhotographerReservationForm()
      };
}
