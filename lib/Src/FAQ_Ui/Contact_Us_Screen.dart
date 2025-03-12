import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Model/CompanyListModel.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';

import '../../utilits/Text_Style.dart';

class Contact_Us_Screen extends ConsumerStatefulWidget {
  const Contact_Us_Screen({super.key});

  @override
  ConsumerState<Contact_Us_Screen> createState() => _Contact_Us_ScreenState();
}

class _Contact_Us_ScreenState extends ConsumerState<Contact_Us_Screen> {
  @override
  Widget build(BuildContext context) {
    final companyListData = ref.watch(CompanyListProvider);

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home_DashBoard_Screen()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          //MAINBODY
          child: companyListData.when(
              data: (data) {
                return _Mainbody(data!);
              },
              loading: () {
                return Center(child: CircularProgressIndicator());
              },
              error: (Object error, StackTrace stackTrace) {}),
        ),
      ),
    );
  }

  Widget _Mainbody(CompanyListModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //ADDRESS CONTAINER
        Address(context, data),

        Contactustext(),

        // //SCHEME RELATED ENQUIRE
        // Scheme(context),

        //GENDRAL ENQUIRE
        contactus(context,
            heading: 'General Enquiries', number: data.mobile ?? ""),

        //WHATSAPP US
        if ((data.whatsappNo ?? "") != "")
          contactus(context,
              heading: 'WhatsApp Us', number: data.whatsappNo ?? ""),

        //MAIL US
        contactus(context, heading: 'Mail Us', number: data.email ?? ""),

        const SizedBox(
          height: 30,
        ),
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
    padding: const EdgeInsets.only(top: 15),
    child: Text(
      'Contact Us',
      style: texts2,
    ),
  );
}

Widget Address(context, CompanyListModel data) {
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
              "${data.companyName ?? ""}:",
              style: texts2,
            ),
            Divider(
              endIndent: 10,
            ),
            Text(
              '${data.address1 ?? ""},${data.address2 ?? ""} - ${data.pincode ?? ""}',
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
