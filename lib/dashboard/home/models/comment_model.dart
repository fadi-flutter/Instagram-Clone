import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String comment, userName, userimage, userId;

  CommentModel(
      {required this.comment,
      required this.userId,
      required this.userName,
      required this.userimage});

  factory CommentModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return CommentModel(
      comment: data['comment'],
      userId: data['userID'],
      userName: data['userName'],
      userimage: data['userImage'],
    );
  }
}
