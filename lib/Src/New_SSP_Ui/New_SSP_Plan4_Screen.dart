import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Card.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Plan1_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class New_SSP_Plan4_Screen extends StatefulWidget {
  const New_SSP_Plan4_Screen({super.key});

  @override
  State<New_SSP_Plan4_Screen> createState() => _New_SSP_Plan4_ScreenState();
}

class _New_SSP_Plan4_ScreenState extends State<New_SSP_Plan4_Screen> {
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
        title1: "Wedding Jewellery Plan",
        title2: 'One -Time Lump-Sum Advance Plan (Tenure: 330 Days)',
        actionLogo: 'info.svg', isWhite: false, ActiononTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
      },),
      bottomNavigationBar: Container(
        height: 170,
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
                            child: Text('Old Gold Advance Plan Tenure: 330 days)',style: rate2,maxLines: 2,)),
                        Container(
                          width: MediaQuery.sizeOf(context).width/2.8,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('EMA from ₹5,000 /month',style: lighttext,),
                          ),
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
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Grammage_Plan_Screen()));
                            // showModalBottomSheet(context: (context), builder: (context)=>
                            //     Container(
                            //       height:MediaQuery.sizeOf(context).height/1,
                            //       width: MediaQuery.sizeOf(context).width,
                            //       decoration: BoxDecoration(
                            //           color: white1,
                            //           borderRadius: BorderRadius.only(
                            //               topRight: Radius.circular(10),
                            //               topLeft: Radius.circular(10)
                            //           )
                            //       ),
                            //       child: SingleChildScrollView(
                            //         child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //               width: MediaQuery.sizeOf(context).width,
                            //               decoration: BoxDecoration(
                            //                   color: pink6,
                            //                   borderRadius: BorderRadius.only(
                            //                       topRight: Radius.circular(10),
                            //                       topLeft: Radius.circular(10)
                            //                   )
                            //               ),
                            //               child: Padding(
                            //                 padding: const EdgeInsets.only(top: 10,bottom: 10),
                            //                 child: Column(
                            //                   children: [
                            //                     Text('Plan 2',style: sspplan,),
                            //                     Container(
                            //                         width: MediaQuery.sizeOf(context).width/1.2,
                            //                         child: Text('One -Time Lump-Sum Advance Plan (Tenure: 330 Days)',style: texts2,maxLines: 2,textAlign: TextAlign.center,))
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
                            //               child: Column(
                            //                 children: [
                            //                   //INTRESTED AMOUNT
                            //                   Title_Style(Title: 'Interested Amount', isStatus: null),
                            //                   droptextFormField(
                            //                     hintText: 'example Rs.1,30,000',
                            //                     keyboardtype: TextInputType.number,
                            //                     inputFormatters: [
                            //                       LengthLimitingTextInputFormatter(10),
                            //                     ],
                            //                     Controller: _amount,
                            //                     validating: (value) {
                            //                       if (value == null || value.isEmpty) {
                            //                         return "Please Enter Amount";
                            //                       }
                            //                       else if (value == null) {
                            //                         return "Please Enter valid Amout";
                            //                       }
                            //                       return null;
                            //                     },
                            //                     onChanged: null,
                            //                   ),
                            //
                            //                   //CONTACT DETAILS
                            //                   Title_Style(Title: 'Contact Details', isStatus: null),
                            //                   droptextFormField(hintText: 'Enter Mobile*',
                            //                       keyboardtype: TextInputType.phone,
                            //                       Controller: _MobileNumber,
                            //                       inputFormatters: [
                            //                         LengthLimitingTextInputFormatter(10),
                            //                         FilteringTextInputFormatter.digitsOnly],
                            //                       onChanged: null,
                            //                       validating:(value){
                            //                         if (value!.isEmpty) {
                            //                           return 'Please enter a mobile number';
                            //                         } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                            //                           return 'Please enter a valid 10-digit mobile number';
                            //                         }
                            //                         return null;
                            //                       }
                            //                   ),
                            //
                            //
                            //                   //EMAIL
                            //                   Padding(
                            //                     padding: const EdgeInsets.only(top: 10),
                            //                     child: droptextFormField(hintText: 'Enter Email*',
                            //                       keyboardtype: TextInputType.phone,
                            //                       Controller: _email,
                            //                       inputFormatters: [
                            //                         FilteringTextInputFormatter.digitsOnly],
                            //                       onChanged: null,
                            //                       validating: (value){
                            //                         if(value==null||value.isEmpty){
                            //                           return "Enter Email";
                            //                         }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                            //                           return "Please Enter valid Email ";
                            //                         }else{
                            //                           return null;
                            //                         }
                            //                       },
                            //                     ),
                            //                   ),
                            //                   Padding(
                            //                     padding: const EdgeInsets.only(top: 10,bottom: 20),
                            //                     child: textfieldDescription(
                            //                       hintText: 'Message*',
                            //                       Controller:_message,
                            //                     ),
                            //                   ),
                            //
                            //                   const SizedBox(height: 30,),
                            //
                            //                   bottombutton(context,
                            //                       onPress: () {
                            //                     Navigator.pop(context);
                            //                         {}
                            //                       }, titleName: 'Submit'),
                            //                 ],
                            //               ),
                            //             )
                            //
                            //           ],
                            //         ),
                            //       ),
                            //     )
                            // );
                          }, titleName: 'Join Now'),
                      Padding(
                        padding: const EdgeInsets.only(top: 5,right: 10),
                        child: Text('Tenure up to 11 months',style: lighttext,),
                      )
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
          children: [
            //TOP IMAGE
            New_SSP_Images(context, image: 'lib/assets/New_SSP4.png',),
            New_SSP_Image_Content(text: 'To Join this plan, Customer will order Jewellery by paying in onetime lump-sum advance,(or) Old gold Jewellery, After 11 months ( 330 days ) '
                'customer will receive Jewelleryequivalent to her / his ordered value With “0% VA”.',
                heading: '', isHeadingneeded: false),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 15,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //PLAN HEADINGS AND CONTENTS
                  Content(content: 'Terms & Conditions'),

                  TandCRow(heading1: 'VA Waiver', content1: '“0% VA “'),
                  TandCRow(heading1: 'Tenure & Maturity', content1: '330 days.'),
                  TandCRow(heading1: 'Minimum Advance Amount', content1: '250 gms.'),

                  Content(content: 'The gold ornaments / coins / bars received from customers towards the order'
                      ' of making new Jewellery under Wedding Jewellery plan will be melted and refined,'
                      ' Hence the same cannot be returned in its original form. The equivalent quantum of gold '
                      'received and its 916 purity is denoted in the voucher.'),
                  Heading(heading: 'GST'),
                  Content(content: 'GST will be charged extra as per government norms.'),
                  Heading(heading: 'Pre-closure'),
                  Content(content: 'Customer needs to complete minimum period of 3 month (90 days)  to avail pre'
                      ' closure benefits maximum of up to 10 % on VA.'),
                  Heading(heading: 'For Example'),
                  Content(content: 'If the customer wants to buy within 6 months, they get benefit of 1%x6 = 6% waiver'
                      ' OFF on VA for the Advance given in this scheme. Please refer to the table below'),

                  //MATURITY BENIFITS IMAGE
                  ImgPathSvg('Benifits4.svg'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Divider(indent: 20,endIndent: 20,),
            ),

            //STACK
            Stack(
              children: [
                Container(
                  height: 800,
                  width: MediaQuery.sizeOf(context).width,
                  decoration:BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('lib/assets/stackimage.png'))
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //STACK CONTENTS
                        Container(
                            width: MediaQuery.sizeOf(context).width/1.5,
                            child: Text('A Golden Future Awaits',style: stackT,)),
                        Text('Start Your Journey Now!',style: stackT2,),
                        Text('Non-Redemption on Maturity',style: Gramage2,),


                        Container(
                          width: MediaQuery.sizeOf(context).width/1.2,
                          child: Content(content: 'If the customer does not purchase Jewellery at the end of 330 days '
                              'from the date of enrollment and grace period of 10 days given by the company from'
                              ' the maturity of scheme, then the total advance amount will be invoiced with an '
                              'equivalent weight of 22 karat gold coin as per the rate fixed by the customer '
                              'without any benefit, (For example: a customer has given Rs.1,00,000 in the scheme '
                              'and a Gold ate is fixed as Rs.4,500 per gram, then the refund will be in the form '
                              'of 22.220 (approx.) grams of 22k gold coin).  GST will be charged extra as per government norms.'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            Container(
              width: MediaQuery.sizeOf(context).width,
              color: white1,
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 15,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading(heading: 'Gendral Terms'),
                    Content(content: 'The Swarna Sakthi Wedding Jewellery Plan“0% VA” Benefits can apply only for GoldJewellery & Gold Coins. Not applicable forDiamond Jewellery, Platinum Jewellery and Silver Jewellery.  No Customization Orders accepted/allowed for Swarna Sakthi wedding Jewellery Plan. The Customer can place the order from our Existing Design Bank.  No Partial Withdrawal from the Advance paid will be allowed.  No cash refund will be permitted for the Swarna Sakthi Wedding Jewellery Plan.  Customers should produce their identity proof and the bank account details withdocumentary proof, which is mandatory at the time of enrollment and redemption. The customer should also produce the original receipt during the closure.'),
                    Content(content: 'Any promotional offers/existing discounts will not be clubbed with Swarna Sakthi redemption value.  If the customer buys extra gold over and above the accumulated weight in Swarna sakthi, Actual VA is applicable for the extra weight. They can also avail prevailing offers at the time of purchase for the extra gold.  GST will be charged extra as per government norms.  Stone charges are as applicable. (Waiver of VA is applicable only on 916 Gold jewellery)  If any assistance is needed in opting for NEFT/RTGS payment, kindly contact your nearest jewel one showroom (or)call Toll free : 1800 1033 916.  Any dispute would be subject to Coimbatore jurisdiction only.  ')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget TandCRow ({required String heading1,required String content1}){
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Heading(heading: heading1),
      ),
      Content(content:content1)
    ],
  );
}
