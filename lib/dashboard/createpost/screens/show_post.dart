import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/components/post_widget.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class ShowPost extends StatelessWidget {
  const ShowPost({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColors.white,
        ),
        title: Text(
          'Post',
          style: AppTextStyle.boldWhite16,
        ),
      ),
      body: SafeArea(
          child: PostWidget(
        post: post,
      )),
    );
  }
}
