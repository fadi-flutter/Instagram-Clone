import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.icon,
    this.color,
    this.prefixIcon,
    this.height = 50,
    this.hintStyle,
    this.radius = 5,
  });
  final String hintText;
  final bool obscureText;
  final Icon? icon;
  final Color? color;
  final Icon? prefixIcon;
  final double height;
  final TextStyle? hintStyle;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        cursorColor: AppColors.white,
        obscureText: obscureText,
        style: AppTextStyle.mediumWhite14,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: icon,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle ??
              AppTextStyle.mediumWhite14.copyWith(color: AppColors.grey),
          filled: true,
          contentPadding: const EdgeInsets.only(bottom: 5, left: 13),
          fillColor: color ?? AppColors.darkGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
