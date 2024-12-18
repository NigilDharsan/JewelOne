import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import '../../Common_Widgets/Image_Path.dart';
import '../../utilits/Text_Style.dart';

class Faq_Screen extends ConsumerStatefulWidget {
   Faq_Screen({super.key});

  @override
  ConsumerState<Faq_Screen> createState() => _Faq_ScreenState();
}

class _Faq_ScreenState extends ConsumerState<Faq_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(
        isNav: true,
        isTwoLine: false,
        title1: 'Frequently Asked Questions',
        title2: '',
        actionLogo: 'home.svg',
        isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: _mainbody(),
      ),
    );
  }

  Widget _mainbody() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          //FAQ QUESTIONS
          faqtexts(context,
              questions: 'Do you have gold investment plan?',
              pathSVG: 'minus.svg'),
          faqtexts(context,
              questions:
                  'We have a purchase plan called Swarna Sakthi. Which benefits you to buy jewellery',
              pathSVG: 'null'),
          Divider(),
          faqtexts(context,
              questions:
                  'What are the plans available under the Swarna Sakthi?',
              pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context,
              questions: 'What are the plan options?', pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context,
              questions: 'What are the benefits of the scheme?',
              pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context,
              questions:
                  'What are the plans available under the Swarna Sakthi?',
              pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context,
              questions: 'What are the plan options?', pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context,
              questions: 'What are the benefits of the scheme?',
              pathSVG: 'plus.svg'),
        ],
      ),
    );
  }
}

Widget faqtexts(context, {required String questions, required String pathSVG}) {
  return Row(
    children: [
      Container(
          width: MediaQuery.sizeOf(context).width / 1.5,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 10),
            child: Text(questions, style: texts, maxLines: 2),
          )),
      const Spacer(),
      ImgPathSvg(pathSVG),
    ],
  );
}
