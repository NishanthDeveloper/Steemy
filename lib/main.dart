import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:meal_monkey/firebase_options.dart';
import 'package:meal_monkey/lib/layout/screen_layout.dart';
import 'package:meal_monkey/screens/home_screen.dart';
import 'package:meal_monkey/screens/login_page.dart';
import 'package:meal_monkey/widgets/nav_bar.dart';
import 'package:provider/provider.dart';
import 'helper/helper_function.dart';
import 'lib/provider/user_details_provider.dart';
import 'lib/screens/signin_screen.dart';
import 'lib/utils/color_themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  /*void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }
  getUserLoggedInStatus() async{
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if(value != null){
        setState(() {
          _isSignedIn = value;
        });

      }
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AmazonClone(),
      //_isSignedIn ? HomeScreen() : LoginPage(),
    );
  }
}
class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetailsProvider())],
      child: MaterialApp(
        title: "Hapeee",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              } else if (user.hasData) {
                return const  NavBarRoots();
                //return const SellScreen();
              } else {
                return const SignInScreen();
              }
            }),
      ),
    );
  }
}