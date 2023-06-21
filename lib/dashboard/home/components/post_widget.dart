import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/components/comments_section.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatelessWidget {
  PostWidget({
    super.key,
    required this.post,
  });
  final PostModel post;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 09, vertical: 09),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(post.userImage),
                  ),
                  4.width,
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 1,
                    children: [
                      2.height,
                      Text(
                        post.userName,
                        style: AppTextStyle.regularWhite12,
                      ),
                      Text(
                        '${post.city}, ${post.country}',
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(post.image),
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
                  GestureDetector(
                    onTap: () {
                      profileProvider.handelLikes(post);
                    },
                    child: Icon(
                        post.likes.contains(_auth.currentUser!.uid)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: post.likes.contains(_auth.currentUser!.uid)
                            ? AppColors.pink
                            : AppColors.white,
                        size: 26),
                  ),
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
            '${post.likes.length} likes',
            style: AppTextStyle.boldWhite12,
          ),
        ),
        4.height,
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            post.description,
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
