import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Tab_Bar.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
class Notification_Screen extends StatefulWidget {
  const Notification_Screen({super.key});

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Notifications', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: TabBarWithSearch(),
    );
  }
}
