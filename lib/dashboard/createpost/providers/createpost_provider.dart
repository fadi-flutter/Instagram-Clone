import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:instagram_clone/dashboard/profile/providers/profile_provider.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:provider/provider.dart';

class CreatePostProvider with ChangeNotifier {
  //auth
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  //controller
  final descriptionC = TextEditingController();
  String city = '';
  String country = '';

  uploadPost(BuildContext context) async {
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    await getLocationData(context);
    _firestore.collection(postCollection).add({
      'time_stamp': DateTime.now(),
      'image': '',
      'likes': [],
      'description': '',
      'id': _auth.currentUser!.uid,
      'userName': profileProvider.userName,
      'userImage': profileProvider.image,
      'city': city,
      'country': country.substring(0, 3),
    });
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
