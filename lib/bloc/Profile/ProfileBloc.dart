import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ProfileEvent.dart';
import 'ProfileState.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfileEvent>((event, emit) async {
      try {
        emit(ProfileInitial());

        User? currentUser = _firebaseAuth.currentUser;

        if (currentUser != null) {
          emit(ProfileLoaded(currentUser));
        }
      } catch (e) {
        emit(ProfileLoadError());
      }
    });
  }
}
