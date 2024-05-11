import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/Verify_OTP_Ui/Verify_OTP_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Forgot_Password_Screen extends StatefulWidget {
  const Forgot_Password_Screen({super.key});

  @override
  State<Forgot_Password_Screen> createState() => _Forgot_Password_ScreenState();
}

class _Forgot_Password_ScreenState extends State<Forgot_Password_Screen> {
  TextEditingController _phoneNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: _MainBody(),

          ),
        ),
      ),
    );
  }

  Widget _MainBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ImgPathSvg('back.svg'),
        ),

        //LOGO
        Center(child: ImgPathSvg("logo.svg")),
        const SizedBox(
          height: 50,
        ),

        Center(child: Text('Forgot Your Password?',style: Heading_Style1,)),



        Padding(
          padding: const EdgeInsets.only(top: 25,bottom: 40),
          child: textFormField(
            // isEnabled: false,
              hintText: "Phone Number",
              keyboardtype: TextInputType.phone,
              Controller: _phoneNumber,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: null,
              validating: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Phone Number';
                } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                  return 'Please enter a valid 10-digit Phone Number';
                }
                return null;
              }, prefixIcon: Icon(Icons.phone_android_sharp,color: grey1,)),
        ),


        // BUTTON
        CommonContainerButton(context,
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify_OTP_Screen()));
            }, titleName: 'Get OTP'),

      ],
    );
  }
}
