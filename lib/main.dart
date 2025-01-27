import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/utilits/Landing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Src/Login_Ui/LoginScreen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Base design size (width x height)
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            "/": (context) => Landing(),
            "/login": (context) => LoginScreen(),
            "/home": (context) => Home_DashBoard_Screen(),
          },
          onGenerateRoute: (value) {
            return MaterialPageRoute(builder: (context) => LoginScreen());
          },
        );
      },
    );
  }
}
