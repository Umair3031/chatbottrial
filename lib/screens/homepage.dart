
import 'package:blissver2/bot/home_bot.dart';
import 'package:blissver2/screens/Drawers/report.dart';
import 'package:blissver2/screens/profile_screen/profile_screen.dart';
import 'package:blissver2/screens/Drawers/gethelp.dart';
import 'package:blissver2/screens/emoticons_face.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  final user = FirebaseAuth.instance.currentUser!;

  // document Ids
  List<String> docIDs = [];

  //get docIds
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    // var container;
    // if (currentPage == DrawerSections.dashboard) {
    //   container = Report();
    // }  else if (currentPage == DrawerSections.notes) {
    //   container = NotesPage();
    // } else if (currentPage == DrawerSections.settings) {
    //   container = SettingsPage();
    // } else if (currentPage == DrawerSections.notifications) {
    //   container = GetHelp();
    // } else if (currentPage == DrawerSections.privacy_policy) {
    //   container = PrivacyPolicyPage();
    // } else if (currentPage == DrawerSections.send_feedback) {
    //   container = SendFeedbackPage();
    // }

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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [

                  Text(
                    'How do you feel today,User?',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Icon(
                    Icons.people,
                    color: Colors.teal,
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
                        dynamic conversationObject = {
                              'appId': '3b06c9af61b62bc935e641edea085fdb2',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                              'isSingleConversation' : false
                            };

                            KommunicateFlutterPlugin.buildConversation(conversationObject).then((clientConversationId) {
                              print("Conversation builder success : " + clientConversationId.toString());
                            }).catchError((error) {
                              print("Conversation builder error : " + error.toString());
                            });
                      },
                      
                      child: EmoticonFace(emoticonface: '😩'),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Bad',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),

                  //fine
                  Column(
                    children: <Widget>[
                      GestureDetector(
                      onTap: (){
                            dynamic conversationObject = {
                              'appId': '3b06c9af61b62bc935e641edea085fdb2',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                              'isSingleConversation' : false
                            };

                            KommunicateFlutterPlugin.buildConversation(conversationObject).then((clientConversationId) {
                              print("Conversation builder success : " + clientConversationId.toString());
                            }).catchError((error) {
                              print("Conversation builder error : " + error.toString());
                            });
                      },
                      child: EmoticonFace(emoticonface: '🙂'),
                      ),
                      
                      const SizedBox(height: 8),

                      const Text(
                        'Fine',
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black
                        ),
                      )
                    ],
                  ),

                  //well
                  Column(
                    children: <Widget>[
                      GestureDetector(
                      onTap: (){
                        dynamic conversationObject = {
                              'appId': '3b06c9af61b62bc935e641edea085fdb2',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                              'isSingleConversation' : false
                            };

                            KommunicateFlutterPlugin.buildConversation(conversationObject).then((clientConversationId) {
                              print("Conversation builder success : " + clientConversationId.toString());
                            }).catchError((error) {
                              print("Conversation builder error : " + error.toString());
                            });
                      },
                      child: EmoticonFace(emoticonface: '😄'),
                      ),
        
                    const SizedBox(height: 8),

                    const Text('Well',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  //excellent
                  Column(
                    children: <Widget>[
                      GestureDetector(
                      onTap: () async {
                        dynamic conversationObject = {
                              'appId': '3b06c9af61b62bc935e641edea085fdb2',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                              'isSingleConversation' : false
                            };

                            KommunicateFlutterPlugin.buildConversation(conversationObject).then((clientConversationId) {
                              print("Conversation builder success : " + clientConversationId.toString());
                            }).catchError((error) {
                              print("Conversation builder error : " + error.toString());
                            }); 
                      },
                      child: EmoticonFace(emoticonface: '🤩'),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Excellent',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),

          // Text('Signed in as',),
          // SizedBox(height: 8,),
          
          // const Text(
          //   'Signed in as',
          //   style: TextStyle(fontSize: 16),
          // ),
          
          // const SizedBox(height: 8),

          // Text(
          //   user.uid,
          //   style: const TextStyle(fontSize: 20),
          // ),
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

      // bottom navigation bar

      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.teal,
        backgroundColor: Colors.white,
        // color: Colors.teal,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          if (index==0){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => HomePage()));
          }
          else if (index == 1){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => Report()));
          }
          else if (index == 2){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => GetHelp()));
          }
          else if (index == 3){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => ProfileScreen()));
          }

        },
        items: const [
        Icon(Icons.home),
        Icon(Icons.sos),
        Icon(Icons.trending_up_rounded),
        Icon(Icons.person),
      ]),      
    );
  }

  // Widget MyDrawerList() {
  //   return Container(
  //     padding: const EdgeInsets.only(
  //       top: 15,
  //     ),
  //     child: Column(
  //       // shows the list of menu drawer
  //       children: [
  //         menuItem(1, "Dashboard", Icons.dashboard_outlined,
  //             currentPage == DrawerSections.dashboard ? true : false),
  //         menuItem(2, "Happiness Report", Icons.report,
  //             currentPage == DrawerSections.contacts ? true : false),
  //         menuItem(3, "Tack your activity", Icons.calendar_month,
  //             currentPage == DrawerSections.events ? true : false),
  //         menuItem(4, "Notes", Icons.notes,
  //             currentPage == DrawerSections.notes ? true : false),
  //         const Divider(),
  //         menuItem(5, "Settings", Icons.settings_outlined,
  //             currentPage == DrawerSections.settings ? true : false),
  //         menuItem(6, "Notifications", Icons.notifications_outlined,
  //             currentPage == DrawerSections.notifications ? true : false),
  //         const Divider(),
  //         menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
  //             currentPage == DrawerSections.privacy_policy ? true : false),
  //         menuItem(8, "Send feedback", Icons.feedback_outlined,
  //             currentPage == DrawerSections.send_feedback ? true : false),
  //         menuItem(9, "Sign out", Icons.exit_to_app_outlined,
  //             currentPage == DrawerSections.send_feedback ? true : false),
  //             GestureDetector(
  //               onTap: (){
  //                 Navigator.push(
  //                   context,MaterialPageRoute(builder: (context) => const LoginPage())
  //                 );  
  //               },
  //             ),
  //       ],
  //     ),
  //   );
  // }

  // Widget menuItem(int id, String title, IconData icon, bool selected) {
  //   return Material(
  //     color: selected ? Colors.grey[300] : Colors.transparent,
  //     child: InkWell(
  //       onTap: () {
  //         Navigator.pop(context);
  //         setState(() {
  //           if (id == 1) {
  //             currentPage = DrawerSections.dashboard;
  //           } else if (id == 2) {
  //             currentPage = DrawerSections.contacts;
  //           } else if (id == 3) {
  //             currentPage = DrawerSections.events;
  //           } else if (id == 4) {
  //             currentPage = DrawerSections.notes;
  //           } else if (id == 5) {
  //             currentPage = DrawerSections.settings;
  //           } else if (id == 6) {
  //             currentPage = DrawerSections.notifications;
  //           } else if (id == 7) {
  //             currentPage = DrawerSections.privacy_policy;
  //           } else if (id == 8) {
  //             currentPage = DrawerSections.send_feedback;
  //           }
  //         });
  //       },
  //       child: Padding(
  //         padding: const EdgeInsets.all(15.0),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: Icon(
  //                 icon,
  //                 size: 20,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             Expanded(
  //               flex: 3,
  //               child: Text(
  //                 title,
  //                 style: const TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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