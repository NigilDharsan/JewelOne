import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Tab_Bar.dart';
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
      body: TabBarWithSearch(),
    );
  }
}
