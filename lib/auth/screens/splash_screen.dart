import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/auth/screens/login_screen.dart';
import 'package:instagram_clone/dashboard/dashboard.dart';
import 'package:instagram_clone/dashboard/profile/screens/create_profile.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final User? _auth = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    navigateScreen();
  }

  Future<bool> getUserData() async {
    if (_auth != null) {
      final data = await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(_auth!.uid)
          .get();
      if (data.exists) {
        return true;
      }
    }
    return false;
  }

  navigateScreen() async {
    bool profileCreated = await getUserData();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => _auth != null
                ? profileCreated
                    ? const Dashboard()
                    : CreateProfile()
                : LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              splash,
              height: 130,
              width: 130,
            ),
          ),
          20.height,
          Text(
            'Designed & Created By Fadi-Flutter',
            style: AppTextStyle.mediumBlack12.copyWith(color: AppColors.grey),
          )
        ],
      ),
    );
  }
}
