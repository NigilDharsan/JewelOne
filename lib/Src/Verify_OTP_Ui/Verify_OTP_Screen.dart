import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/Create_New_Password_Ui/Create_Password_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Verify_OTP_Screen extends StatefulWidget {
  const Verify_OTP_Screen({super.key});

  @override
  State<Verify_OTP_Screen> createState() => _Verify_OTP_ScreenState();
}

class _Verify_OTP_ScreenState extends State<Verify_OTP_Screen> {

  int _timeLeft = 30; // Timer duration in seconds
  bool _isTimerActive = false;
  // Timer callback function
  void _tick() {
    if (_timeLeft == 0) {
      setState(() {
        _isTimerActive = false;
      });
    } else {
      setState(() {
        _timeLeft--;
      });
    }
  }

  // Start the timer
  void _startTimer() {
    setState(() {
      _timeLeft = 30;
      _isTimerActive = true;
    });

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_isTimerActive) {
        _tick();
      } else {
        timer.cancel();
      }
    });
  }

  String _formatNumber(String number) {
    if (number.length < 6) {
      return number;
    }
    String formattedNumber = number.substring(0, 6);
    for (int i = 6; i < number.length; i++) {
      formattedNumber += 'x';
    }
    return formattedNumber;
  }

  // var controllers;
  var output;
  TextEditingController _OTP1 = TextEditingController();
  TextEditingController _OTP2 = TextEditingController();
  TextEditingController _OTP3 = TextEditingController();
  TextEditingController _OTP4 = TextEditingController();
  TextEditingController _OTP5 = TextEditingController();
  TextEditingController _OTP6 = TextEditingController();

  Widget _textFieldOTP({bool? first, bool? last, controllers}) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white2,
      ),

      // margin: EdgeInsets.only(left: 10),
      child: TextField(
        controller: controllers,
        autofocus: true,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } if (value.length == 0) {
            setState(() {
              FocusScope.of(context).previousFocus();
            });
          }
        },
        showCursor: true,
        textAlign: TextAlign.center,
        // style: OtpTextfield_Style,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: white2),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: white2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }


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


        Center(child: Text('Verify OTP',style: Heading_Style1,)),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 20),
          child: Center(child: Text('The OTP was sent to your registered number',style: Sub_TextStyle,)),
        ),



        Container(
          // color: Colors.green,
          margin: EdgeInsets.only(bottom: 40),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textFieldOTP(first: true, last: true, controllers: _OTP1),
              _textFieldOTP(first: true, last: true, controllers: _OTP2),
              _textFieldOTP(first: true, last: true, controllers: _OTP3),
              _textFieldOTP(first: true, last: true, controllers: _OTP4),
              _textFieldOTP(first: true, last: true, controllers: _OTP5),
              _textFieldOTP(first: true, last: true, controllers: _OTP6),
            ],
          ),
        ),


        // BUTTON
        CommonContainerButton(context,
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Create_Password_Screen()));
            }, titleName: 'Continue'),

        const SizedBox(height: 15),

        // Don't have an account? Sign Up Now Text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don’t receive the OTP? ',style: Sub_TextStyle,),
            InkWell(
              onTap: () {
                // Implement sign up action
              },
              child: InkWell(
                onTap: (){
                  _startTimer();
                },
                child: Text(
                  'Resend',
                  style: Sub_TextStyleBT,
                ),
              ),
            ),
          ],
        ),

        Container(
          alignment: Alignment.center,
          child: Text(
              _isTimerActive? "00:$_timeLeft":
              "",
              // style: changeT,
              style:TextStyle(color: red1)
          ),
        ),

      ],
    );
  }
}
