import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Card.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class New_SSP_Plan2_Screen extends StatefulWidget {
  const New_SSP_Plan2_Screen({super.key});

  @override
  State<New_SSP_Plan2_Screen> createState() => _New_SSP_Plan2_ScreenState();
}

class _New_SSP_Plan2_ScreenState extends State<New_SSP_Plan2_Screen> {
  TextEditingController _amount = TextEditingController();
  TextEditingController _MobileNumber = TextEditingController();
  TextEditingController _message = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar:Custom_AppBar(
        isNav: true,
        isTwoLine: true,
        title1: "Plan 2",
        title2: 'One -Time Lump-Sum Advance Plan (Tenure: 330 Days)',
        actionLogo: 'info.svg', isWhite: false, ActiononTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
      },),
      bottomNavigationBar: Container(
        height: 150,
        width: MediaQuery.sizeOf(context).width,
        color: white1,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: pink3,
              border: Border.all(width: 1,color: gradient3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width/3,
                            child: Text('One - Time Lump-Sum Advance Plan',style: rate2,maxLines: 2,)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('EMA from ₹5,000 /month',style: lighttext,),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                 // BOTTOM BAR CONTENTS
                  Column(
                    children: [
                      Paynowcommonbutton1 (context,
                          onPress: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Grammage_Plan_Screen()));
                        //BOTTOM SHEET
                        //     showModalBottomSheet(context: (context), builder: (context)=>
                        //         Container(
                        //           height:MediaQuery.sizeOf(context).height/1,
                        //           width: MediaQuery.sizeOf(context).width,
                        //           decoration: BoxDecoration(
                        //             color: white1,
                        //             borderRadius: BorderRadius.only(
                        //               topRight: Radius.circular(10),
                        //               topLeft: Radius.circular(10)
                        //             )
                        //           ),
                        //           child: SingleChildScrollView(
                        //             child: Column(
                        //               crossAxisAlignment: CrossAxisAlignment.start,
                        //               children: [
                        //                 Container(
                        //                   width: MediaQuery.sizeOf(context).width,
                        //                   decoration: BoxDecoration(
                        //                     color: pink6,
                        //                   borderRadius: BorderRadius.only(
                        //                   topRight: Radius.circular(10),
                        //                   topLeft: Radius.circular(10)
                        //                   )
                        //                   ),
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.only(top: 10,bottom: 10),
                        //                     child: Column(
                        //                       children: [
                        //                         Text('Plan 2',style: sspplan,),
                        //                         Container(
                        //                           width: MediaQuery.sizeOf(context).width/1.2,
                        //                             child: Text('One -Time Lump-Sum Advance Plan (Tenure: 330 Days)',style: texts2,maxLines: 2,textAlign: TextAlign.center,))
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
                        //                   child: Column(
                        //                     children: [
                        //                       //INTRESTED AMOUNT
                        //                       Title_Style(Title: 'Interested Amount', isStatus: null),
                        //                       droptextFormField(
                        //                         hintText: 'example Rs.1,30,000',
                        //                         keyboardtype: TextInputType.number,
                        //                         inputFormatters: [
                        //                           LengthLimitingTextInputFormatter(10),
                        //                         ],
                        //                         Controller: _amount,
                        //                         validating: (value) {
                        //                           if (value == null || value.isEmpty) {
                        //                             return "Please Enter Amount";
                        //                           }
                        //                           else if (value == null) {
                        //                             return "Please Enter valid Amout";
                        //                           }
                        //                           return null;
                        //                         },
                        //                         onChanged: null,
                        //                       ),
                        //
                        //                       //CONTACT DETAILS
                        //                       Title_Style(Title: 'Contact Details', isStatus: null),
                        //                       droptextFormField(hintText: 'Enter Mobile*',
                        //                           keyboardtype: TextInputType.phone,
                        //                           Controller: _MobileNumber,
                        //                           inputFormatters: [
                        //                             LengthLimitingTextInputFormatter(10),
                        //                             FilteringTextInputFormatter.digitsOnly],
                        //                           onChanged: null,
                        //                           validating:(value){
                        //                             if (value!.isEmpty) {
                        //                               return 'Please enter a mobile number';
                        //                             } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        //                               return 'Please enter a valid 10-digit mobile number';
                        //                             }
                        //                             return null;
                        //                           }
                        //                       ),
                        //
                        //
                        //                       //EMAIL
                        //                       Padding(
                        //                         padding: const EdgeInsets.only(top: 10),
                        //                         child: droptextFormField(hintText: 'Enter Email*',
                        //                             keyboardtype: TextInputType.phone,
                        //                             Controller: _email,
                        //                             inputFormatters: [
                        //                               FilteringTextInputFormatter.digitsOnly],
                        //                             onChanged: null,
                        //                           validating: (value){
                        //                             if(value==null||value.isEmpty){
                        //                               return "Enter Email";
                        //                             }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                        //                               return "Please Enter valid Email ";
                        //                             }else{
                        //                               return null;
                        //                             }
                        //                           },
                        //                         ),
                        //                       ),
                        //                       Padding(
                        //                         padding: const EdgeInsets.only(top: 10,bottom: 20),
                        //                         child: textfieldDescription(
                        //                           hintText: 'Message*',
                        //                           Controller:_message,
                        //                         ),
                        //                       ),
                        //
                        //                       const SizedBox(height: 30,),
                        //
                        //                       bottombutton(context,
                        //                           onPress: () {
                        //                             Navigator.pop(context);
                        //                           }, titleName: 'Submit'),
                        //                     ],
                        //                   ),
                        //                 )
                        //
                        //               ],
                        //             ),
                        //           ),
                        //         )
                        //     );
                          },
                          titleName: 'Join Now'),
                      Text('Tenure up to 330 days',style: lighttext,)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              New_SSP_Images(context, image: 'lib/assets/SSP_Plan2.png'),
              New_SSP_Image_Content(text: 'In this plan, Customers can order their choice of Jewellery by'
                  ' paying a one-time lump-sum as advance. After 330 days, the customer will receive '
                  'Jewellery equivalent to His/Her ordered value.', heading: '', isHeadingneeded: false),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
                    //PLAN HEADINGS AND CONTENTS
                    Content(content: 'Terms & Conditions'),
                    Heading(heading: 'A. VA Waiver'),
                    Content(content: 'On maturity, “ Gold Jewellery & Gold Coin” can be purchased in '
                        ' this scheme with a wavier of up to 18% VA (Value Addition) or '
                        ' on actuals, whichever is lower.'),
                    Heading(heading: 'B. Tenure & Maturity '),
                    Content(content: '11 Equated Monthly advances.'),
                    Heading(heading: 'C. Minimum Advance'),
                    Content(content: 'A minimum amount of Rs.25,000/- is to be paid to enrol in the Swarna Sakthi'
                                     ' Plan II.'),
                    Heading(heading: 'D. Gold Rate'),
                    Content(content: 'On maturity, “ Gold Jewellery & Gold Coin” can be purchased '
                        'in this scheme with a wavier of up to 18% VA (Value Addition)'
                        'or on actuals, whichever is lower.'),
                    Heading(heading: 'E. No. of Advance Payments'),
                    Content(content: 'At the end of the 330 days (i.e., joining date + 329 days) '
                        'Example: A customer joins Swarna Sakthi on 15th January + '
                        '329 days I.e., 10th December of the same year will be the redemption date.'),
                    Heading(heading: 'F. GST and other Levies'),
                    Content(content: 'GST and other Levies will be charged extra as per government norms.'),
                    Heading(heading: 'G. Pre-closure'),
                    Content(content: 'Benefit can be availed from the fourth month itself. On completion of'
                        ' 90 days, customer can get a benefit of 1% VA for each month completed. '
                        'Customer can avail a maximum of up to 10% on VA. Please refer to the table below.'),
                  ],
                ),
              ),
              //MATURITY BENIFITS IMAGE
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,bottom: 50),
                child: ImgPathSvg('Benifits2.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Heading ({required String heading}){
  return Padding(
    padding: const EdgeInsets.only(top: 5,bottom: 5),
    child: Text(heading,style: rate2,),
  );
}

Widget Content ({required String content}){
  return Padding(
    padding: const EdgeInsets.only(top: 5,bottom: 5),
    child: Text(content,style: lighttext,),
  );
}
