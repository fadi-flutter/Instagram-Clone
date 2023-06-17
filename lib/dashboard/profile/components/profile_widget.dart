import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/screens/edit_profile.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 7),
                height: 105,
                width: 105,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(banner), fit: BoxFit.cover),
                    color: AppColors.white,
                    shape: BoxShape.circle),
              ),
              Wrap(
                spacing: 22,
                children: [
                  Column(
                    children: [
                      Text(
                        '37',
                        style: AppTextStyle.boldWhite16,
                      ),
                      Text(
                        'Posts',
                        style: AppTextStyle.regularWhite14,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '100',
                        style: AppTextStyle.boldWhite16,
                      ),
                      Text(
                        'Followers',
                        style: AppTextStyle.regularWhite14,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '162',
                        style: AppTextStyle.boldWhite16,
                      ),
                      Text(
                        'Following',
                        style: AppTextStyle.regularWhite14,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          10.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fahad Ali',
                style: AppTextStyle.mediumWhite14,
              ),
              2.height,
              Text(
                'This is description you read it but cannot change\n because i have not integrated backend yet 😂',
                style: AppTextStyle.regularWhite12,
                maxLines: 4,
              ),
            ],
          ),
          13.height,
          MaterialButton(
            color: AppColors.black,
            minWidth: double.infinity,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ));
            },
            child: Text(
              'Edit Profile',
              style: AppTextStyle.mediumWhite14,
            ),
          ),
        ],
      ),
    );
  }
}
