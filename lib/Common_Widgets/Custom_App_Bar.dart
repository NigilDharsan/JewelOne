import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';

import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';

class Custom_AppBar extends StatefulWidget implements PreferredSizeWidget {

  bool? isNav;
  bool? isTwoLine;
  String? title1;
  String? title2;
  String? actionLogo;
  bool? isWhite;
  void Function()? ActiononTap;
  Custom_AppBar(
      {Key? key,
      required this.isNav, required this.isTwoLine,
        required this.title1, required this.title2,required this.actionLogo,
      required this.isWhite,required this.ActiononTap})
      : preferredSize = Size.fromHeight(isTwoLine == true?100:kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<Custom_AppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: appGradient,
        ),
      child: AppBar(
        primary: true,
        backgroundColor: widget.isWhite == true?white2:Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 100,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black, // Navigation bar
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark // Status bar
            ),
        leading: widget.isNav == true
            ? Container(
          margin: EdgeInsets.all(12.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: white1
          ),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        )
            : null,
        centerTitle: false,
        title:widget.isTwoLine == true? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             // const SizedBox(height: 10,),
            Text(widget.title1 ?? "",style: ButtonT,),
            Text(widget.title2 ?? "",style: ButtonT2,maxLines: 3,),

          ],
        ):Text(widget.title1 ?? "",style: ButtonT,) ,
        actions: [
          InkWell(
            onTap: widget.ActiononTap,
              child: ImgPathSvg(widget.actionLogo ?? "")),
        ],

      ),
    );
  }
}
