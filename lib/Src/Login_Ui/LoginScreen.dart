import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/Create_Account_Ui/Create_Account_Screen.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/Src/Login_Ui/ForgotPassword.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool _obscurePassword = true;
  bool _isChecked = false;// Initially hide the password

  //PASSWORD VISIBILITY FUNCTION
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
  final _formKey = GlobalKey<FormState>();

  RegExp passwordSpecial = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).*$');
  RegExp passwordLength = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).{8,15}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: _MainBody(),

            ),
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
        // Your image goes here
        const SizedBox(
          height: 50,
        ),
        //SKIP
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //SKIP
              Text(
                'Skip Login',
                style: skip_ST,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: BlackNormal,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        //LOGO
        Center(child: Container(
          height: MediaQuery.sizeOf(context).width/3.5,
            child: ImgPathPng("logo.png"))),
        const SizedBox(
          height: 50,
        ),

        //MOBILE NUMBER
        Heading_Text(context, Title: "Welcome Back!"),



        // Phone Number Text and TextField
        Title_Style(Title: 'Phone Number', isStatus: null),
        textFormField(
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
            }, prefixIcon: Icon(Icons.phone_android_sharp)),


        // Password Text and TextField
        // Phone Number Text and TextField
        Title_Style(Title: 'Password', isStatus: null),
        textFieldPassword(
          Controller: _password,
          obscure: _obscurePassword,
          onPressed: _togglePasswordVisibility,
          hintText: "Password",
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

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckBoxes(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    setState(() => _isChecked = !_isChecked);
                  });
                },
                onTap: (){},
                checkBoxText: 'Remember me'),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot_Password_Screen()));
              },
              child: Text(
                'Forgot Password?',
                style: BlackTextColorLowSize,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Login Button with Gradient
        CommonContainerButton(context,
            onPress: () {
              if(_formKey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
              }
            }, titleName: 'Login'),
        SizedBox(height: 16),

        // Don't have an account? Sign Up Now Text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don’t have an account? ',style: Sub_TextStyle,),
            InkWell(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Create_Account_Screen()));

              },
              child: Text(
                'Sign Up Now',
                style: Sub_TextStyleBT,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),

        // Trouble Logging in? Please call: Text
        Center(
            child: Text(
              'Trouble Logging in? Please call:',
              style: BlackTextColor,
            )),
        SizedBox(height: 16),

        // Icon and Trouble Logging in? Please call: Text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.call),
            ImgPathSvg('Call.svg'),
            SizedBox(width: 8),
            Text('18001033916',style: phone_ST,),
          ],
        ),
      ],
    );
  }
}