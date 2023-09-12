import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/UserModel.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String phone,
  }) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore db = FirebaseFirestore.instance;
      // Create Firebase user with email and password
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user object with required properties
      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        name: name,
        email: email,
        role: role,
        phone: phone,
      );

      // Check if email already exists in the 'users' collection
      QuerySnapshot snapshot = await db
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        // Email already exists, handle error
        throw Exception('email-already-in-use');
      }

      // Save user object to Firestore
      await db.collection('users').doc(user.uid).set(user.toJson());

      Fluttertoast.showToast(
        msg: 'ລົງທະບຽນຜູ້ໃຊ້ສຳເລັດແລ້ວ',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: 'ລະບົບບໍ່ອະນຸມັດໃຫ້ໃຊ້ລະຫັດຜ່ານນີ້',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'ບັນຊີນີ້ ຖືກລົງທະບຽນໃນລະບົບແລ້ວ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return false;
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        Fluttertoast.showToast(
          msg: 'ຜູ້ໃຊ້ເຂົ້າສູ່ລະບົບ ສຳເລັດແລ້ວ!!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        final user = UserModel(
            uid: userData['uid'],
            name: userData['name'],
            email: userData['email'],
            role: userData['role'],
            phone: userData['phone']);
        return user;
      } else {
        throw Exception('User data not found');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: 'ບໍ່ພົບຜູ້ໃຊ້ພາຍໃນລະບົບ!!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: 'ອີເມວ ແລະ ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ!!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print("errr ${e.toString()}");
      // Fluttertoast.showToast(
      //   msg: e.toString(),
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      // );
    }
    return null;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
