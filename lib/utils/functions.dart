import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

void showToast(BuildContext context, String text) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          text,
          style: AppTextStyle.mediumWhite14,
        ),
      ),
    ),
  );
}

const String userCollection = 'user';
const String postCollection = 'post';
const String commentCollection = 'comment';


/// A function that accepts a FirebaseAuthException and returns a string
/// describing the error.
getFirebaseAuthExceptionError(FirebaseAuthException exception, context) {
  String errorMessage;
  switch (exception.code) {
    case 'invalid-email':
      errorMessage = 'The email address is invalid.';
      break;
    case 'wrong-password':
      errorMessage = 'The password is incorrect.';
      break;
    case 'user-not-found':
      errorMessage = 'The user does not exist.';
      break;
    case 'user-disabled':
      errorMessage = 'The user has been disabled.';
      break;
    case 'too-many-requests':
      errorMessage =
          'Too many requests have been made. Please try again later.';
      break;
    case 'operation-not-allowed':
      errorMessage = 'The operation is not allowed.';
      break;
    case 'email-already-in-use':
      errorMessage = 'The email address is already in use.';
      break;
    case 'weak-password':
      errorMessage =
          'The password provided is too weak. Please choose a stronger password.';
      break;
    default:
      errorMessage = 'An unknown error occurred.';
      break;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(errorMessage)),
  );
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

const String logoImage = 'assets/images/insta_logo.png';
const String banner = 'assets/images/banner.jpeg';
const String splash = 'assets/images/splash.png';
