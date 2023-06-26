// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/dashboard/dashboard.dart';
import 'package:instagram_clone/dashboard/profile/models/post_model.dart';
import 'package:instagram_clone/utils/functions.dart';

class ProfileProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> docForum =
      FirebaseFirestore.instance.collection(postCollection);
  //profile
  String name = '';
  String userName = '';
  String image = '';
  int posts = 0;
  String id = '';
  String bio = '';
  List followers = [];
  List followings = [];
  XFile profileImage = XFile('');
  final nameC = TextEditingController();
  final userNameC = TextEditingController();
  final bioC = TextEditingController();

  getProfile(String userID) async {
    EasyLoading.show();
    DocumentSnapshot<Map<String, dynamic>> data =
        await _firestore.collection(userCollection).doc(userID).get();
    name = data['name'];
    userName = data['userName'];
    image = data['image'];
    posts = data['posts'];
    id = data['id'];
    bio = data['bio'];
    followers = List.from(data['followers']);
    followings = List.from(data['following']);
    EasyLoading.dismiss();
    notifyListeners();
  }

  getPostsStream(String userID) {
    return _firestore
        .collection(postCollection)
        .where('id', isEqualTo: userID)
        .snapshots()
        .map(
          (event) => event.docs.map((e) => PostModel.fromFireStore(e)).toList(),
        );
  }

  uploadProfile(BuildContext context) async {
    if (nameC.text.isEmpty || userNameC.text.isEmpty) {
      showToast(context, 'Full name and User name are required');
      return;
    }

    if (profileImage.path.isEmpty) {
      showToast(context, 'Select image first');
      return;
    }
    try {
      EasyLoading.show();
      String url = '';
      url = await uploadImage();
      _firestore.collection(userCollection).doc(_auth.currentUser!.uid).set(
        {
          'id': _auth.currentUser!.uid,
          'name': nameC.text.toString(),
          'userName': userNameC.text.toLowerCase().toString(),
          'bio': bioC.text.toString(),
          'image': url,
          'posts': 0,
          'followers': [],
          'following': []
        },
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, 'Check your internet connection or try again later');
    }
  }

  uploadImage() async {
    UploadTask? uploadTask;
    final storage = FirebaseStorage.instance.ref();
    final path = 'images/${profileImage.path}';
    final file = File(profileImage.path);
    final ref = storage.child(path);
    uploadTask = ref.putFile(file);
    final snapshot =
        await uploadTask.whenComplete(() => print('Image Uploaded'));
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  pickProfileImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      profileImage = XFile(img.path);
      notifyListeners();
      return File(img.path);
    }
    return null;
  }

  handleFollowUser(String friendID, BuildContext context) async {
    try {
      final userUid = _auth.currentUser!.uid;
      EasyLoading.show();
      if (followers.contains(userUid)) {
        await _firestore.collection(userCollection).doc(friendID).update({
          'followers': FieldValue.arrayRemove([_auth.currentUser!.uid])
        });
        await _firestore
            .collection(userCollection)
            .doc(_auth.currentUser!.uid)
            .update({
          'following': FieldValue.arrayRemove([friendID])
        });
      } else {
        await _firestore.collection(userCollection).doc(friendID).update({
          'followers': FieldValue.arrayUnion([_auth.currentUser!.uid])
        });
        await _firestore
            .collection(userCollection)
            .doc(_auth.currentUser!.uid)
            .update({
          'following': FieldValue.arrayUnion([friendID])
        });
      }
      getProfile(friendID);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showToast(context, 'Check your internet connection or try again later');
    }
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
