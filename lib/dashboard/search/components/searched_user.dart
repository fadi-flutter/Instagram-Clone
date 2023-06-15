import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class SearchedUser extends StatelessWidget {
  const SearchedUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.mediumGrey)),
      margin: const EdgeInsets.symmetric(horizontal: 09, vertical: 08),
      padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage(banner),
          ),
          6.width,
          Wrap(
            direction: Axis.vertical,
            spacing: 2,
            children: [
              2.height,
              Text(
                'fadi_ops',
                style: AppTextStyle.regularWhite12,
              ),
              Text(
                'Fahad Ali',
                style:
                    AppTextStyle.regularWhite12.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
