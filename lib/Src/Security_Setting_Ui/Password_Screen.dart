import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Password_Screen extends StatefulWidget {
  const Password_Screen({super.key});

  @override
  State<Password_Screen> createState() => _Password_ScreenState();
}

class _Password_ScreenState extends State<Password_Screen> {

  bool _CurrentobscurePassword = true;
  bool _newobscurePassword = true;
  bool _confirmobscurePassword = true;

  TextEditingController _currentpassword = TextEditingController();
  TextEditingController _newpassword = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  RegExp passwordSpecial = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).*$');
  RegExp passwordLength = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).{8,15}$');

  final _formKey = GlobalKey<FormState>();

  //PASSWORD VISIBILITY FUNCTION
  void _togglePasswordVisibility() {
    setState(() {
      _CurrentobscurePassword = !_CurrentobscurePassword;
    });
  }
  void _togglePasswordVisibility1() {
    setState(() {
      _newobscurePassword = !_newobscurePassword;

    });
  }
  void _togglePasswordVisibility2() {
    setState(() {
      _confirmobscurePassword = !_confirmobscurePassword;


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: white2,
       body: Padding(
         padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
         child: Form(
           key:  _formKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 10,bottom: 10),
                 child: Text('Change your Password?',style: password,),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 10),
                 child: Container(
                   width: MediaQuery.sizeOf(context).width/1.1,
                     child: Text('You’ve had the same password for a long time. Try to change it every 6 months to keep your account secure.',
                       style: lighttext,
                       maxLines: 3,
                     ),
                 ),
               ),
               
               H_texts(text: 'Current password'),
               textFieldPasswordechange(
                 Controller: _currentpassword,
                 obscure: _CurrentobscurePassword,
                 onPressed: _togglePasswordVisibility,
                 hintText: "Enter current password",
                 keyboardtype: TextInputType.text,
                 validating:
                     (value) {
                   if (value!.isEmpty) {
                     return 'Please Enter a Password';
                   } else if (!passwordSpecial.hasMatch(value)) {
                     return 'Password should be with the combination of Aa@#1';
                   }else if(!passwordLength.hasMatch(value)){
                     return "Password should be with minimum 8 and maximum 15 characters";
                   }
                   return null;
                 },
               ),

               H_texts(text: 'New password'),
               textFieldPasswordechange(
                 Controller: _newpassword,
                 obscure: _newobscurePassword,
                 onPressed: _togglePasswordVisibility1,
                 hintText: "Enter new password",
                 keyboardtype: TextInputType.text,
                 validating:
                     (value) {
                   if (value!.isEmpty) {
                     return 'Please Enter a New Password';
                   } else if (!passwordSpecial.hasMatch(value)) {
                     return 'Password should be with the combination of Aa@#1';
                   }else if(!passwordLength.hasMatch(value)){
                     return "Password should be with minimum 8 and maximum 15 characters";
                   }
                   return null;
                 },
               ),

               H_texts(text: 'Confirm new password'),
               textFieldPasswordechange(
                 Controller: _confirmpassword,
                 obscure: _confirmobscurePassword,
                 onPressed: _togglePasswordVisibility2,
                 hintText: "Enter new password again",
                 keyboardtype: TextInputType.text,
                 validating:
                     (value) {
                   if (value!.isEmpty) {
                     return 'Please Confirm a New Password';
                   } else if (_newpassword.text != _confirmpassword.text) {
                     return 'Password Does not match';
                   }
                   return null;
                 },
               ),

               const Spacer(),

               CommonContainerButton(context,
                   onPress: () {
                     if(_formKey.currentState!.validate()){
                       //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                     }
                   }, titleName: 'Proceed'),
             ],
           ),
         ),
       ),
    );
  }
}
Widget H_texts ({required String text}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Text(text,style: password2,),
  );
}
