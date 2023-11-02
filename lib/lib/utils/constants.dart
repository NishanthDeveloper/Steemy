
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../screens/account-screen.dart';
import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/more-screen.dart';
import '../widgets/simple_product_widget.dart';

const double kAppBarHeight = 80;

const String amazonLogoUrl =
    "https://firebasestorage.googleapis.com/v0/b/hapeee-production.appspot.com/o/logo.png?alt=media&token=9f317ba9-50de-4a50-a9e7-b0446d4d696f";

const List<String> categoriesList = [
  "Prime",
  "Mobiles",
  "Fashion",
  "Electronics",
  "Home",
  "Fresh",
  "Appliances",
  "Books, Toys",
  "Essential"
];

const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),
  MoreScreen(),
];

const List<String> categoryLogos = [
  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
];

const List<String> largeAds = [
  "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
];

const List<String> smallAds = [
  "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
  "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
  "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
  "https://m.media-amazon.com/images/I/11kOjZtNhnL._SS70_.png",
];

const List<String> adItemNames = [
  "Amazon Pay",
  "Recharge",
  "Rewards",
  "Pay Bills"
];

//Dont even attemp to scroll to the end of this manually lmao
const String amazonLogo =
    "https://firebasestorage.googleapis.com/v0/b/hapeee-production.appspot.com/o/logo.png?alt=media&token=9f317ba9-50de-4a50-a9e7-b0446d4d696f";

List<Widget> testChildren = [
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "Rick Astley",
        cost: 9999999999999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Rick Seller",
        sellerUid: "983498ihjb",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "Rick Astley",
        cost: 9999999999999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Rick Seller",
        sellerUid: "983498ihjb",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "Rick Astley",
        cost: 9999999999999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Rick Seller",
        sellerUid: "983498ihjb",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "Rick Astley",
        cost: 9999999999999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Rick Seller",
        sellerUid: "983498ihjb",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "Rick Astley",
        cost: 9999999999999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Rick Seller",
        sellerUid: "983498ihjb",
        rating: 1,
        noOfRating: 1),
  )
];

List<String> keysOfRating = [
  "Very bad",
  "Poor",
  "Average",
  "Good",
  "Excellent"
];