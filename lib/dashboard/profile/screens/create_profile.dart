import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/dashboard.dart';
import 'package:instagram_clone/dashboard/profile/components/edit_text_field.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
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
            child: Column(
              children: [
                10.height,
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.darkGrey,
                        radius: 40,
                        child: Icon(
                          Icons.photo,
                          color: AppColors.grey,
                        ),
                      ),
                      12.height,
                      Text(
                        'Select picture',
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
      ),
    );
  }
}
