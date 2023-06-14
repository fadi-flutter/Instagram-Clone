import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';

class Functions {
  static snackbar(String string) {
    return SnackBar(
      duration: const Duration(seconds: 4),
      backgroundColor: AppColors.black,
      content: Text(string),
    );
  }
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

const String logoImage = 'assets/images/insta_logo.png';
const String banner = 'assets/images/banner.jpeg';
