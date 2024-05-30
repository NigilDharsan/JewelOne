import 'package:flutter/material.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class New_SSP_Plan1_Screen extends StatefulWidget {
  const New_SSP_Plan1_Screen({super.key});

  @override
  State<New_SSP_Plan1_Screen> createState() => _New_SSP_Plan1_ScreenState();
}

class _New_SSP_Plan1_ScreenState extends State<New_SSP_Plan1_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        children: [
          Container(
           height: MediaQuery.sizeOf(context).height/3.5,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage('lib/assets/New_SSP_Plan1_Image.png')),
            ),
          ),
          Container(
            color: red3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Grammage Accumulation',style: Gramage,),
                  Text('A customer can select any Jewellery design '
                      'of Her/His choice and place an order. Customer can pay the estimated '
                      'order value in installments at regular monthly basis as per His/Her '
                      'convenience. On or before the end of every month, as 11 Equated Monthly '
                      'Advance (EMA).',style: Content1,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
