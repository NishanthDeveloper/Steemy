import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/lib/resources/cloudfirestore-methods.dart';


import 'models/user_details_model.dart';

class FirestoreController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var data = [].obs;
  late UserDetailsModel userDetails;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();

  }
  Future fetchData() async {
    var snapshot = await firestore.collection('products').snapshots();
    snapshot.forEach((doc) {
    //  data.add(doc.data());
    });
  }
}