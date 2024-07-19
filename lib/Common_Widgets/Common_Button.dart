import 'package:flutter/material.dart';
import 'package:jewelone/utilits/Text_Style.dart';

import '../utilits/Common_Colors.dart';
import 'Image_Path.dart';

// ELEVATED BUTTON
Widget CommonElevatedButton(
  BuildContext context,
  String titleName,
  void Function()? onPress,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: brown1,
      minimumSize: Size(double.infinity, 50),
      elevation: 9,
      shape: RoundedRectangleBorder(
        
          borderRadius: BorderRadius.circular(25)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT,
    ),
  );
}

Widget CommonContainerButton(context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Container(
        height: 50,
      width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          gradient1,
          gradient2,
        ]
    ),
    ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(titleName,style: ButtonT,)),
        ],
      )

    ),
  );
}
Widget CommonContainerButton2(context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Container(
      width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          gradient1,
          gradient2,
        ]
    ),
    ),
      child:
      Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Center(child: Text(titleName,style: ButtonT2,)),
      )

    ),
  );
}

Widget buttonIcon(context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                gradient1,
                gradient2,
              ]
          ),
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ImgPathSvg('logout.svg')
            ),
            Center(child: Text(titleName,style: ButtonT,)),
          ],
        )

    ),
  );
}

Widget Paynowcommonbutton1 (context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width/4.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                gradient1,
                gradient2,
              ]
          ),
        ),
        child: Center(child: Text(titleName,style: ButtonT2,)),
      ),
    ),
  );
}

Widget Paynowcommonbutton2 (context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width/3,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: gradient2),
          borderRadius: BorderRadius.circular(25),
          color: white1,
        ),
        child: Center(child: Text(titleName,style: ButtonT3,)),
      ),
    ),
  );
}

Widget bottombutton (context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Container(
      height: 40,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              gradient1,
              gradient2,
            ]
        ),
      ),
      child: Center(child: Text(titleName,style: ButtonT,)),
    ),
  );
}

Widget upload (context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Container(
      height: 45,
      width: MediaQuery.sizeOf(context).width/3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              gradient1,
              gradient2,
            ]
        ),
      ),
      child: Center(child: Text(titleName,style: ButtonT,)),
    ),
  );
}

Widget cancel (context,{ required void Function()? onPress,required String titleName}){
  return InkWell(
    onTap: onPress,
    child: Container(
      height: 45,
      width: MediaQuery.sizeOf(context).width/2.7,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: grey5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: Text(titleName,style: lighttext,)),
    ),
  );
}