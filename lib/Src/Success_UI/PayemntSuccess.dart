import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';

class PaymentSuccess extends StatefulWidget {
  bool? isPaymentSuccess;
  String? paymentStatusMsg;

  PaymentSuccess(
      {Key? key,
      required this.isPaymentSuccess,
      required this.paymentStatusMsg})
      : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  void _delayedFunction(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    _delayedFunction(context); // Call the function with a delay
    Color themeColor = widget.isPaymentSuccess == true ? gradient2 : Colors.red;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: ImgPathPng("card.png"),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              widget.isPaymentSuccess == true ? "Thank You!" : "Failed",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              widget.isPaymentSuccess == true
                  ? widget.paymentStatusMsg ?? ""
                  : widget.paymentStatusMsg ?? "",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            widget.isPaymentSuccess == true
                ? Text(
                    "You will be redirected to the home page shortly\nor click here to return to home page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                : Container(),
            SizedBox(height: screenHeight * 0.06),
          ],
        ),
      ),
    );
  }
}
