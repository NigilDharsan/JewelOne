import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class ID_Proof_Screen extends StatefulWidget {
  const ID_Proof_Screen({super.key});

  @override
  State<ID_Proof_Screen> createState() => _ID_Proof_ScreenState();
}

class _ID_Proof_ScreenState extends State<ID_Proof_Screen> {

   bool _Custom_icon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Complete your KYC', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 30),
        child: SingleChildScrollView(
          child: Container(
           width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('KYC Verification',style: Heading_Style1,),
                    const Spacer(),
                    Text('Step 2 of 2',style: Heading_Style1,),
                  ],
                ),
                Stack(
                  children: [
                    Divider(),
                    Positioned(
                      top: 5,
                      right: 0,
                      child: Container(
                        height: 5,width: MediaQuery.sizeOf(context).width/2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                gradient1,
                                gradient2,
                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('ID Proof',style: Heading_Style1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text('Select a documents type below to confirm your identity',style: lighttext,),
                ),
                //AADHAR CARD
                Upload_Container(heading: 'Aadhar Card', onPress: () {  }),

                //PAN CARD
                Upload_Container(heading: 'Pan Card', onPress: () {  }),

                //DRIVING LICENCE
                Upload_Container(heading: 'Driving License', onPress: () {  }),

                const SizedBox(height: 50,),

                //BUTTON
                CommonContainerButton(context,
                    onPress: () {
                      {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                      }
                    }, titleName: 'Submit'),
              ],
            ),
          ),
        ),
      ),
    );
  }


   Widget Upload_Container ({required String heading,required void Function()? onPress}){
     return Padding(
       padding: const EdgeInsets.only(top: 10),
       child: Container(
         decoration: BoxDecoration(
           color: white1,
           borderRadius: BorderRadius.circular(10),
         ),
         child:
         Theme(
           data: ThemeData(dividerColor:Colors.transparent),
           child: ExpansionTile(
             backgroundColor: Colors.transparent,
             onExpansionChanged:(bool expanded){
               setState(() {
                 _Custom_icon = expanded;
               });
             },
             title: Text(heading,style: skip_ST,),
             tilePadding: EdgeInsets.only(left: 30,right: 20),
             trailing:  _Custom_icon == true ? Icon(Icons.keyboard_arrow_down,color: gradient3,size: 30,) : Icon(Icons.arrow_forward_ios,color: gradient3,),
             children: [
               Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: white1,
                     // border: Border.all(width: 1)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30,top: 10),
                     child: Container(
                       height: MediaQuery.sizeOf(context).height/5,
                       child: Column(
                         children: [
                           Divider(),
                           Container(
                             width: MediaQuery.sizeOf(context).width,
                             child: Row(
                               children: [
                                 ImgPathSvg('i.svg'),
                                 const SizedBox(width: 10,),
                                 Container(
                                   width: MediaQuery.sizeOf(context).width/1.5,
                                     child: Text('JPG, PNG, PDF and SVG files up to 5MB',style: skip_ST,maxLines: 2,)),
                               ],
                             ),
                           ),
                           const Spacer(),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               upload(context,onPress: () {

                               }, titleName: 'Upload'),
                               cancel(context,onPress: () {

                               }, titleName: 'Cancel'),
                             ],
                           )
                         ],
                       ),
                     ),
                   )
               ),
             ],
           ),
         ),
       ),
     );
   }
}

