import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Wallet_screen extends StatefulWidget {
  const Wallet_screen({super.key});

  @override
  State<Wallet_screen> createState() => _Wallet_screenState();
}

class _Wallet_screenState extends State<Wallet_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                color: white1,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text('Welcome to your Wallet!',style: WalletT1,),
                      ),

                      //WALLET
                      WalletContainer(context),
                    ],
                  ),
                )
            ),
          ),
          BottomContainers(context, text: 'Proceed to Buy Plan'),
          BottomContainers(context, text: 'Check Purchase History'),

          const Spacer(),

          Container(
            width: MediaQuery.sizeOf(context).width,
            color: pink6,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 15,bottom: 15),
              child: Row(
                children: [
                  ImgPathSvg('blackarrow.svg'),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Purchase History 0 gms',style: planST,),
                        Text('Total Price of Purchase: ₹0',style: walletT2,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget WalletContainer (context){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      color: pink6,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gold balance',style: WalletT,),
              Text('0.0000 gms',style: UserST,),
            ],
          ),

          const Spacer(),

          ImgPathSvg('walletimage.svg')
        ],
      ),
    ),
  );
}

Widget BottomContainers (context,{required String text}){
  return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,top: 10,),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: white1,
        border: Border.all(width: 1,color: grey5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Row(
          children: [
            Text(text,style: WalletT,),
            const Spacer(),
            ImgPathSvg('rightarrow2.svg')
          ],
        ),
      ),
    ),
  );
}
