import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
 Future PopUp (context){
   return
     showDialog(context: context,
         builder:(BuildContext context){
           return Dialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15)
             ),
             child: Container(
               height: MediaQuery.sizeOf(context).height/2,
               width: MediaQuery.sizeOf(context).width/2,
               decoration: BoxDecoration(
                   color: white1,
                   borderRadius: BorderRadius.circular(15)
               ),
               child: Padding(
                 padding: const EdgeInsets.all(20),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ImgPathSvg('popup.svg'),
                     Text('Your password was Successfully changed',style: Heading_Style1,maxLines: 2,textAlign: TextAlign.center,),
                     const Spacer(),
                     CommonContainerButton(context,
                         onPress: () {
                           {
                             Navigator.pop(context);
                           }
                         }, titleName: 'Continue'),
                   ],
                 ),
               ),
             ),
           );
         }
     );
 }



