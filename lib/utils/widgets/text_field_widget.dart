import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.color,
    this.prefixIcon,
    this.height = 50,
    this.hintStyle,
    this.radius = 5,
    this.controller,
    this.widget, this.onChanged,
  });
  final String hintText;
  final bool obscureText;
  final Color? color;
  final Icon? prefixIcon;
  final double height;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final double radius;
  final Widget? widget;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        cursorColor: AppColors.white,
        obscureText: obscureText,
        style: AppTextStyle.mediumWhite14,
        onChanged: onChanged,
        decoration: InputDecoration(
          
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle ??
              AppTextStyle.mediumWhite14.copyWith(color: AppColors.grey),
          filled: true,
          contentPadding: const EdgeInsets.only(bottom: 5, left: 13, right: 5),
          fillColor: color ?? AppColors.darkGrey,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          suffixIcon: widget,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
