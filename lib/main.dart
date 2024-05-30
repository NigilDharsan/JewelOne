import 'package:flutter/material.dart';
import 'package:jewelone/Src/Advance_Payment_Ui/Advance_Payment_Screen.dart';
import 'package:jewelone/Src/Emi_Payment_Ui/Emi_Plan1_Screen.dart';
import 'package:jewelone/Src/FAQ_Ui/Contact_Us_Screen.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/My_SSP_Ui/My_SSP_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Plan1_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Screen.dart';
import 'Src/Create_Account_Ui/Create_Account_Screen.dart';
import 'Src/Create_New_Password_Ui/Create_Password_Screen.dart';
import 'Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'Src/Login_Ui/ForgotPassword.dart';
import 'Src/Login_Ui/LoginScreen.dart';
import 'Src/Verify_OTP_Ui/Verify_OTP_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  New_SSP_Plan1_Screen(),
    );
  }
}


