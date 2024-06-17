import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Model_Bottom_Sheet.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/My_SSP_Ui/My_SSP_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Online_Emi_Payment_Screen extends StatefulWidget {
  const Online_Emi_Payment_Screen({super.key});

  @override
  State<Online_Emi_Payment_Screen> createState() =>
      _Online_Emi_Payment_ScreenState();
}

class _Online_Emi_Payment_ScreenState extends State<Online_Emi_Payment_Screen> {
  int? _groupValue = 1;
  int _count = 1;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  List<EmiOption> emiOptions = [
    EmiOption(label: '3 months EMI', amount: 1000.0),
    EmiOption(label: '6 months EMI', amount: 500.0),
    EmiOption(label: '12 months EMI', amount: 250.0),
  ];

  EmiOption? _selectedEmiOption;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(
          isNav: true,
          isTwoLine: false,
          title1: 'EMI payment',
          title2: "",
          actionLogo: null,
          isWhite: false,
          ActiononTap: null),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //ACTIVE PLAN
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                 // child: Plan_Active(),
                ),
                //LIST OF PLAN
                Container(
                  child:Plan_List(),
                ),
                const SizedBox(height: 35,),

                //HELP CONTAINER
                HelpContainer(context, Color: pink4),

                const SizedBox(height: 10,),

                //TOTAL AMOUNT
                //Total_Plan_amount(amount: '5,000.00'),

                //BUTTON
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 50),
                  child: CommonContainerButton(context, onPress: (){
                    showModalBottomSheet(context: context, builder:(BuildContext context){
                      return
                        Total_Amount_Bottom_Sheet(context, onPress: () {  });
                    });
                  },
                      titleName: "Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//LIST OF PLANT
  Plan_List(){
    return ListView.builder(
      itemCount: emiOptions.length,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final emiOption = emiOptions[index];
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: white1
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                //PLAN RADIO BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //RADIO BUTTON
                    EasyRadio (
                      value: emiOption,
                      groupValue: _selectedEmiOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedEmiOption = value;
                        });
                      },
                      dotRadius: 5.0,
                      radius: 10.0,
                      activeBorderColor: gradient1,
                      dotColor: white1,
                      inactiveBorderColor: Colors.grey,
                      inactiveFillColor: Colors.transparent,
                      activeFillColor: gradient1,
                      animateFillColor: true,
                      dotStyle: DotStyle.circle(),
                      shape: RadioShape.circle(),
                    ),
                    //PLAN
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 5),
                      child: Text('Plan 1',style: Plan_Style,),
                    ),
                    const Spacer(),

                    //AMOUNT
                    Text("INR ₹5000",style: rate2,)

                  ],
                ),

                //GOLD PLAN DESCRIPTION
                Container(
                    margin: EdgeInsets.only(bottom: 10,left: 40),
                    width: MediaQuery.sizeOf(context).width/1.8,
                    child: Text('Gold Ornaments Purchase Advance Scheme',style: planST,maxLines: 2,)),

                //GOLD WEIGHT
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //WEIGHT OF GOLD
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text('Equivalent Weight : ',style: planST,),
                          Text('0.794 gm',style: Goldweight,)
                        ],
                      ),
                    ),
                    const Spacer(),
                    //INCREMENT OF EMI
                    Container(
                      height: 30,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        color: white2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //INCREMENT
                          Container(
                            height: 30,width: 30,
                            color: white3,
                            child: InkWell(
                                onTap: () {
                                  _incrementCounter();
                                },
                                child: Center(child: Icon(Icons.add))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Center(child: Text('${_count}')),
                          ),
                          Container(
                            height: 30,width: 30,
                            color: white3,
                            child: InkWell(
                                onTap: () {
                                  _decrementCounter();

                                },
                                child: Center(child: Text('-',style: TextStyle(fontSize: 20),))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },);
  }
}


class EmiOption {
  final String label;
  final double amount;

  EmiOption({required this.label, required this.amount});
}





