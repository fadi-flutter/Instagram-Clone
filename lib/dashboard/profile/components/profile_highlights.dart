import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class ProfileHighlights extends StatelessWidget {
  const ProfileHighlights({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 09),
      child: Column(
        children: [
          index != 0
              ? Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(banner), fit: BoxFit.cover),
                      border: Border.all(
                          color: AppColors.pink,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      color: AppColors.white,
                      shape: BoxShape.circle),
                )
              : Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.grey.withOpacity(0.4),
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      color: AppColors.darkGrey,
                      shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
          Text(
            index == 0 ? 'New' : 'Fahad Ali',
            style: AppTextStyle.regularWhite12,
          )
        ],
      ),
    );
  }
}
