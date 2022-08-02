import 'package:api_cache_manager/utils/cache_manager.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartgarbage/screens/forget_pass.dart';
import 'package:smartgarbage/screens/home.dart';
import 'package:smartgarbage/screens/register.dart';
import 'package:smartgarbage/screens/login.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        MainPage.id: (context) => MainPage(),
        ForgetPassword.id: (context) => ForgetPassword(),
      },
    ),
  );
}

class SplashScreen extends StatelessWidget {
  checksignin() async {
    var isLogin = await APICacheManager().isAPICacheKeyExist("login_token");
    if (isLogin) {
      return true;
    }
    return false;

    // var cacheModel = await APICacheManager().getCacheData("login_token");
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() async {
      // var delCacheModel = await APICacheManager().deleteCache("login_token");
    }

    return SplashScreenView(
      navigateRoute: Login(),
      // navigateRoute: checksignin() ? MainPage() : Login(),
      // navigateRoute: HomePage(),
      duration: 3000,
      imageSize: 100,
      imageSrc: 'assets/images/Logo.png',
      text: "SMART GARBAGE",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(fontSize: 40.0),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.grey[300],
    );
  }
}
