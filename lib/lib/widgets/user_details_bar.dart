
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_details_model.dart';
import '../provider/user_details_provider.dart';
import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';

class UserDetailsBar extends StatefulWidget {
  final double offset;
  const UserDetailsBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  @override
  State<UserDetailsBar> createState() => _UserDetailsBarState();
}

class _UserDetailsBarState extends State<UserDetailsBar> {
  String name = '';
  String address = '';
  @override
  void initState() {
    super.initState();

    // Get the current user ID.
    final userID = FirebaseAuth.instance.currentUser?.uid;

    // Get the current user document from Firestore.
    final userDoc = FirebaseFirestore.instance.collection('users').doc(userID);

    // Get the data from the current user document.
    userDoc.get().then((doc) {
      // Set the name and email state variables.
      setState(() {
        name = doc['fullName'];
        address = doc['phone'];
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    UserDetailsModel userDetails =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Positioned(
      top: -widget.offset / 3,
      child: Container(
        height: kAppBarHeight / 2,
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Text(
                  "Deliver to ${name} - ${address} ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
