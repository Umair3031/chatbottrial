import 'package:blissver2/screens/homepage.dart';
import 'package:blissver2/screens/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
  runApp(const MyApp());
}


  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
