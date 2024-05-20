import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';

//HEADING STYLE
TextStyle Heading_Style = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 24,
    color: Color.fromRGBO(24, 24, 24, 1),
    fontWeight: FontWeight.w700);

//HEADING STYLE
TextStyle Heading_Style1 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 20,
    color: Color.fromRGBO(24, 24, 24, 1),
    fontWeight: FontWeight.w700);

//PLAN STYLE
//HEADING STYLE
TextStyle Plan_Style = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 20,
    color: Font_Primary_Color,
    fontWeight: FontWeight.w600);

//SUB TEXT STYLE
TextStyle Sub_TextStyle = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 16,
    color: Color.fromRGBO(24, 24, 24, 1),
    fontWeight: FontWeight.w400);
TextStyle Sub_TextStyleBT = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 16,
    color: gradient1,
    fontWeight: FontWeight.w600);

//DROPDOWNT T
TextStyle dropDownST = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 18,
    color: gradient1,
    fontWeight: FontWeight.w700);

//PHONE NUMBER
TextStyle phone_ST = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 20,
    color: Color.fromRGBO(24, 24, 24, 1),
    fontWeight: FontWeight.w500);

//SKIP STYLE
TextStyle skip_ST = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w500);

//USER NAME ST
TextStyle UserST = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

//PLAN STYLE
TextStyle planST = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

//GRAM
TextStyle gramST = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w500);

//GOLD WEIGHT
TextStyle gram_Weight_Style = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.w500);

TextStyle gold_Gram_Wt = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 13,
    color: Font_Primary_Color,
    fontWeight: FontWeight.w500);

TextStyle gramrateST = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    color: green1,
    fontWeight: FontWeight.w500);

//RADIO T
TextStyle radioST = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w400);

TextStyle appTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500);
TextStyle appTitle2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    color: white1,
    fontWeight: FontWeight.w500);

TextStyle phoneHT = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    color: Color.fromRGBO(140, 140, 140, 1),
    fontWeight: FontWeight.w400);

TextStyle Textfield_Style = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400);

//AMOUNT T
TextStyle Amount_Style = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w600);

TextStyle TextField_Title = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w500);
TextStyle Textfield_Style2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w500);
TextStyle StarT = TextStyle(color: Colors.red, fontSize: 25);

//BUTTON TEXT
TextStyle ButtonT = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    color: white1,
    fontWeight: FontWeight.w700);

TextStyle ButtonT2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: white1,
    fontWeight: FontWeight.w600);

TextStyle ButtonT3 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w600);

TextStyle BlackTextColorLowSize = TextStyle(
  fontFamily: 'Metropolis',
  fontSize: 14,
  color: BlackNormal,
  fontWeight: FontWeight.w500,
);

TextStyle BlackTextColor = TextStyle(
  fontFamily: 'Inter',
  fontSize: 16,
  color: BlackNormal,
  fontWeight: FontWeight.w500,
);

TextStyle TBlack = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w600);
TextStyle TBlack1 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w700);

//HEADING
Widget Heading_Text(context, {required String Title}) {
  return Container(
    width: MediaQuery.sizeOf(context).width / 1.2,
    child: Text(
      Title,
      style: Heading_Style,
      maxLines: 2,
    ),
  );
}

//TEXTFIELD HEADING
Widget Title_Style({required String Title, required bool? isStatus}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 10),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          // width: 135,
          child: Text(
            Title,
            style: TextField_Title,
          ),
        ),
        Text(
          isStatus == true ? "*" : "",
          style: StarT,
        )
      ],
    ),
  );
}

Widget RadioText(String txt) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Text(
      txt,
      style: radioST,
    ),
  );
}

TextStyle pdfT = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w600);


// CHECK BOX
Widget CheckBoxes(
    {required bool? value,
      required void Function(bool?)? onChanged,
      required String checkBoxText,
      void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          activeColor: gradient1,
          onChanged: onChanged,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        InkWell(onTap: onTap, child: RadioText(checkBoxText)),
      ],
    ),
  );
}

//ONLINE EMI PAYMENT
//CONTAINER TEXTS
TextStyle plan1 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 18,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

TextStyle plantexts = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 12,
    color: Color.fromRGBO(130, 130, 130, 1),
    fontWeight: FontWeight.w500);

TextStyle plancode = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 12,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w500);

TextStyle plantexts2 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(141, 141, 141, 1),
    fontWeight: FontWeight.w500);

TextStyle rate = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 25,
    color: Color.fromRGBO(12, 167, 80, 1),
    fontWeight: FontWeight.w900);

TextStyle rate2 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w500);

TextStyle maintext = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

//FAQ TEXT
TextStyle texts = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 15,
    color: Color.fromRGBO(16, 24, 40, 1),
    fontWeight: FontWeight.w500);

TextStyle texts2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w500);

//FAQ CONTACT US
TextStyle lighttext = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(116, 116, 116, 1),
    fontWeight: FontWeight.w400);

//FAQ CONTAINER HEADING
TextStyle colortexts = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(217, 154, 38, 1),
    fontWeight: FontWeight.w500);

//MOBILE NUMBER
TextStyle Num = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 24,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

//HEADING 2
TextStyle Heading2 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 24,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w800);

//MY SSP
TextStyle sspplan = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 18,
    color: Color.fromRGBO(145, 26, 29, 1),
    fontWeight: FontWeight.w600);

//VIEW DETAILS
TextStyle Viewdetails = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 15,
    color: Color.fromRGBO(217, 154, 38, 1),
    fontWeight: FontWeight.w600);

//HEIP
TextStyle help = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 16,
    color: Color.fromRGBO(117, 117, 117, 1),
    fontWeight: FontWeight.w500);


//PLAN ACTIVE
Widget Plan_Active(){
  return  Row(
    children: [
      ImgPathSvg('calendar2.svg'),
      const SizedBox(width: 10),
      Text('2 Plan Active',style: rate2,),
    ],
  );
}

//PLAN ACTIVE
Widget Weight_Gold(context,{required String goldWt}){
  return  Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width/3.45,
            child: Text('Equivalent Weight : ',style: gram_Weight_Style,maxLines: 2,)),
        Text(goldWt,style: gold_Gram_Wt,),
      ],
    ),
  );
}

//HELP CENTER
Widget HelpContainer(context){
  return Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 30),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: white2,
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

Widget Help ({required String text}){
  return Row(
    children: [
      Radio(value: 1, groupValue: 1, onChanged: null),
      Text(text,style: rate2,),
    ],
  );
}

//TOTAL AMMOUNT
Widget Total_Plan_Amount({required String amount}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Total INR',style: maintext,),
      const Spacer(),
      Text('₹${amount}',style: texts2,),
    ],
  );
}