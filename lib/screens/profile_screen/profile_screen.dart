import 'package:blissver2/screens/Drawers/gethelp.dart';
import 'package:blissver2/screens/Drawers/report.dart';
import 'package:blissver2/screens/homepage.dart';
import 'package:blissver2/screens/profile_screen/body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Body(),
      // bottomNavigationBar: CurvedNavigationBar(color: Colors.teal,
      //   backgroundColor: Colors.white,
      //   // color: Colors.teal,
      //   animationDuration: Duration(milliseconds: 400),
      //   onTap: (index) {
      //     if (index==0){
      //       Navigator.push(
      //         context,MaterialPageRoute(builder: (context) => HomePage()));
      //     }
      //     else if (index == 1){
      //       Navigator.push(
      //         context,MaterialPageRoute(builder: (context) => Report()));
      //     }
      //     else if (index == 2){
      //       Navigator.push(
      //         context,MaterialPageRoute(builder: (context) => GetHelp()));
      //     }
      //     else if (index == 3){
      //       Navigator.push(
      //         context,MaterialPageRoute(builder: (context) => ProfileScreen()));
      //     }
      //   },
      //   items: const [
      //   Icon(Icons.home),
      //   Icon(Icons.sos),
      //   Icon(Icons.trending_up_rounded),
      //   Icon(Icons.person),
      //   ]
      // ),
    );
  }
}