import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.icon,
  });
  final String hintText;
  final bool obscureText;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        cursorColor: AppColors.white,
        obscureText: obscureText,
        style: AppTextStyle.mediumWhite14,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: icon,
          hintStyle: AppTextStyle.mediumWhite14.copyWith(color: AppColors.grey),
          filled: true,
          contentPadding: const EdgeInsets.only(bottom: 5, left: 13),
          fillColor: AppColors.darkGrey,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
