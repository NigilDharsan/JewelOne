import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/My_SSP_Ui/My_SSP_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class paymrnt_History_Screen extends StatefulWidget {
  const paymrnt_History_Screen({super.key});

  @override
  State<paymrnt_History_Screen> createState() => _paymrnt_History_ScreenState();
}

class _paymrnt_History_ScreenState extends State<paymrnt_History_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Payment History', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50),
        child: Container(
          child: Column(
            children: [
               const SizedBox(height: 20,),
              //LIST VIEW BUILDER
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount:10,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom : 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: white1,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Plan 1',style: Goldweight,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: ImgPathSvg('Greenright.svg'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Text('₹5,000',style: UserST,),
                                          ),
                                          Container(
                                            //width: MediaQuery.sizeOf(context).width/8,
                                            decoration: BoxDecoration(
                                                color: grey5,
                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5,right: 5),
                                              child: Center(child: Text('Success',style: success,)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text('Gold Rate : ₹6535.00 g',style: planST,),
                                  ],
                                ),
                                const Spacer(),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('SS/2425JO/000198',style: rate2,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [

                                          Text('21 Dec 23',style: planST,),
                                          Container(
                                            //width: MediaQuery.sizeOf(context).width/8,
                                            decoration: BoxDecoration(
                                                color: grey5,
                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15,right: 15),
                                              child: Center(child: Text('UPI',style: planST,)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text('Gold Weight : 0.153 g',style: planST,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),

              //HELP CONTAINER
              HelpContainer(context, Color: grey5),

              //BUTTON
              CommonContainerButton(context, onPress: (){
                Navigator.pop(context);
              },
                  titleName: "Back"),
            ],
          ),
        ),
      ),
    );
  }
}
