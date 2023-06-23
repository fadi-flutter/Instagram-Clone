import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/dashboard/search/models/search_model.dart';
import 'package:instagram_clone/utils/functions.dart';

class SearchPovider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<List<SearchModel>> getUsersStream() {
    return _firestore
        .collection(userCollection)
        .where('id', isNotEqualTo: _auth.currentUser!.uid)
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => SearchModel.fromFireStore(e)).toList(),
        );
  }
}
