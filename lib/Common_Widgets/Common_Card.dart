import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/Wallet_Ui/Wallet_Screen.dart';
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
Widget Wallet_Card(context,{required String customername}){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1,color: gradient2),
      color: white1,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 24,right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(customername,style: UserST,),
              Container(
                width: 60,
                margin: EdgeInsets.only(top: 15,bottom: 15),
                child: Divider(
                  thickness: 2,
                  color: gradient2,
                ),
              ),
              Text('Gold balance - 0.0000 gms',style: gramST,),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20),
                width:MediaQuery.sizeOf(context).width/2.5,
                child: CommonContainerButton2(context,
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallet_screen()));
                    }, titleName: 'View my Wallet'),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 92),
                child: ImgPathSvg('wallet.svg'),
              ),
            ],
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