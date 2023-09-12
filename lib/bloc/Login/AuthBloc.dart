import 'package:bigdaystudio/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/UserService.dart';
import 'AuthEvent.dart';
import 'AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {

    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        UserModel? user = await authService.signInWithEmailAndPassword(event.email, event.password);
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (e) {
        emit(AuthUnauthenticated());
      }
    });

    on<LogoutEvent>((event, emit) async {
      await authService.signOut();
      emit(AuthUnauthenticated());
    });
  }
}
