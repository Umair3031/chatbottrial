import 'package:blissver2/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/account-user-avatar-svgrepo-com.svg",
            press: () => {},
          ),
          
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/alarm_alert_attention_bell_clock_notification_ring_icon_123203.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/settings-svgrepo-com.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/help-svgrepo-com.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/actions-log-out-svgrepo-com.svg",
            press: () {
              Navigator.push(
              context,MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}