import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text, this.onTap,
  });
  final String text;
  final VoidCallback ? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.blue,
      onPressed: onTap,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      height: 44,
      child: Text(
        text,
        style: AppTextStyle.boldWhite14,
      ),
    );
  }
}
