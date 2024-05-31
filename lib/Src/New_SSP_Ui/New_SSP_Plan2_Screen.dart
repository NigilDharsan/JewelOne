import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Card.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class New_SSP_Plan2_Screen extends StatefulWidget {
  const New_SSP_Plan2_Screen({super.key});

  @override
  State<New_SSP_Plan2_Screen> createState() => _New_SSP_Plan2_ScreenState();
}

class _New_SSP_Plan2_ScreenState extends State<New_SSP_Plan2_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      bottomNavigationBar: Container(
        height: 150,
        width: MediaQuery.sizeOf(context).width,
        color: white1,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: pink3,
              border: Border.all(width: 1,color: gradient2),
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

                  //BOTTOM BAR CONTENTS
                  Column(
                    children: [
                      Paynowcommonbutton1 (context,
                          onPress: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Online_Emi_Payment_Screen()));
                          }, titleName: 'Enquiry Now'),
                      Text('Tenure up to 11 months',style: lighttext,)
                    ],
                  )
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
                padding: const EdgeInsets.only(left: 5,right: 5),
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
