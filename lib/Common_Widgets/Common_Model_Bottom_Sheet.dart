import 'package:flutter/material.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

import 'Common_Button.dart';


//TOTAL AMOUNT
Widget Total_Amount_Bottom_Sheet(context,{required void Function()? onPress}){
  return  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white1
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //CLOSE
          Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close))),
          //TOTAL AMMOUNT
          Text('Total Amount',style: TBlack,),
          //TRANSACTION FOR
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Text('Here is the amount breakup of your transaction for 9944x xxxxx',style: Textfield_Style2,),
          ),
          //TOTAL AMOUNT
          Total_Amount(Amount: '5,00,000'),
          //BUTTON
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: CommonContainerButton(context, onPress: onPress, titleName: "Proceed to Pay"),
          )
        ],
      ),
    ),
  );
}

Widget Total_Amount ({required String Amount}){
  return Row(
    children: [
      Text('Total',style: Total_Plan_amount,),
      const Spacer(),
      Text(Amount,style: Total_Plan_amount,)
    ],
  );
}