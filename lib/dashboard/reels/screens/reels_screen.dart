import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

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
        backgroundColor: Colors.black,
        title: Text(
          'Reels',
          style: AppTextStyle.mediumWhite18,
        ),
      ),
      body: const Column(
        children: [
          Icon(Icons.thumb_up),
        ],
      ),
    );
  }
}
