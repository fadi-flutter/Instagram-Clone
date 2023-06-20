import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/components/edit_text_field.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';

class CreateProfile extends StatelessWidget {
  CreateProfile({super.key});
  final ProfileProvider profileProvider = ProfileProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Scaffold(
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
                onPressed: () {
                  profileProvider.uploadProfile(context);
                },
                icon: const Icon(
                  Icons.check,
                  color: AppColors.blue,
                  size: 28,
                )),
          ],
          title: Text(
            'Create Profile',
            style: AppTextStyle.boldWhite20,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<ProfileProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        10.height,
                        Center(
                          child: Column(
                            children: [
                              value.profileImage.path.isEmpty
                                  ? CircleAvatar(
                                      backgroundColor: AppColors.darkGrey,
                                      radius: 40,
                                      child: Icon(
                                        Icons.photo,
                                        color: AppColors.grey,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: AppColors.darkGrey,
                                      radius: 40,
                                      backgroundImage: FileImage(
                                        File(value.profileImage.path),
                                      ),
                                    ),
                              12.height,
                              GestureDetector(
                                onTap: () {
                                  value.pickProfileImage();
                                },
                                child: Text(
                                  'Select picture',
                                  style: AppTextStyle.boldWhite14
                                      .copyWith(color: AppColors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                        25.height,
                        EditTextField(
                          controller: value.nameC,
                          text: 'Full Name',
                        ),
                        EditTextField(
                          controller: value.userNameC,
                          text: 'User Name',
                        ),
                        EditTextField(
                          controller: value.bioC,
                          text: 'Bio',
                        ),
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
