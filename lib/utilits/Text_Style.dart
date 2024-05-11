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