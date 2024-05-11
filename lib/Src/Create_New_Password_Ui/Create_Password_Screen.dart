import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/Login_Ui/LoginScreen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Create_Password_Screen extends StatefulWidget {
  const Create_Password_Screen({super.key});

  @override
  State<Create_Password_Screen> createState() => _Create_Password_ScreenState();
}

class _Create_Password_ScreenState extends State<Create_Password_Screen> {

  String NewPassword = '';
  String ReEnterPassword = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController newPasword = TextEditingController();
  TextEditingController reEnterPassword = TextEditingController();



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

        Center(child: Text('Create your new password',style: Heading_Style1,)),


       const SizedBox(height: 20,),
        //ENTER NEW PASSWORD
        textFormField(
          hintText: 'Enter New Password',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: newPasword,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Valid ${'Password'}";
            }
            if (value == null) {
              return "Please Enter Valid ${'Password'}";
            }
            return null;
          },
          onChanged: (value){
            NewPassword= value;
          },
        ),
        const SizedBox(height: 10,),
        //Re-Enter New Password
        textFormField(
          hintText: 'Confirm Password',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: reEnterPassword,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Valid ${'Password'}";
            }
            if (value != NewPassword) {
              return "Password does not match with new password";
            }
            return null;
          },
          onChanged: (value){
            ReEnterPassword = value;
          },
        ),


        const SizedBox(height: 40,),
        // BUTTON
        CommonContainerButton(context,
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }, titleName: 'Save'),

      ],
    );
  }
}
