import 'dart:convert';
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Model_Bottom_Sheet.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Src/Advance_Payment_Ui/Advance_Payment_Screen.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/Src/My_SSP_Ui/My_SSP_Screen.dart';
import 'package:jewelone/utilits/CashFreePayment.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/ConstantsApi.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'package:http/http.dart' as http;

class Online_Emi_Payment_Screen extends ConsumerStatefulWidget {
  Online_Emi_Payment_Screen({super.key,});

  @override
  ConsumerState<Online_Emi_Payment_Screen> createState() =>
      _Online_Emi_Payment_ScreenState();
}

class _Online_Emi_Payment_ScreenState extends ConsumerState<Online_Emi_Payment_Screen> {
  int? _groupValue = 1;
  int _count = 1;
  EmiOption? _selectedEmiOption;

  final String clientId = 'TEST1019783451b01da019e7d8e03edd43879101';
  final String clientSecret = '';
  final CFEnvironment environment = CFEnvironment.SANDBOX;

  List<EmiOption> emiOptions = [
    EmiOption(label: '3 months EMI', amount: 1000.0),
    EmiOption(label: '6 months EMI', amount: 500.0),
    EmiOption(label: '12 months EMI', amount: 250.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(
        isNav: true,
        isTwoLine: false,
        title1: 'EMI payment',
        title2: '',
        actionLogo: 'home.svg',
        isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home_DashBoard_Screen()));
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      ImgPathSvg('calendar2.svg'),
                      const SizedBox(width: 10),
                      Text('2 Plan Active', style: rate2),
                      //PLAN TEXT
                    ],
                  ),
                ),
                Container(child: Plan_List()),
                const SizedBox(height: 35),
                HelpContainer(context, Color: pink4),
                const SizedBox(height: 10),
                Total(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: CommonContainerButton(
                    context,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Total_Amount_Bottom_Sheet(
                            context,
                            onPress: () async {
                              await initiatePay(orderId: '', paymentSessionId: '');
                            },
                          );
                        },
                      );
                    },
                    titleName: "Continue",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Plan_List() {
    return ListView.builder(
      itemCount: emiOptions.length,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final emiOption = emiOptions[index];
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: white1,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EasyRadio(
                      value: emiOption,
                      groupValue: _selectedEmiOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedEmiOption = value;
                        });
                      },
                      dotRadius: 5.0,
                      radius: 10.0,
                      activeBorderColor: gradient1,
                      dotColor: white1,
                      inactiveBorderColor: Colors.grey,
                      inactiveFillColor: Colors.transparent,
                      activeFillColor: gradient1,
                      animateFillColor: true,
                      dotStyle: DotStyle.circle(),
                      shape: RadioShape.circle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Text('Plan 1', style: Plan_Style),
                    ),
                    const Spacer(),
                    Text("INR ₹5000", style: rate2),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 40),
                  width: MediaQuery.sizeOf(context).width / 1.8,
                  child: Text(
                    'Gold Ornaments Purchase Advance Scheme',
                    style: planST,
                    maxLines: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width / 3.5,
                            child: Text('Equivalent Weight : ', style: planST),
                          ),
                          Text('0.794 gm', style: Goldweight),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        color: white2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            color: white3,
                            child: InkWell(
                              onTap: () {
                                _incrementCounter();
                              },
                              child: Center(child: Icon(Icons.add)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Center(child: Text('${_count}')),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            color: white3,
                            child: InkWell(
                              onTap: () {
                                _decrementCounter();
                              },
                              child: Center(child: Text('-', style: TextStyle(fontSize: 20))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> createOrder() async {
    final String url = 'https://sandbox.cashfree.com/pg/orders';
    final Map<String, dynamic> body = {
      'order_amount': 10.10,
      'order_currency': 'INR',
      'customer_details': {
        'customer_id': 'USER123',
        'customer_name': 'joe',
        'customer_email': 'joe.s@cashfree.com',
        'customer_phone': '+919876543210',
      },
      'order_meta': {
        'return_url': 'https://your-return-url.com?order_id=order_123',
      },
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'X-Client-Id': clientId,
          'X-Client-Secret': clientSecret,
          'x-api-version': '2023-08-01',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String orderId = responseData['order_id'];
        final String paymentSessionId = responseData['payment_session_id'];
        await initiatePay(orderId: orderId, paymentSessionId: paymentSessionId);
      } else {
        print('Failed to create order. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      if (e is http.ClientException) {
        print('HTTP Client Exception: ${e.message}');
      } else {
        print('Exception: $e');
      }
    }
  }

  Future<void> initiatePay({required String orderId, required String paymentSessionId}) async {
    try {
      var session = CFSessionBuilder()
          .setEnvironment(environment)
          .setOrderId(orderId)
          .setPaymentSessionId(paymentSessionId)
          .build();

      var cfWebCheckout = CFWebCheckoutPaymentBuilder()
          .setSession(session)
          .build();

      var cfPaymentGateway = CFPaymentGatewayService();

      cfPaymentGateway.setCallback(
            (orderId) {
          print('Payment successful for Order ID: $orderId');
        },
            (error, orderId) {
          print('Payment error: ${error.getMessage()}');
        },
      );

      cfPaymentGateway.doPayment(cfWebCheckout);
    } catch (e) {
      if (e is CFException) {
        print('CFException: ${e.message}');
      } else {
        print('Exception: $e');
      }
    }
  }


  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }
}

class EmiOption {
  final String label;
  final double amount;

  EmiOption({required this.label, required this.amount});
}




