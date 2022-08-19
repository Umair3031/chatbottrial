
import 'package:blissver2/bot/home_bot.dart';
import 'package:blissver2/screens/Drawers/contacts.dart';
import 'package:blissver2/screens/Drawers/dashboard.dart';
import 'package:blissver2/screens/Drawers/my_drawer_header.dart';
import 'package:blissver2/screens/Drawers/notes.dart';
import 'package:blissver2/screens/Drawers/notifications.dart';
import 'package:blissver2/screens/Drawers/privacy_policy.dart';
import 'package:blissver2/screens/Drawers/send_feedback.dart';
import 'package:blissver2/screens/Drawers/settings.dart';
import 'package:blissver2/screens/emoticons_face.dart';
import 'package:blissver2/screens/loginscreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    }  else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),



// to display user information
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'How do you feel today,User?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //badly
                  Column(
                    children: <Widget>[
                      
                      GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const HomeBot())
                        );  
                        Container(decoration: BoxDecoration(color: Colors.blue[600],borderRadius: BorderRadius.circular(12),),
                        );
                      },
                      
                      child: EmoticonFace(emoticonface: '😩'),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Bad',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),

                  //fine
                  Column(
                    children: <Widget>[
                      GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const HomeBot())
                        );  
                      },
                      child: EmoticonFace(emoticonface: '🙂'),
                      ),
                      
                      const SizedBox(height: 8),

                      const Text(
                        'Fine',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),

                  //well
                  Column(
                    children: <Widget>[
                      GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const HomeBot())
                        );  
                      },
                      child: EmoticonFace(emoticonface: '😄'),
                      ),
        
                    const SizedBox(height: 8),

                    const Text('Well',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  //excellent
                  Column(
                    children: <Widget>[
                      GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const HomeBot())
                        );  
                      },
                      child: EmoticonFace(emoticonface: '🤩'),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Excellent',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          // const Text(
          //   'Signed in as',
          //   style: TextStyle(fontSize: 16),
          // ),
          
          // const SizedBox(height: 8),

          // Text(
          //   user.email!,
          //   style: const TextStyle(fontSize: 20),
          // ),

          // const SizedBox(height: 40),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: MaterialButton(
          //     minWidth: double.infinity,
          //       onPressed: () => FirebaseAuth.instance.signOut(),
          //       child: const Text('Sign Out'),
          //       color: Colors.teal,
          //       textColor: Colors.white,
          //   ),
          // ),
        ],),
      ),

      // btoom bar

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        // color: Colors.blue,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          if (index==1){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => HomePage()));
          }
          else if (index == 2){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => DashboardPage()));
          }
          else if (index == 3){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => SettingsPage()));
          }

        },
        items: [
        Icon(Icons.home),
        Icon(Icons.calendar_month),
        Icon(Icons.settings),
      ]),

      // Drawer

      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),

      

      
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Happiness Report", Icons.report,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Tack your activity", Icons.calendar_month,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          menuItem(9, "Sign out", Icons.exit_to_app_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => const LoginPage())
                  );  
                },
              ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}