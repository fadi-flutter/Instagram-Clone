import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage(banner),
          ),
          7.width,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: index.isEven ? 'fadi_ops  ' : 'its_chuza  ',
                        style: AppTextStyle.mediumWhite14),
                    TextSpan(
                        text: index.isEven
                            ? 'liked your photo'
                            : 'started following you',
                        style: AppTextStyle.regularWhite12),
                  ],
                ),
                maxLines: 2,
              ),
            ),
          ),
          30.width,
          index.isEven
              ? Container(
                  height: 55,
                  width: 65,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(banner), fit: BoxFit.cover),
                  ),
                )
              : MaterialButton(
                  onPressed: () {},
                  height: 30,
                  color: AppColors.blue,
                  child: Text(
                    'Follow',
                    style: AppTextStyle.boldWhite14,
                  ),
                )
        ],
      ),
    );
  }
}
