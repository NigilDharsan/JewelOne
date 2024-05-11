import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';

import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';

class Custom_AppBar extends StatefulWidget implements PreferredSizeWidget {

  bool? isNav;
  List<Widget>? actions;
  Custom_AppBar(
      {Key? key,
      required this.actions,
      required this.isNav})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<Custom_AppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      backgroundColor: backGroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black, // Navigation bar
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark // Status bar
          ),
      leading: widget.isNav == true
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: ImgPathSvg('back.svg'),
      )
          : null,
      centerTitle: true,
      actions: widget.actions,

    );
  }
}
