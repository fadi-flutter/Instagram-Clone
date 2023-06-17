import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/components/comments_section.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 09, vertical: 09),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(banner),
                  ),
                  4.width,
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 1,
                    children: [
                      2.height,
                      Text(
                        'fadi_ops',
                        style: AppTextStyle.regularWhite12,
                      ),
                      Text(
                        'Fsd, Pakistan',
                        style: AppTextStyle.regularWhite12,
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.more_horiz_outlined,
                color: AppColors.white,
              )
            ],
          ),
        ),
        10.height,
        Container(
          height: 350,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(banner),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 18,
                children: [
                  const Icon(Icons.favorite_outline, size: 26),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const CommentsSection();
                          },
                        );
                      },
                      child: const Icon(Icons.comment_outlined, size: 26)),
                  const Icon(Icons.send, size: 26),
                ],
              ),
              const Icon(Icons.save_alt, size: 26),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.centerLeft,
          child: Text(
            '100 likes',
            style: AppTextStyle.boldWhite12,
          ),
        ),
        4.height,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'This is description you read it but cannot change because i have not integrated backend yet 😂',
            style: AppTextStyle.regularWhite12,
          ),
        ),
        8.height,
        Divider(
          color: AppColors.mediumGrey,
          thickness: 1,
        )
      ],
    );
  }
}
