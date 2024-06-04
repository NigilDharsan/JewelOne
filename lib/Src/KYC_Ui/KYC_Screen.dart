import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/Verify_OTP_Ui/Verify_OTP_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class KYC_Screen extends StatefulWidget {
  const KYC_Screen({super.key});

  @override
  State<KYC_Screen> createState() => _KYC_ScreenState();
}

class _KYC_ScreenState extends State<KYC_Screen> {

  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');
  final _formkey = GlobalKey<FormState>();

  TextEditingController _Name = TextEditingController();
  TextEditingController _MobileNumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _Pincode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Personal Information',style: Heading_Style1,),
              Text('Please provide your accurate information',style: lighttext,),

              //FULL NAME
              Title_Style(Title: 'Full name', isStatus: null,),
              textFormField(hintText: '',
                keyboardtype: TextInputType.text,
                Controller: _Name,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                  FilteringTextInputFormatter.singleLineFormatter],
                validating: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Name";
                  }
                  else if (!onlyText.hasMatch(value)) {
                    return "Please Enter Your Name (Special Characters are Not Allowed)";
                  }
                  return null;
                },
                onChanged: null,
              ),

              //MOBILE NUMBER
              Title_Style(Title: 'Mobile Number', isStatus: null,),
              textFormField(
                // isEnabled: false,
                  hintText: "",
                  keyboardtype: TextInputType.phone,
                  Controller: _MobileNumber,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly],
                  onChanged: null,
                  validating:(value){
                    if (value!.isEmpty) {
                      return 'Please enter a mobile number';
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit mobile number';
                    }
                    return null;
                  }
              ),

              //EMAIL
              Title_Style(Title: 'Email', isStatus: null,),
              textFormField(hintText: '',
                keyboardtype: TextInputType.text,
                Controller: _email,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter],
                onChanged: null,
                validating: (value){
                  if(value==null||value.isEmpty){
                    return "Enter Email your Email";
                  }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                    return "Please Enter valid Email ";
                  }else{
                    return null;
                  }
                },
              ),

              //PINCODE
              Title_Style(Title: 'Pincode', isStatus: null,),
              textFormField(
                // isEnabled: false,
                  hintText: "",
                  keyboardtype: TextInputType.number,
                  Controller: _Pincode,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly],
                validating: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Pincode";
                  }
                  else if (value == null) {
                    return "Please Enter a valid 6-digits Pincode";
                  }
                  return null;
                },
                onChanged: null,
              ),

              const Spacer(),

              //BUTTON
              CommonContainerButton(context,
                  onPress: () {
                    {
                      if(_formkey.currentState!.validate());
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify_OTP_Screen()));
                    }
                  }, titleName: 'Continue'),
            ],
          ),
        ),
      ),
    );
  }
}
