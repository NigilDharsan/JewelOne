import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../Common_Widgets/Image_Path.dart';
import '../../utilits/Common_Colors.dart';
import '../../utilits/Text_Style.dart';
class My_SSP_Screen extends StatefulWidget {
  const My_SSP_Screen({super.key});

  @override
  State<My_SSP_Screen> createState() => _My_SSP_ScreenState();
}

class _My_SSP_ScreenState extends State<My_SSP_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink3,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: _Mainbody(),
    );
  }
  Widget _Mainbody (){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
        child: Column(
          children: [
            Row(
              children: [
                ImgPathSvg('calendar2.svg'),
                const SizedBox(width: 10),
                Text('2 Plan Active',style: rate2,),
              ],
            ),

            //PLAN1 CONTAINER
            Plan1(context),

            //PLAN2 CONTAINER
            plan2(context),

            //HELP CONTAINER
            HelpContainer(context),
          ],
        ),
      ),
    );
  }
}

Widget ssp_plan_text ({required String title,required dynamic style}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(title,style: style,),
  );
}

Widget ssp_plan_details ({required String text,required String text2}){
  return Padding(
    padding: const EdgeInsets.only(right: 10,bottom: 10,top: 10,),
    child: Row(
      children: [
        Text(text,style: lighttext,),
        const Spacer(),
        Text(text2,style: rate2,),
        const Divider(),
      ],
    ),
  );
}

//PLAN1 CONTAINER
 Widget Plan1 (context){
  return Padding(
    padding: const EdgeInsets.only(top: 15,bottom: 10),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: white1,
          border: Border.all(width: 1,color: gradient2),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Plan 1',style: sspplan,),
                const Spacer(),
                ImgPathSvg('downarrow.svg'),
              ],
            ),

            //PLAN 1 DETAILS
            ssp_plan_text(title: 'Gold Ornaments Purchase Advance Scheme', style: rate2),
            ssp_plan_text(title: 'View Details >', style: Viewdetails),
            const Divider(),
            ssp_plan_details(text: 'ID number', text2: 'SS/2324/JO/000475'),
            const Divider(),
            ssp_plan_details(text: 'ID number', text2: 'SS/2324/JO/000475'),
            const Divider(),
            ssp_plan_details(text: 'A/c name', text2: 'Mr. Vinoth Kumar V'),
            const Divider(),
            ssp_plan_details(text: 'Location', text2: 'Coimbatore'),
            const Divider(),
            ssp_plan_details(text: 'Total plan amount', text2: '₹55,000'),
            const Divider(),
            ssp_plan_details(text: 'Monthly EMA', text2: '₹5,000'),
            const Divider(),
            ssp_plan_details(text: 'Tenure', text2: 'up to 11 months'),
            const Divider(),
            ssp_plan_details(text: 'Gold saved till date', text2: '9.863 g'),
          ],
        ),
      ),
    ),
  );
 }

 Widget plan2 (context){
   return Container(
     width: MediaQuery.sizeOf(context).width,
     decoration: BoxDecoration(
         color: white1,
         border: Border.all(width: 1,color: gradient2),
         borderRadius: BorderRadius.circular(10)
     ),
     child: Padding(
       padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             children: [
               Text('Plan 2',style: sspplan,),
               const Spacer(),
               ImgPathSvg('rightarrow.svg'),
             ],
           ),
           ssp_plan_text(title: 'Gold Ornaments Purchase Advance Scheme', style: rate2),
           ssp_plan_text(title: 'View Details >', style: Viewdetails),
         ],
       ),
     ),
   );
 }

 Widget Help ({required String text}){
  return Row(
    children: [
      Radio(value: 0, groupValue: 1, onChanged: null),
      Text(text,style: rate2,),
    ],
  );
 }

 Widget HelpContainer(context){
  return Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 30),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: pink4,
          border: Border.all(width: 1,color: pink5),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Help',style: help,),
            Help(text: 'View Frequently Asked Questions'),
            Help(text: 'How to Repay?'),
          ],
        ),
      ),
    ),
  );
 }
