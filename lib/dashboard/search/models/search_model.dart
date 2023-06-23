import 'package:cloud_firestore/cloud_firestore.dart';

class SearchModel {
  String userName, name, image, id;

  SearchModel(
      {required this.image,
      required this.name,
      required this.userName,
      required this.id});

  factory SearchModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return SearchModel(
      id: data['id'],
      image: data['image'],
      name: data['name'],
      userName: data['userName'],
    );
  }
}
