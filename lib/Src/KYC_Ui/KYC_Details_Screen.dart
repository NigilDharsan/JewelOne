import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class KYC_Details_Screen extends StatefulWidget {
  const KYC_Details_Screen({super.key});

  @override
  State<KYC_Details_Screen> createState() => _KYC_Details_ScreenState();
}

class _KYC_Details_ScreenState extends State<KYC_Details_Screen> {
  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');
  bool _Custom_icon = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name =TextEditingController();
  TextEditingController _phone =TextEditingController();
  TextEditingController _email =TextEditingController();
  TextEditingController _pincode =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Edit your KYC', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
          child: Container(
            child: Form(
              key:  _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  edittext(heading: 'KYC details', heading2: 'Edit KYC'),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: white1,
                      border: Border.all(width: 1,color: grey5),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //USER NAME
                          Container(
                          child: textField(
                            // isEnabled: false,
                            hintText: "Enter your name",
                            keyboardtype: TextInputType.text,
                            Controller: _name,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter],
                            validating: (value) {
                              if (value
                                  == null || value.isEmpty) {
                                return "Please Enter Name";
                              }
                              else if (!onlyText.hasMatch(value)) {
                                return "Please Enter User Name (Special Characters are Not Allowed)";
                              }
                              return null;
                            },
                            onChanged: null,
                          ),
                        ),

                          //MOBILE NUMBER
                          Container(
                            child: textField(
                              // isEnabled: false,
                              hintText: "Enter mobile number",
                              keyboardtype: TextInputType.text,
                              Controller: _phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.singleLineFormatter],
                              onChanged: null,
                              validating: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter a Phone Number';
                                } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                  return 'Please enter a valid 10-digit Phone Number';
                                }
                                return null;
                              },
                            ),
                          ),

                          //Email
                          Container(
                            child: textField(
                              // isEnabled: false,
                              hintText: "Enter your email",
                              keyboardtype: TextInputType.text,
                              Controller: _email,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter],
                              onChanged: null,
                              validating: (value){
                                if(value==null||value.isEmpty){
                                  return "Please Enter Email";
                                }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                                  return "Please Enter valid Email ";
                                }else{
                                  return null;
                                }
                              },
                            ),
                          ),

                          //PINCODE
                          Container(
                            child: textField(
                              // isEnabled: false,
                              hintText: "Pincode",
                              keyboardtype: TextInputType.text,
                              Controller: _pincode,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.singleLineFormatter],
                              onChanged: null,
                              validating: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter a Pincode';
                                } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                  return 'Please enter a valid 6-digit Phone Number';
                                }
                                return null;
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  edittext(heading: 'ID Prood', heading2: 'Edit ID Prood'),
                  Container(
                    //height: 200,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white1,
                      border: Border.all(width: 1,color: grey5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                      child: Column(
                        children: [
                          Upload_Container(heading: 'Aadhar card', onPress: () {  }),
                          Upload_Container(heading: 'Pan Card', onPress: () {  }),
                          Upload_Container(heading: 'Driving License', onPress: () {  }),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 50,),
                  //BUTTON
                  CommonContainerButton(context,
                      onPress: () {
                        if(_formKey.currentState!.validate())
                        {
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                        }
                      }, titleName: 'Save'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget Upload_Container ({required String heading,required void Function()? onPress}){
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: uploadborder,
          border: Border.all(width: 1,color: borderclr),
          borderRadius: BorderRadius.circular(10),
        ),
        child:
        Theme(
          data: ThemeData(dividerColor:Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.transparent,
            onExpansionChanged:(bool expanded){
              setState(() {
                _Custom_icon = expanded;
              });
            },
            title: Text(heading,style: skip_ST,),
            tilePadding: EdgeInsets.only(left: 30,right: 20),
            trailing:  _Custom_icon == true ? Icon(Icons.keyboard_arrow_down,color: gradient3,size: 30,) : Icon(Icons.arrow_forward_ios,color: gradient3,),
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white1,
                    // border: Border.all(width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30,top: 10),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height/5,
                      child: Column(
                        children: [
                          Divider(),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            child: Row(
                              children: [
                                ImgPathSvg('i.svg'),
                                const SizedBox(width: 10,),
                                Container(
                                    width: MediaQuery.sizeOf(context).width/1.7,
                                    child: Text('JPG, PNG, PDF and SVG files up to 5MB',style: skip_ST,maxLines: 2,)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              upload(context,onPress: () {

                              }, titleName: 'Upload'),
                              cancel(context,onPress: () {

                              }, titleName: 'Cancel'),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget edittext({required String heading,required String heading2}){
  return Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 20),
    child: Row(
      children: [
        Text(heading,style: TandC,),
        const Spacer(),
        Icon(Icons.edit,size: 20,),
        Text(heading2,style: phoneHT,),
      ],
    ),
  );
}
