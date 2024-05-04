import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background SVG i
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/background_img.png'), // Change to your SVG image path
                fit: BoxFit.cover,
              ),
            ),
            // Your other widgets go here
            child: Center(
              child: Text(
                'Hello, World!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
