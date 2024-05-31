import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'Common_Button.dart';


Widget Plan_Card(context,{required String Img,required String planT}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: white1,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //IMAGE
       Padding(
         padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
         child: ImgPathSvg(Img),
       ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          width: MediaQuery.sizeOf(context).width/4,
            child: Text(planT,style: planST,maxLines: 2,textAlign: TextAlign.center,)),
      ],
    ),
  );
}


//WALLET CARD
Widget Wallet_Card(context){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1,color: gradient2),
      color: white1,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text("Hi Vinoth Kumar",style: UserST,),
          Container(
            width: 60,
            margin: EdgeInsets.only(top: 15,bottom: 15),
            child: Divider(
              thickness: 2,
              color: gradient2,
            ),
          ),
          Text('Gold balance - 0.0000 gms',style: gramST,),

          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:MediaQuery.sizeOf(context).width/2,
                  child: CommonContainerButton(context,
                      onPress: () {}, titleName: 'View my Wallet'),
                ),
                const Spacer(),
                ImgPathSvg('wallet.svg'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget New_SSP_Images (context,{required String image}){
  return  Container(
    height: MediaQuery.sizeOf(context).height/4,
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image)),
    ),
  );
}

Widget New_SSP_Image_Content ({required String text,required String heading, required bool isHeadingneeded}){
  return Container(
    color: red3,
    child: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isHeadingneeded == true? Text(heading,style: Gramage,):Container(),
          Text(text,style: Content1,),
          
          Column(
            children: [

            ],
          )
        ],
      ),
    ),
  );
}