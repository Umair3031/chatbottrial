// import 'package:blissver2/auth/auth_page.dart';
// import 'package:blissver2/screens/homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData){
//             return HomePage();
//           }
//           else {
//             return AuthPage();
//           }
//         }
//       ),
//     );
//   }
// }