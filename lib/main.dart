import 'package:blissver2/screens/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCES3GOoJWzocfYgWNJZ2sxZXMn1ynsB2Y", 
      appId: "1:928890966003:android:330643ad0fcb581bf44c86",   
      messagingSenderId: "928890966003", 
      projectId: "blissver2",
    ), 
  );

  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(const MyApp(showHome: true));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}


  class MyApp extends StatelessWidget {
    final bool showHome;

    const MyApp({Key? key,required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
