import 'package:flutter/material.dart';
import 'package:instagram_clone/auth/providers/auth_provider.dart';
import 'package:instagram_clone/auth/screens/login_screen.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/utils/widgets/auth_button.dart';
import 'package:instagram_clone/utils/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final AuthProvider authP = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                TextFieldWidget(
                  hintText: 'Email',
                  controller: authP.signEmailC,
                ),
                10.height,
                Consumer<AuthProvider>(
                  builder: (context, value, child) {
                    return TextFieldWidget(
                      hintText: 'Password',
                      controller: authP.signPasswordC,
                      obscureText: value.hidePassword,
                      widget: GestureDetector(
                        onTap: () {
                          value.obscurePassword();
                        },
                        child: Icon(
                          value.hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: value.hidePassword
                              ? AppColors.grey
                              : AppColors.white,
                        ),
                      ),
                    );
                  },
                ),
                30.height,
                AuthButton(
                  onTap: () async {
                    //signup
                    await authP.signInEmail(context);
                  },
                  text: 'Sign up',
                ),
                35.height,
                GestureDetector(
                  onTap: () {
                    authP.signInGoogle(context);
                  },
                  child: Text(
                    'Sign up with Google',
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
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Log in.",
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
