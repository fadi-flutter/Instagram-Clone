import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/dashboard/profile/screens/edit_profile.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    super.key,
    required this.profileProvider,
    required this.viewFriend,
  });
  final ProfileProvider profileProvider;
  final bool viewFriend;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 7),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //image
                        image: NetworkImage(profileProvider.image),
                        fit: BoxFit.cover),
                    color: AppColors.darkGrey,
                    shape: BoxShape.circle),
              ),
              Wrap(
                spacing: 22,
                children: [
                  Column(
                    children: [
                      Text(
                        //posts
                        profileProvider.posts.toString(),
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
                        //followers
                        profileProvider.followers.length.toString(),
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
                        //followings
                        profileProvider.followings.length.toString(),
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
                //name
                profileProvider.name,
                style: AppTextStyle.mediumWhite14,
              ),
              2.height,
              SizedBox(
                width: 300,
                child: Text(
                  profileProvider.bio,
                  style: AppTextStyle.regularWhite12,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          13.height,
          Row(
            children: [
              //checking if user viewing his own profile or friends profile
              viewFriend
                  ? Expanded(
                      child: MaterialButton(
                        //checking if current user already following or not
                        color: profileProvider.followers
                                .contains(_auth.currentUser!.uid)
                            ? AppColors.black
                            : AppColors.blue,
                        onPressed: () {
                          //if user already following then remove otherwise add
                          profileProvider.handleFollowUser(
                              profileProvider.id, context);
                        },
                        child: Text(
                          //checking if current user already following or not
                          profileProvider.followers
                                  .contains(_auth.currentUser!.uid)
                              ? 'Cancel Following'
                              : 'Follow',
                          style: AppTextStyle.mediumWhite14,
                        ),
                      ),
                    )
                  : Expanded(
                      child: MaterialButton(
                        color: AppColors.black,
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
                    )
            ],
          ),
        ],
      ),
    );
  }
}
