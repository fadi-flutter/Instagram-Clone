import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String city, country, description, id, image, userName, userImage, docID;
  List likes;

  PostModel(
      {required this.city,
      required this.country,
      required this.description,
      required this.id,
      required this.image,
      required this.likes,
      required this.userImage,
      required this.userName,
      required this.docID});

  factory PostModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return PostModel(
      city: data['city'],
      country: data['country'],
      description: data['description'],
      id: data['id'],
      image: data['image'],
      likes: List.from(data['likes']),
      userImage: data['userImage'],
      userName: data['userName'],
      docID: doc.id,
    );
  }
}
