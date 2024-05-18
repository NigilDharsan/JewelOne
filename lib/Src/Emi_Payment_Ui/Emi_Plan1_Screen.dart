import 'package:flutter/material.dart';
import '../../Common_Widgets/Common_Button.dart';
import '../../Common_Widgets/Image_Path.dart';
import '../../utilits/Common_Colors.dart';
import '../../utilits/Text_Style.dart';

class Emi_Plan1_Screen extends StatefulWidget {
  const Emi_Plan1_Screen({super.key});
  @override
  State<Emi_Plan1_Screen> createState() => _Emi_Plan1_ScreenState();
}

class _Emi_Plan1_ScreenState extends State<Emi_Plan1_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        toolbarHeight: 100,
        leading: Icon(Icons.menu_outlined),
        centerTitle: true,
        title: Container(
          height: 70,width: 140,
          child: ImgPathPng('logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 15),
            child: InkWell(
                onTap: () {},
                child: ImgPathSvg("notification.svg")),
          ),
        ],
      ),
      body: _mianbody(),
    );
  }

  Widget _mianbody (){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          gradient1,
                          gradient2,
                        ]
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    child: plan1container(context)),


                Positioned(
                    top: 150,
                    left: 20,
                    right: 20,
                    child: gold_Rate(context)),
              ],
            ),
          ),

          //PAY NOW CONTAINE1
          Pay_now_container(context, text: '₹5,000', date: '21 Feb 2024', details: 'View Details >'),
          Pay_now_container2(context, text: 'Advance EMI', text2: 'Pay all EMIs'),

          //LIST VIEW BUILDER
          List_View_Builder(context ),
        ],
      ),
    );
  }
}

//PLAN 1 CONTAINER TEXTS
Widget Plan1_Texts (context){
  return Padding(
    padding: const EdgeInsets.only(left: 10,bottom: 10),
    child: Container(
      width: MediaQuery.sizeOf(context).width/3,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("Plan 1",style: plan1),
      Text('Gold Ornaments Purchase',textAlign: TextAlign.start,style: plantexts,),
            Text('Advance Scheme',style: plantexts,),
      Text('SS/2324JO/000475',style: plancode,),
      ],
      ),
    ),
  );
}

//YOUR GOLD SAVED CONTAINER TEXT
Widget Plan1_Texts2 (){
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Started On",style: plantexts),
        Text('21 Nov 2023',style: plancode,),
        Text('Tenure up to 11 months',style: plantexts,maxLines: 2,),
        Text('Benefit (VA) 18%',style: plancode,),
      ],
    ),
  );
}

//PLAN 1 CONTAINER
Widget plan1container (context){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
        color: white1,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1,color: gradient2)
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 8,),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImgPathSvg('Rupees.svg'),

            //PLAN1 CONTAINER
            Plan1_Texts(context),

            const Spacer(),

            //GOLDREATE CONTAINER
            Plan1_Texts2()
          ],
        ),
      ),
    ),
  );
}

//YOUR GOLD SAVED CONTAINER
Widget gold_Rate (context){
  return Container(
    height: 100,width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
        color: white1,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1,color: gradient2)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('YOUR GOLD SAVED',style: plantexts2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_upward),
            Text('1.85 g',style: rate,),
            const SizedBox(width: 10,),
            Text('in ₹10,000',style: rate2,)
          ],
        )
      ],
    ),
  );
}

//PAY NOW CONTAINER
Widget Pay_now_container (context,{required String text,required String date,required String details}){
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 10),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: gradient2),
          color: white1,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15,bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImgPathSvg('calendar.svg'),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,style: plan1,),
                Text(date,style: plantexts,),
                Text(details),
              ],
            ),

            Paynowcommonbutton1 (context,
                onPress: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                }, titleName: 'Pay Now')
          ],
        ),
      ),
    ),
  );
}

//PAY NOW CONTAINER 2
Widget Pay_now_container2 (context,{required String text,required String text2,}){
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 15,),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: gradient2),
          color: white1,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15,bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImgPathSvg('moneybank.svg'),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,style: plan1,),
                Text(text2,style: plantexts,),
              ],
            ),

            Paynowcommonbutton2 (context,
                onPress: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                }, titleName: 'Pay Now')
          ],
        ),
      ),
    ),
  );
}

//LIST VIEW BUILDER
Widget List_View_Builder (context){
  return Container(
    height: MediaQuery.sizeOf(context).height,
    child: ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: white1,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: grey5)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImgPathSvg('calendar.svg'),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text('₹5,000',style: plan1,),
                  ),
                  Text('21 May 2024',style: plantexts,)
                ],
              ),
            ),
          ),
        );
      },),
  );
}

