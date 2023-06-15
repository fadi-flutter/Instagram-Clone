import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/auth_button.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.white,
          ),
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  //image
                  logoImage,
                  color: AppColors.white,
                  height: 110,
                ),
                20.height,
                const TextFieldWidget(
                  hintText: 'Email',
                ),
                5.height,
                Text(
                  'We will send you a link on your email where you can reset your password',
                  style: AppTextStyle.regularBlack12
                      .copyWith(color: AppColors.grey),
                ),
                30.height,
                const AuthButton(
                  text: 'Send Email',
                ),
                35.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
