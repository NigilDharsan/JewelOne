import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Plan1_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

import '../../Common_Widgets/Common_Card.dart';
class New_SSP_Plan3_Screen extends StatefulWidget {
  const New_SSP_Plan3_Screen({super.key});

  @override
  State<New_SSP_Plan3_Screen> createState() => _New_SSP_Plan3_ScreenState();
}

class _New_SSP_Plan3_ScreenState extends State<New_SSP_Plan3_Screen> {
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
                            child: Text('Old Gold Advance Plan Tenure: 330 days)',style: rate2,maxLines: 2,)),
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

      body: _MainBody(),
    );
  }

  Widget _MainBody (){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //TOP IMAGE
            New_SSP_Images(context, image: 'lib/assets/SSP_Plan_3.png',),

            New_SSP_Image_Content(text: 'On starting of Swarna Sakthi Plan III, customers can give their'
                ' Old Gold as advance and order their New Jewellery. The given old gold will be verified'
                ' for its purity and converted to 916 weight. After 330 days, customer can buy Gold Jewellery '
                'against the converted 916 weights. ',
                heading: '', isHeadingneeded: false),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //PLAN HEADINGS AND CONTENTS
                  Content(content: 'Terms & Conditions'),
                  Heading(heading: 'A. The gold ornaments / coins / bars'),
                  Content(content: 'The gold ornaments / coins / bars received from customers towards the order of'
                      ' making new jewellery under plan III will be melted and refined. Hence the same cannot be '
                      ' returned in its original form. The equivalent quantum of gold received and its 916 purity will '
                      'be denoted in the voucher. '),
                  Heading(heading: 'B. VA Waiver'),
                  Content(content: 'On maturity, “Gold Jewellery & Gold Coin” can be purchased in this scheme with a'
                      ' waiver up to 18% VA (Value Addition) or on actuals, whichever is lower.'),
                  Heading(heading: 'C. Tenure & Maturity '),
                  Content(content: '330 Days'),
                  Heading(heading: 'D. Minimum Advance'),
                  Content(content: 'On maturity, “ Gold Jewellery & Gold Coin” can be purchased '
                      'in this scheme with a wavier of up to 18% VA (Value Addition)'
                      'or on actuals, whichever is lower.'),
                  Heading(heading: 'E. GST and other Levies'),
                  Content(content: 'GST and other Levies will be charged extra as per government norms.'),
                  Heading(heading: 'A. Plan I'),
                  Content(content: '1. Plan 1: If the customer pays EMA continuously for 10 months but wants to pre-close'
                      ' it on completion of 300 days, they can avail a pre-closure benefit of 12% or actual VA, '
                      'whichever is less.'),
                  Heading(heading: 'B. Plan II & III'),
                  Content(content: '1. Benefit can be availed from the fourth month itself. On completion of 90 days, '
                      'the customer can get a benefit of 1% for each month completed. Customer can avail a maximum of up to'
                      ' 10% on VA.  2. For example : If the Customer wants to buy after 6 months, they benefit by way'
                      ' of 1% x 6 = 6% VA waiver for the advance given in this scheme.'),
                  Text('Non-Redemption on Maturity',style: Gramage2,),
                  Content(content: 'If the customer does not purchase Jewellery at the end of 330 days from the '
                      'date of enrollment and grace period of 10 days given by the company from the maturity of'
                      ' scheme, then the total advance amount will be invoiced with an equivalent weight of 22 karat '
                      'gold coin as per the rate fixed by the customer without any benefit, (For example: a customer '
                      'has given Rs.1,00,000 in the scheme and a Gold ate is fixed as Rs.4,500 per gram, then the '
                      'refund will be in the form of 22.220 (approx.) grams of 22k gold coin).'),
                ],
              ),
            ),
            New_SSP_Images(context, image: 'lib/assets/Exchange.png'),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(heading: 'General Terms'),
                  Terms_and_Conditions(context, TCtext: 'Every Month’s advance amount should be paid on or before'
                      ' the end of themonth in Plan I'),
                  Terms_and_Conditions(context, TCtext: 'In plan I, any excess advance amount will be adjusted'
                      ' for upcoming months'),
                  Terms_and_Conditions(context, TCtext: 'In Plan I, full benefits will be given only if EMA'
                      ' payments are paid continuously without any default.'),
                  Terms_and_Conditions(context, TCtext: 'Waiver of VA is applicable only on Gold Jewellery and Gold Coin.'
                      ' Stone charges are applicable.'),
                  Terms_and_Conditions(context, TCtext: 'No Customization Orders accepted/allowed for any '
                      'Swarna Sakthi schemes. The customer can place the order from our Existing Design Bank only.'),
                  Terms_and_Conditions(context, TCtext: 'No Partial purchase from the advance paid will be allowed.'),
                  Terms_and_Conditions(context, TCtext: 'Refund will not be permitted under any circumstances'
                      ' for any of the Swarna Sakthi Plans.'),
                  Terms_and_Conditions(context, TCtext: 'Collection of receipt from JewelOne for amount remitted is mandatory.'
                      ' Incase of payment made through Cheque/PDC/ECS/Virtual Account, receipt can be obtained after'
                      ' realisation in our account. EMA receipts will be sent through Mail / WhatsApp.'),
                  Terms_and_Conditions(context, TCtext: 'Any promotional offers / existing discounts will not be'
                      ' clubbed with Swarna Sakthi redemption value.'),
                  Terms_and_Conditions(context, TCtext: 'If the customer buys extra gold over and above the '
                      'accumulated weight in Swarna Sakthi, actual VA is applicable for the extra weight.'
                      ' They can also avail prevailing offers at the time of purchase for the extra gold'),
                  Terms_and_Conditions(context, TCtext: 'Gold Coins can also be purchased under this scheme.'),
                  Terms_and_Conditions(context, TCtext: 'Customers should produce their identity proof (preferably Aadhaar Card)'
                      ' and the bank account details with documentary proof, which is mandatory at the time of enrollment'
                      ' and redemption. The customer should also produce the original receipt during the clouser'),
                  Terms_and_Conditions(context, TCtext: 'If any assistance is needed in opting for Virtual Account '
                      'Payment, Kindly contact your nearest JewelOne showroom (or) call toll free: 1800 1033 916.'),
                  Terms_and_Conditions(context, TCtext: 'GST and other Levies will be charged extra as per government norms'),
                  Terms_and_Conditions(context, TCtext: 'JewelOne reserves the right to retain / modify / '
                      'withdraw any of the schemes at its sole discretion.'),
                  Terms_and_Conditions(context, TCtext: 'Any dispute would be subject to Coimbatore Jurisdiction only.')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget Terms_and_Conditions (context,{required String TCtext}){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10,right: 5),
        child: ImgPathSvg('Polygon.svg'),
      ),
      Container(
        width: MediaQuery.sizeOf(context).width/1.2,
        // color: Colors.green,
        child: Content(content: TCtext),
      )
    ],
  );
}
