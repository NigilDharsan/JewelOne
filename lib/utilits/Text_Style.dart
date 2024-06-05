import 'package:flutter/material.dart';
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
    fontSize: 14,
    color: Font_Primary_Color,
    fontWeight: FontWeight.w600);

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

TextStyle bottomotext = TextStyle(
    fontFamily: 'Metropolis',
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

TextStyle walletT2 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 12,
    color: Color.fromRGBO(136, 136, 136, 1),
    fontWeight: FontWeight.w500);

//GRAM
TextStyle gramST = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    color: Colors.black,
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

TextStyle radioST1 = TextStyle(
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
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w500);

TextStyle Textfield_Style = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400);

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
TextStyle StarT = TextStyle(color: Colors.red, fontSize: 16);

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
    fontFamily: 'Metropolis',
    fontSize: 24,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w800);

TextStyle Total_Plan_amount = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 18,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

TextStyle Plan_Style = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 20,
    color: Color.fromRGBO(145, 26, 29, 1),
    fontWeight: FontWeight.w600);

TextStyle Tamount = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w600);

TextStyle TBlack1 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w700);

TextStyle Goldweight = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 13,
    color: Color.fromRGBO(145, 26, 29, 1),
    fontWeight: FontWeight.w500);


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

TextStyle success = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 10,
    color: Color.fromRGBO(12, 167, 80, 1),
    fontWeight: FontWeight.w600);

TextStyle rate2 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

TextStyle maintext = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Color.fromRGBO(45, 45, 45, 1),
    fontWeight: FontWeight.w600);

TextStyle TabbarT = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Color.fromRGBO(126, 126, 126, 1),
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

//NEW SSP TEXTS
TextStyle Gramage = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 26,
    color: Color.fromRGBO(247, 198, 118, 1),
    fontWeight: FontWeight.w600);

TextStyle Gramage2 = TextStyle(
    fontFamily: 'Metropolis',
    fontStyle: FontStyle.italic,
    fontSize: 15,
    color: Color.fromRGBO(160, 34, 44, 1),
    fontWeight: FontWeight.w700);


TextStyle stackT = TextStyle(
    fontFamily: 'Canela Trial',
    fontSize: 40,
    color: Color.fromRGBO(158, 89, 36, 1),
    fontWeight: FontWeight.w400);

TextStyle stackT2 = TextStyle(
    fontFamily: 'Canela Trial',
    fontStyle: FontStyle.italic,
    fontSize: 20,
    color: Color.fromRGBO(158, 89, 36, 1),
    fontWeight: FontWeight.w400);

TextStyle Content1 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontWeight: FontWeight.w400);


TextStyle TandC = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 16,
    color: Color.fromRGBO(138, 138, 138, 1),
    fontWeight: FontWeight.w500);

TextStyle GPlanT = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 18,
    color: Color.fromRGBO(159, 33, 44, 1),
    fontWeight: FontWeight.w600);

TextStyle WalletT = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(159, 33, 44, 1),
    fontWeight: FontWeight.w500);

TextStyle WalletT1 = TextStyle(
    fontFamily: 'Metropolis',
    fontSize: 14,
    color: Color.fromRGBO(89, 89, 89, 1),
    fontWeight: FontWeight.w500);