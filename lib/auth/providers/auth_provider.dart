// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instagram_clone/dashboard/dashboard.dart';
import 'package:instagram_clone/dashboard/profile/screens/create_profile.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  //sign in
  final signEmailC = TextEditingController();
  final signPasswordC = TextEditingController();
  //login
  final loginEmailC = TextEditingController();
  final loginPasswordC = TextEditingController();
  //reset password
  final resetpasswordC = TextEditingController();
  //hide Password
  bool hidePassword = true;
  final googleSignIn = GoogleSignIn();

//signin with email
  signInEmail(BuildContext context) async {
    if (signEmailC.text.isEmpty || signPasswordC.text.isEmpty) {
      showToast(context, 'All fields required');
      return;
    }
    try {
      EasyLoading.show();
      await _auth.createUserWithEmailAndPassword(
        email: signEmailC.text.toString(),
        password: signPasswordC.text.toString(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  CreateProfile()),
      );
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, e.toString());
    }
  }

//login with email
  logInEmail(BuildContext context) async {
    if (loginEmailC.text.isEmpty || loginPasswordC.text.isEmpty) {
      showToast(context, 'All fields required');
      return;
    }
    try {
      EasyLoading.show();
      await _auth.signInWithEmailAndPassword(
        email: loginEmailC.text.toString(),
        password: loginPasswordC.text.toString(),
      );
      if (_auth.currentUser != null) {
        bool data = await getUserData();
        data
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              )
            : Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  CreateProfile()));
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, e.toString());
    }
  }

  signInGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) return;
      EasyLoading.show();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await _auth.signInWithCredential(credential);
      if (_auth.currentUser != null) {
        bool data = await getUserData();
        data
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              )
            : Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  CreateProfile()));
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, 'Check your internet connection or try again');
    }
  }

  resetPassword(BuildContext context) {
    if (resetpasswordC.text.isEmpty) {
      showToast(context, 'Enter Email');
      return;
    }
    try {
      EasyLoading.show();
      _auth.sendPasswordResetEmail(email: resetpasswordC.text);
      showToast(context, 'Email Sent');
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, 'Check your internet connection or try again');
    }
  }

  Future<bool> getUserData() async {
    final data = await _firestore
        .collection(userCollection)
        .doc(_auth.currentUser!.uid)
        .get();
    if (data.exists) {
      return true;
    }
    return false;
  }

//obscurePassword
  obscurePassword() {
    if (hidePassword) {
      hidePassword = false;
    } else {
      hidePassword = true;
    }
    notifyListeners();
  }
}
