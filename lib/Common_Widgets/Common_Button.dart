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
      child: Center(child: Text(titleName,style: ButtonT,)),
    ),
  );
}