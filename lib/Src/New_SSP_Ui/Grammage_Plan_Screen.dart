import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Model_Bottom_Sheet.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Grammage_Plan_Screen extends StatefulWidget {
  const Grammage_Plan_Screen({super.key});

  @override
  State<Grammage_Plan_Screen> createState() => _Grammage_Plan_ScreenState();
}

class _Grammage_Plan_ScreenState extends State<Grammage_Plan_Screen> {
  bool? isCheked  = false;

  //LOCATION
  String? locationval;
  List<String> locationOption = [
  "Coimbatore",
  "Chennai",
    "Madurai",
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Buy Gold', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 30),
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width/1.5,
                    child: Text('Swarna Sakthi Plan ID (Grammage Plan)',style: Heading_Style1,)),

                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: white1,
                      border: Border.all(width: 1,color: grey5),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text('Mr. Vinoth Kumar',style: GPlanT,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Enter Custom name for your plan',style: radioST,),
                          ),
                          SSPtextFormField(hintText: "Eg: Your Daughter's name: “Meena”", keyboardtype: TextInputType.text),
                        ],
                      ),
                    ),
                  ),
                ),

                //ENTER MONTHLY EMI
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: white1,
                      border: Border.all(width: 1,color: grey5),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                      child: Row(
                        children: [
                          Text('Enter Monthly EMA',style: radioST,),

                          const Spacer(),

                          Container(
                            width: MediaQuery.sizeOf(context).width/3,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Font_Primary_Color),
                              borderRadius: BorderRadius.circular(10),
                              color: white1
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(child: Text('5000',style: lighttext,)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //SELECT LOCATION
                dropDownField(
                  context,
                  value: locationval,
                  listValue: locationOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      locationval = newValue;
                    });
                  }, hintT: 'Select Branch  '
                ),

                //INFO
                Padding(
                  padding: const EdgeInsets.only(left: 7,bottom: 5,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImgPathSvg('info2.svg'),
                      Text('Tenure for the scheme completion is 11 month’s',style: radioST,)
                    ],
                  ),
                ),

                //CHECK BOX
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: isCheked,
                        activeColor: Font_Primary_Color,
                        onChanged: (newvalue){
                      setState(() {
                        isCheked = newvalue;
                      });
                    }
                    ),
                    Text('I agree with terms & conditions',style: radioST,),
                  ],
                ),

                const Spacer(),

                CommonContainerButton(context,
                    onPress: () {
                   {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify_OTP_Screen()));
                      }
                    }, titleName: 'Proceed to Buy'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
