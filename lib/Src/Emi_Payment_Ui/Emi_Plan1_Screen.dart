import 'package:flutter/material.dart';
class Emi_Plan1_Screen extends StatefulWidget {
  const Emi_Plan1_Screen({super.key});

  @override
  State<Emi_Plan1_Screen> createState() => _Emi_Plan1_ScreenState();
}

class _Emi_Plan1_ScreenState extends State<Emi_Plan1_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/background_img.png'), // Change to your SVG image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
