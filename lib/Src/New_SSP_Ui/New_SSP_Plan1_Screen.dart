import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Card.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/Grammage_Plan_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class New_SSP_Plan1_Screen extends StatefulWidget {
  const New_SSP_Plan1_Screen({super.key});

  @override
  State<New_SSP_Plan1_Screen> createState() => _New_SSP_Plan1_ScreenState();
}

class _New_SSP_Plan1_ScreenState extends State<New_SSP_Plan1_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar:Custom_AppBar(
          isNav: true,
          isTwoLine: true,
          title1: "Plan 1",
          title2: 'Gold Ornaments Purchase Advance Scheme',
          actionLogo: 'info.svg', isWhite: false, ActiononTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
      },),

      //BOTTOM BAR
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Gramage Plan',style: rate2,),
                      Text('EMA from ₹5,000 /month',style: lighttext,),
                      Text('Benefit (VA) 18%',style: rate2,)
                    ],
                  ),
                ),

                const Spacer(),

                //BOTTOM BAR CONTENTS
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Paynowcommonbutton1 (context,
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Grammage_Plan_Screen()));
                          }, titleName: 'Join Now'),
                      Text('Tenure up to 11 months',style: lighttext,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //TOP IMAGE
            New_SSP_Images(context, image: 'lib/assets/New_SSP_Plan1_Image.png'),

            //TOP IMAGE CONTENT
            New_SSP_Image_Content(text: 'A customer can select any Jewellery design of Her/His choice'
                ' and place an order. Customer can pay the estimated order value in installments at '
                'regular monthly basis as per His/Her convenience. On or before the end of every month, '
                'as 11 Equated Monthly Advance (EMA).', heading: 'Grammage Accumulation', isHeadingneeded: true),
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
                  Heading(heading: 'B. No. of Advance Payments'),
                  Content(content: '11 Equated Monthly advances.'),
                  Heading(heading: 'C. Tenure'),
                  Content(content: '330 Days'),
                  Heading(heading: 'D. Minimum Monthly Advance'),
                  Content(content: 'On maturity, “ Gold Jewellery & Gold Coin” can be purchased '
                      'in this scheme with a wavier of up to 18% VA (Value Addition)'
                      'or on actuals, whichever is lower.'),
                  Heading(heading: 'E. No. of Advance Payments'),
                  Content(content: 'At the end of the 330 days (i.e., joining date + 329 days) '
                      'Example: A customer joins Swarna Sakthi on 15th January + '
                      '329 days I.e., 10th December of the same year will be the redemption date.'),
                  Heading(heading: 'F. Swarna Sakthi Order Redemption'),
                  Content(content: 'At the end of the 330 days (i.e., joining date + 329 days) Example: A '
                      'customer joins Swarna Sakthi on 15th January + 329 days I.e., 10th December '
                      'of the same year will be the redemption date.'),
                  Heading(heading: 'G. Maturity'),
                  Content(content: 'Maturity is on completion of the 330 days and this tenure of 330'
                      ' days cannot be extended under any circumstances. '),
                  Heading(heading: 'H. Refund'),
                  Content(content: 'Refund is not permitted in this plan under any circumstances as EMA'
                      ' is converted to gold weight at the time of payment itself.'),
                  Heading(heading: 'I. GST & other Levies'),
                  Content(content: 'GST & other Levies will be charged extra as er government norms.'),
                  Heading(heading: 'J. Eligibility'),
                  Content(content: 'Wavier of upto 18% VA will be given only if EMA payments are paid'
                      ' continuously without any default.'),
                  Heading(heading: 'K. After-maturity Benefits'),
                  Content(content: 'In case of default, eligible benefit will be based on the number of'
                      ' EMAs (complete minimum period of 90 days). Customer will get '
                      'benefit of 1% VA for each EMA paid month. Customer can avail maximum'
                      ' of upto 10% on VA. Please refer to the table below.'),
                ],
              ),
            ),

            //MATURITY BENIFITS IMAGE
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,bottom: 50),
              child: ImgPathSvg('Benifits.svg'),
            ),
          ],
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
