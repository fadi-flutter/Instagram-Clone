import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/dashboard/reels/components/reels_item.dart';
import 'package:instagram_clone/dashboard/reels/providers/reels_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:provider/provider.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reelsP = Provider.of<ReelsProvider>(context);
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
      body: StreamBuilder<List<PostModel>>(
        stream: reelsP.getReels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Please check your internet connection\nand try again!',
                style: AppTextStyle.regularBlack14,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.isEmpty) {
            Center(
              child: Text(
                'Not Reels found',
                style: AppTextStyle.mediumWhite14,
              ),
            );
          }
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              return ReelItem(
                post: snapshot.data![index], reelsP: reelsP,
              );
            },
          );
        },
      ),
    );
  }
}
