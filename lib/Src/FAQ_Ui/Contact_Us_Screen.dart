import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';

import '../../utilits/Text_Style.dart';

class Contact_Us_Screen extends StatefulWidget {
  const Contact_Us_Screen({super.key});

  @override
  State<Contact_Us_Screen> createState() => _Contact_Us_ScreenState();
}

class _Contact_Us_ScreenState extends State<Contact_Us_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(
        isNav: true,
        isTwoLine: false,
        title1: '',
        title2: '',
        actionLogo: 'home.svg',
        isWhite: true,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
        },
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20,),
        child: SingleChildScrollView(
          //MAINBODY
          child: _Mainbody(),
        ),
      ),
    );
  }

  Widget _Mainbody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TIMING
        Text(
          'Business Timings',
          style: texts2,
        ),
        Text(
          'Monday - Saturday   10:00 AM - 06:30 PM',
          style: lighttext,
        ),
        //DIVIDER
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ImgPathSvg('dottedline.svg')),
        ),
        //ADDRESS CONTAINER
        Address(context),

        Contactustext(),

        //SCHEME RELATED ENQUIRE
        Scheme(context),

        //GENDRAL ENQUIRE
        contactus(context,
            heading: 'General Enquiries', number: '1800 1033916'),

        //WHATSAPP US
        contactus(context, heading: 'WhatsApp Us', number: '+91 73972 73272'),

        //MAIL US
        contactus(context,
            heading: 'Mail Us', number: 'retail.crm@ejindia.com'),

        const SizedBox(height: 30,),
      ],
    );
  }
}

Widget contactus(context, {required String heading, required String number}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: white1,
            border: Border.all(width: 1, color: white8),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      heading,
                      style: colortexts,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      'Copy',
                      style: texts2,
                    ),
                  ),
                ],
              ),
              Text(
                number,
                style: Num,
              )
            ],
          ),
        )),
  );
}

Widget Contactustext() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15, top: 15),
    child: Text(
      'Contact Us',
      style: texts2,
    ),
  );
}

Widget Address(context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 20,
    ),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: white1,
          border: Border.all(width: 1, color: white8),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JewelOne Corporate Office:',
              style: texts2,
            ),
            Divider(
              endIndent: 10,
            ),
            Text(
              '231, 1, E TV Swamy Rd, R.S. Puram, Coimbatore,Tamil Nadu 642002',
              style: lighttext,
            )
          ],
        ),
      ),
    ),
  );
}

Widget Scheme(context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
        color: white1,
        border: Border.all(width: 1, color: white8),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Scheme related Enquiries',
              style: colortexts,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Mr. Rajasekar',
                  style: lighttext,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  'Copy',
                  style: texts2,
                ),
              ),
            ],
          ),
          Text(
            '+91 95974 44855',
            style: Num,
          )
        ],
      ),
    ),
  );
}
