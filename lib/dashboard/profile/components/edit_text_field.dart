import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.text,
    required this.controller,
  });
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyle.regularBlack12.copyWith(color: AppColors.grey),
          ),
          SizedBox(
            height: 45,
            child: TextField(
              controller: controller,
              cursorColor: AppColors.white,
              style: AppTextStyle.mediumWhite14,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
