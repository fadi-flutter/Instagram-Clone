import 'package:flutter/material.dart';
import 'package:instagram_clone/auth/screens/forgot_password.dart';
import 'package:instagram_clone/auth/screens/signup_screen.dart';
import 'package:instagram_clone/dashboard/profile/screens/create_profile.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/auth_button.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
                10.height,
                TextFieldWidget(
                  hintText: 'Password',
                  obscureText: true,
                  icon: Icon(
                    Icons.visibility,
                    color: AppColors.grey,
                  ),
                ),
                17.height,
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyle.mediumBlack12
                          .copyWith(color: AppColors.blue),
                    ),
                  ),
                ),
                30.height,
                AuthButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateProfile()),
                    );
                  },
                  text: 'Log in',
                ),
                35.height,
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Log in with Google',
                    style: AppTextStyle.mediumWhite14
                        .copyWith(color: AppColors.blue),
                  ),
                ),
                25.height,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.darkGrey.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      'OR',
                      style: AppTextStyle.regularWhite14,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.darkGrey.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
                25.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyle.mediumWhite14
                          .copyWith(color: AppColors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: Text(
                        "Sign up.",
                        style: AppTextStyle.mediumWhite14
                            .copyWith(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
