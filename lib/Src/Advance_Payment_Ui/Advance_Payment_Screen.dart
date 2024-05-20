import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/utilits/Text_Style.dart';

import '../../Common_Widgets/Common_Button.dart';
import '../../Common_Widgets/Image_Path.dart';
import '../../utilits/Common_Colors.dart';

class Advance_Payment_Screen extends StatefulWidget {
  const Advance_Payment_Screen({super.key});

  @override
  State<Advance_Payment_Screen> createState() => _Advance_Payment_ScreenState();
}

class _Advance_Payment_ScreenState extends State<Advance_Payment_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(
        isNav: true,
        isTwoLine: true,
        title1: 'Payment',
        title2: 'Equated Monthly Advance',
        actionLogo: 'info.svg',
        isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: SingleChildScrollView(child: _Mainbody()),
    );
  }

  Widget _Mainbody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //SELECT A MONTH TEXTS
        test(),

        //RADIO BUTTON AND SELECT ALL
        radiobutton(),

        //LIST VIEW BUILDER
        List_View_builder(context),

        //TOTAL EMI AMOUNT
        Total(),

        // BUTTON
        paynow(context),
      ],
    );
  }
}

//SELECT A MONTH TEXT
Widget test() {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10),
    child: Text(
      'Select the months to make advance payment',
      style: maintext,
    ),
  );
}

//RADIO BUTTON AND SELECT ALL
Widget radiobutton() {
  return Padding(
    padding: const EdgeInsets.only(left: 45, bottom: 10),
    child: Row(
      children: [
        Radio(value: 0, groupValue: 1, onChanged: null),
        Text(
          'Select all',
          style: maintext,
        ),
      ],
    ),
  );
}

//LIST VIEW BUILDER
Widget List_View_builder(context) {
  return Container(
    child: ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                color: white1,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: grey5)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(value: 1, groupValue: 0, onChanged: null),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SS/2324JO/000475",
                          style: plancode,
                        ),
                        Text('Equilant Weight: 0.89 g')
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '21 Feb 2024',
                          style: plantexts,
                        ),
                        Text(
                          '₹5,000',
                          style: plan1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

//TOTAL EMI AMOUNT
Widget Total() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
    child: Row(
      children: [
        Text(
          'Total EMIs Payment',
          style: maintext,
        ),
        const Spacer(),
        Text('₹10,000.00 ', style: plan1),
      ],
    ),
  );
}

//PAY NOW BUTTON
Widget paynow(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 50),
    child: CommonContainerButton(context, onPress: () {}, titleName: 'Pay Now'),
  );
}
