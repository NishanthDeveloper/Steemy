import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../provider/user_details_provider.dart';
import '../resources/cloudfirestore-methods.dart';
import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/user_details_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
    return Scaffold(
      appBar: SearchBarWidget(
        hasBackButton: false,
        isReadOnly: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("cart")
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CustomMainButton(
                              child: const Text(
                                "Loading",
                              ),
                              color: yellowColor,
                              isLoading: true,
                              onPressed: () {});
                        } else {
                          return CustomMainButton(
                              child: Text(
                                "Proceed to buy (${snapshot.data!.docs.length}) items",
                                style: const TextStyle(color: Colors.black),
                              ),
                              color: yellowColor,
                              isLoading: false,
                              onPressed: () async {
                                await CloudFirestoreClass().buyAllItemsInCart(
                                    userDetails:
                                    Provider.of<UserDetailsProvider>(
                                        context,
                                        listen: false)
                                        .userDetails);
                                Utils().showSnackBar(
                                    context: context, content: "Done");
                              });
                        }
                      },
                    )),
                Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("cart")
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Container();
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                ProductModel model = ProductModel.getModelFromJson(
                                    json: snapshot.data!.docs[index].data());
                                return CartItemWidget(product: model);
                              });
                        }
                      },
                    ))
              ],
            ),
            UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}