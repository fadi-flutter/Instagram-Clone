import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/components/post_widget.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class ShowPost extends StatelessWidget {
  const ShowPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const SafeArea(child: PostWidget()),
    );
  }
}
