import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/utils/functions.dart';

class ReelsProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> docForum =
      FirebaseFirestore.instance.collection(postCollection);
  bool showHeart = false;

  getReels() {
    return _firestore
        .collection(postCollection)
        .where('isImage', isEqualTo: false)
        .snapshots()
        .map(
          (event) => event.docs.map((e) => PostModel.fromFireStore(e)).toList(),
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

  void setValueAndReset() {
    showHeart = true;
    notifyListeners();
    Timer(const Duration(seconds: 1), () {
      showHeart = false;
      notifyListeners();
    });
  }
}
