import 'package:flutter/material.dart';
import 'package:jewelone/utilits/Common_Colors.dart';

import 'Image_Path.dart';

class Bottom_Navigation extends StatefulWidget {
  int select;
  Bottom_Navigation({Key? key, required this.select}) : super(key: key);

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  final pages = [];

  void b(index) {
    setState(() {
      widget.select = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: pages[widget.select],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white1,
        selectedItemColor: blue3,
        selectedLabelStyle: TextStyle(color: blue1),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _IconImg("Home.svg"),
            activeIcon: _IconImg("Homeactive.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
              activeIcon: _IconImg("Ticketactive.svg"),
              icon: _IconImg("Ticket.svg"),
              label: "My Bookings"),
          BottomNavigationBarItem(
              activeIcon: _IconImg("inboxactive.svg"),
              icon: _IconImg("inbox.svg"),
              label: "Inbox"),
          BottomNavigationBarItem(
              activeIcon: _IconImg("Profileactive.svg"),
              icon: _IconImg("Profile.svg"),
              label: "Profile"),
          // BottomNavigationBarItem(
          //     activeIcon: _IconImg("package2.svg"),
          //     icon: _IconImg("package1.svg"),
          //     label: "Products"),
        ],
        currentIndex: widget.select,
        onTap: b,
      ),
    );
  }

  Widget _IconImg(String Img) {
    return Container(height: 20, width: 20, child: ImgPathSvg(Img));
  }
}
