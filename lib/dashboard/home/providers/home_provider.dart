import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/utils/functions.dart';

class HomeProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;

  getforuPosts() {
    return _firestore.collection(postCollection).snapshots().map(
          (event) => event.docs.map((e) => PostModel.fromFireStore(e)).toList(),
        );
  }
}
