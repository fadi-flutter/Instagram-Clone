import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/components/edit_text_field.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: AppColors.white,
              size: 28,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                color: AppColors.blue,
                size: 28,
              )),
        ],
        title: Text(
          'Edit Profile',
          style: AppTextStyle.boldWhite20,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.height,
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(banner),
                    ),
                    12.height,
                    Text(
                      'Edit picture',
                      style: AppTextStyle.boldWhite14
                          .copyWith(color: AppColors.blue),
                    )
                  ],
                ),
              ),
              25.height,
              const EditTextField(
                text: 'Name',
              ),
              const EditTextField(
                text: 'User Name',
              ),
              const EditTextField(
                text: 'Bio',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
