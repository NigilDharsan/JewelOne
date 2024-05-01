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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT,
    ),
  );
}

//CALL NOW BOTTON
Widget callNow_Button(BuildContext context, String titleName,
    {required void Function()? onPress, required Color? backgroundColor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: Size(double.infinity, 30),
      // elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT1,
    ),
  );
}

//CHAT BUTTON
Widget Chat_Button(
  BuildContext context,
  void Function()? onPress,
) {
  return InkWell(
    onTap: onPress,
    child: Container(
        height: 35,
        width: 35,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: blue3),
        child: Center(child: ImgPathSvg('Send.svg'))),
  );
}

//RADIO BUTTON
Widget RadioButton(
    {required int? groupValue1,
    required int? groupValue2,
    required void Function(int?)? onChanged1,
    required void Function(int?)? onChanged2,
    required String radioTxt1,
    required String radioTxt2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white1),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 50),
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: groupValue1,
                activeColor: orange1,
                onChanged: onChanged1,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              RadioText(radioTxt1),
            ],
          ),
        ),
      ),
      const SizedBox(
        width: 40,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white1),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 50),
          child: Row(
            children: [
              Radio(
                value: 1,
                groupValue: groupValue2,
                activeColor: orange1,
                onChanged: onChanged2,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              RadioText(radioTxt2),
            ],
          ),
        ),
      )
    ],
  );
}

// CHECK BOX
Widget CheckBoxes(
    {required bool? value,
    required void Function(bool?)? onChanged,
    required String checkBoxText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Checkbox(
        value: value,
        activeColor: orange1,
        onChanged: onChanged,
        checkColor: orange2,
        hoverColor: orange2,
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      RadioText(checkBoxText),
    ],
  );
}


// Widget Floating_Button(context,{required Function() onTap,required String floatT}) {
//   return SpeedDial(
//     curve: Curves.bounceInOut,
//     //  animatedIcon: AnimatedIcons.event_add,
//     icon: Icons.add,
//     iconTheme: IconThemeData(color: Colors.white),
//     // animatedIconTheme: IconThemeData(color: Colors.white),
//     backgroundColor: brown1,
//     shape: CircleBorder(),
//     onPress: onTap,
//   );
// }