import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/home/components/comments_section.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:instagram_clone/utils/functions.dart';

class SinglePost extends StatefulWidget {
  const SinglePost({
    super.key,
    required this.post,
  });
  final PostModel post;

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  final _auth = FirebaseAuth.instance;

  final CollectionReference<Map<String, dynamic>> docForum =
      FirebaseFirestore.instance.collection(postCollection);
  List likes = [];
  @override
  void initState() {
    super.initState();
    likes = List.from(widget.post.likes);
  }

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
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.post.userImage),
                  ),
                  7.width,
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 1,
                    children: [
                      2.height,
                      Text(
                        widget.post.userName,
                        style: AppTextStyle.regularWhite12,
                      ),
                      Text(
                        '${widget.post.city}, ${widget.post.country}',
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
              image: NetworkImage(widget.post.image),
              fit: BoxFit.fill,
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
                      likes.contains(_auth.currentUser!.uid)
                          ? likes.remove(_auth.currentUser!.uid)
                          : likes.add(_auth.currentUser!.uid);
                      handelLikes(widget.post);
                      setState(() {});
                    },
                    child: Icon(
                        likes.contains(_auth.currentUser!.uid)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: likes.contains(_auth.currentUser!.uid)
                            ? AppColors.pink
                            : AppColors.white,
                        size: 26),
                  ),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CommentsSection(
                              postID: widget.post.docID,
                            );
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
            '${likes.length} likes',
            style: AppTextStyle.boldWhite12,
          ),
        ),
        4.height,
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            widget.post.description,
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

  handelLikes(PostModel post) {
    final userUid = _auth.currentUser!.uid;
    if (post.likes.contains(userUid)) {
      docForum.doc(post.docID).update({
        'likes': FieldValue.arrayRemove([userUid])
      });
    } else {
      docForum.doc(post.docID).update({
        'likes': FieldValue.arrayUnion([userUid])
      });
    }
  }
}
