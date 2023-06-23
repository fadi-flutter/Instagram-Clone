import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  //comment
  final commentC = TextEditingController();
  int fieldHeight = 0;

  getforumPosts() {
    return _firestore.collection(postCollection).snapshots().map(
          (event) => event.docs.map((e) => PostModel.fromFireStore(e)).toList(),
        );
  }

  addComments(BuildContext context, String postID) async {
    if (commentC.text.isEmpty) {
      print(commentC.text);
      return;
    }
    try {
      EasyLoading.show();
      final profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);
      await _firestore
          .collection(postCollection)
          .doc(postID)
          .collection(commentCollection)
          .add({
        'time_stamp': DateTime.now(),
        'userName': profileProvider.userName,
        'userImage': profileProvider.image,
        'comment': commentC.text,
        'userID': profileProvider.id,
      });
      commentC.clear();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, 'Check your internet connection or try again!');
    }
  }

  changeHeight(int height) {
    fieldHeight = height;
    notifyListeners();
  }
}
