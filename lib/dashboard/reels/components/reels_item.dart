import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/dashboard/reels/components/heart_widget.dart';
import 'package:instagram_clone/dashboard/reels/providers/reels_provider.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:instagram_clone/utils/app_textstyle.dart';
import 'package:video_player/video_player.dart';

class ReelItem extends StatefulWidget {
  const ReelItem({
    super.key,
    required this.post,
    required this.reelsP,
  });
  final PostModel post;
  final ReelsProvider reelsP;

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  late VideoPlayerController _videoC;
  final _auth = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    _videoC = VideoPlayerController.network(widget.post.image)
      ..initialize().then((value) {
        _videoC.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        widget.reelsP.setValueAndReset();
        if (widget.post.likes.contains(_auth!.uid)) {
        } else {
          widget.reelsP.handelLikes(widget.post);
        }
      },
      child: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _videoC.value.aspectRatio,
              child: _videoC.value.isInitialized
                  ? VideoPlayer(_videoC)
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.pink,
                      ),
                    ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, AppColors.darkGrey],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          widget.post.userImage,
                        )),
                    const SizedBox(width: 8),
                    Text('Username', style: AppTextStyle.boldWhite14),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 280,
                  child: Text(widget.post.description,
                      style: AppTextStyle.regularWhite14),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 10,
            child: Wrap(
              spacing: 10,
              direction: Axis.vertical,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        widget.post.likes.contains(_auth!.uid)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.post.likes.contains(_auth!.uid)
                            ? AppColors.pink
                            : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        widget.reelsP.handelLikes(widget.post);
                      },
                    ),
                    Text(
                      widget.post.likes.length.toString(),
                      style: AppTextStyle.boldWhite14,
                    )
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          widget.reelsP.showHeart
              ? Center(
                  child: HeartWidget(
                    showHeart: widget.reelsP.showHeart,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
