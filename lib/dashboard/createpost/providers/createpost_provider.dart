import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CreatePostProvider with ChangeNotifier {
  VideoPlayerController? videoC;

  //auth
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  //controller
  final descriptionC = TextEditingController();
  XFile profileImage = XFile('');
  String city = '';
  String country = '';
  bool selectedImage = true;
  bool playVideo = false;

  uploadPost(BuildContext context) async {
    if (profileImage.path.isEmpty) {
      showToast(context, 'Select image first');
      return;
    }
    if (descriptionC.text.isEmpty) {
      showToast(context, 'Description Required');
      return;
    }
    try {
      EasyLoading.show();
      final profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);
       getLocationData(context);
      String url = '';
      url = await uploadImage();
      await _firestore
          .collection(userCollection)
          .doc(_auth.currentUser!.uid)
          .update({
        'posts': profileProvider.posts + 1,
      });
      _firestore.collection(postCollection).add(
        {
          'time_stamp': DateTime.now(),
          'image': url,
          'likes': [],
          'isImage': selectedImage,
          'description': descriptionC.text,
          'id': _auth.currentUser!.uid,
          'userName': profileProvider.userName,
          'userImage': profileProvider.image,
          'city': city,
          'country': country.substring(0, 3),
        },
      ).then((value) async {
        showToast(context, 'Uploaded');
        descriptionC.clear();
        profileImage = XFile('');
        notifyListeners();
        EasyLoading.dismiss();
      });
    } on Exception {
      EasyLoading.dismiss();
      showToast(context, 'Check your internet connection or try again');
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

  pickSource(bool isImage) async {
    final img = isImage
        ? await ImagePicker().pickImage(source: ImageSource.gallery)
        : await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (img != null) {
      profileImage = XFile(img.path);
      selectedImage = isImage;

      if (!selectedImage) {
        initializeVideo(profileImage.path);
      }
      notifyListeners();
    }
    return null;
  }

  initializeVideo(String source) {
    videoC = VideoPlayerController.file(File(source))
      ..initialize().then((_) {});
  }

  playpauseVideo() {
    if (playVideo) {
      playVideo = false;
      videoC?.pause();
    } else {
      playVideo = true;
      videoC?.play();
    }
    notifyListeners();
  }

  Future<void> getLocationData(BuildContext context) async {
    try {
      // Request permission to access the device's location
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Handle permission denied case
      }

      // Get the current position (latitude and longitude)
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Use the Geocoder package to get the city and country names
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Extract the city and country names from the placemark
      city = placemarks.first.locality!;
      country = placemarks.first.country!;
    } catch (e) {
      // Handle any errors that occur during the process
      showToast(context, 'Error while getting Location $e');
    }
  }
}
