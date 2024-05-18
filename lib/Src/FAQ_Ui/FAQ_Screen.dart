import 'package:flutter/material.dart';
import 'package:jewelone/utilits/Common_Colors.dart';

import '../../Common_Widgets/Image_Path.dart';
import '../../utilits/Text_Style.dart';
class Faq_Screen extends StatefulWidget {
  const Faq_Screen({super.key});

  @override
  State<Faq_Screen> createState() => _Faq_ScreenState();
}

class _Faq_ScreenState extends State<Faq_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 20,right:20),
        child: _mainbody(),
      ),
    );
  }

  Widget _mainbody (){
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 20,right:20),
      child: Column(
        children: [

          //FAQ QUESTIONS
          faqtexts(context, questions: 'Do you have gold investment plan?', pathSVG: 'minus.svg'),
          faqtexts(context, questions: 'We have a purchase plan called Swarna Sakthi. Which benefits you to buy jewellery', pathSVG: 'null'),
          Divider(),
          faqtexts(context, questions: 'What are the plans available under the Swarna Sakthi?', pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context, questions: 'What are the plan options?', pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context, questions: 'What are the benefits of the scheme?', pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context, questions: 'What are the plans available under the Swarna Sakthi?', pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context, questions: 'What are the plan options?', pathSVG: 'plus.svg'),
          Divider(),
          faqtexts(context, questions: 'What are the benefits of the scheme?', pathSVG: 'plus.svg'),
        ],
      ),
    );
  }
}

Widget faqtexts (context,{required String questions,required String pathSVG}){
  return Row(
    children: [
      Container(
          width: MediaQuery.sizeOf(context).width/1.3,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15,top: 10),
            child: Text(questions,style: texts,maxLines: 2),
          )),
      const Spacer(),
      ImgPathSvg(pathSVG),
    ],
  );
}
