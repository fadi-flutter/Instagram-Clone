import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/createpost/providers/createpost_provider.dart';
import 'package:instagram_clone/dashboard/profile/components/edit_text_field.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    final createPostProvider = Provider.of<CreatePostProvider>(context);
    final sizeh = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.darkGrey,
              height: sizeh * 0.4,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: AppColors.grey,
                    size: 40,
                  ),
                  Text(
                    'Select Photo',
                    style: AppTextStyle.boldWhite14
                        .copyWith(color: AppColors.grey),
                  )
                ],
              ),
              // child: Image.asset(
              //   banner,
              //   fit: BoxFit.cover,
              // ),
            ),
            EditTextField(
              text: 'Description',
              controller: createPostProvider.descriptionC,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: AppColors.blue,
                minWidth: double.infinity,
                onPressed: () {
                  createPostProvider.uploadPost(context);
                },
                child: Text(
                  'Post',
                  style: AppTextStyle.mediumWhite14,
                ),
              ),
            ),
            10.height,
          ],
        ),
      ),
    );
  }
}
