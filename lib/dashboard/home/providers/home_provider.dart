import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instagram_clone/dashboard/home/models/comment_model.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:video_player/video_player.dart';

class HomeProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  //comment
  String commentC = '';
  int fieldHeight = 0;
  //video
  VideoPlayerController? videoC;
  bool playVideo = false;

  getComment(String comment) {
    commentC = comment;
    notifyListeners();
  }

  getforumPosts() {
    return _firestore.collection(postCollection).snapshots().map(
          (event) => event.docs.map((e) => PostModel.fromFireStore(e)).toList(),
        );
  }

  Stream<List<CommentModel>> getCommentsStream(String postID) {
    return _firestore
        .collection(postCollection)
        .doc(postID)
        .collection(commentCollection)
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => CommentModel.fromFireStore(e)).toList(),
        );
  }

  addComments(BuildContext context, String postID) async {
    if (commentC.isEmpty) {
      return;
    }
    try {
      EasyLoading.show();
      final data = await getCurrentUserProfile();
      await _firestore
          .collection(postCollection)
          .doc(postID)
          .collection(commentCollection)
          .add({
        'time_stamp': DateTime.now(),
        'userName': data['userName'],
        'userImage': data['image'],
        'comment': commentC,
        'userID': data['id'],
      });
      getComment('');
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, 'Check your internet connection or try again');
    }
  }

  

  

  changeHeight(int height) {
    fieldHeight = height;
    notifyListeners();
  }
}
