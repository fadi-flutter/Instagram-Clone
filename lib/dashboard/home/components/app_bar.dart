import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/reels/providers/reels_provider.dart';
import 'package:instagram_clone/dashboard/reels/screens/reels_screen.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.white,
              size: 26,
            ),
          ),
          01.width,
          Image.asset(
            logoImage,
            color: AppColors.white,
            height: 60,
          ),
          Wrap(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => ReelsProvider(),
                        child: const ReelsScreen(),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.live_tv_outlined,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
