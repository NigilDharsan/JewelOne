import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'package:http/http.dart' as http;

class Online_Emi_Payment_Screen extends ConsumerStatefulWidget {
  Online_Emi_Payment_Screen({super.key,});

  @override
  ConsumerState<Online_Emi_Payment_Screen> createState() =>
      _Online_Emi_Payment_ScreenState();
}

class _Online_Emi_Payment_ScreenState extends ConsumerState<Online_Emi_Payment_Screen> {
  // int? _groupValue = 1;
  int _count = 1;
  num totalAmount = 0;
   EmiOption? _selectedEmiOption;
  void _calculateTotalAmount() {
    if (_isCheckedList != null) {
      totalAmount = _selectedEmiOption!.amount * _selectedEmiOption!.count;
    } else {
      totalAmount = 0;
    }
  }


  final String clientId = 'TEST1019783451b01da019e7d8e03edd43879101';
  final String clientSecret = 'cfsk_ma_test_a563a0f0dac40e802b3592ecffbb4ad9_122e4d57';
  final CFEnvironment environment = CFEnvironment.SANDBOX;

  List<EmiOption> emiOptions = [
    EmiOption(label: '3 months EMI', amount: 1000.0, plannum: '1'),
    EmiOption(label: '6 months EMI', amount: 500.0, plannum: '2'),
    EmiOption(label: '12 months EMI', amount: 250.0, plannum: '3'),
  ];

  String phoneVal = '';
  String name = '';
  List<bool> _isCheckedList = List.generate(10, (index) => false);
  final _formKey = GlobalKey<FormState>();


  Future<void> getDetails() async{
    String phval = await getCustomer_phone();
    String maskedMobileNumber = phval!.replaceRange(6, 10, "xxxx");
    setState(() {
      phoneVal = maskedMobileNumber;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    final myplandata = ref.watch(MyplanProvider);
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
      body: myplandata.when(data: (data){
        return SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: Row(
                      children: [
                        ImgPathSvg('calendar2.svg'),
                        const SizedBox(width: 10),
                           Text('${data?.data?.length ?? 0} Plan Active', style: rate2)
                      ],
                    ),
                  ),
                  // Container(child: Plan_List()),
                      Container(
                        child: ListView.builder(
                          itemCount: data?.data?.length ?? 0,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            bool isChecked = _isCheckedList[index] ?? false;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: arrow, width: 2),
                                  color: white1,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, right: 15, top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        side: BorderSide(width: 1,color: checkbox),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isCheckedList[index] = value ?? false;
                                            if (isChecked) {
                                              // totalAmount = totalAmount - int.parse(data?.data?[index].enterAmount ?? "");
                                              data?.data?[index].enterAmount = "";

                                            }
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5, left: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.sizeOf(context).width / 2.8,
                                                child: Text(data?.data?[index].schemeName ?? "", style: planST)),
                                            const SizedBox(height: 5),
                                            Container(
                                                width: MediaQuery.sizeOf(context).width / 2.8,
                                                child: Text(data?.data?[index].accountName ?? "", style: planST)),
                                            const SizedBox(height: 5),
                                            Text("Min Amount : ${data?.data?[index].minimumPayable?.minAmount ?? ""}", style: planST),
                                            const SizedBox(height: 5),
                                            Text("Max Amount : ${data?.data?[index].maximumPayable?.maxAmount ?? ""}", style: planST),
                                            const SizedBox(height: 5),
                                            Text("Rate per gold : ${data?.data?[index].todaysRate ?? ''}", style: planST),
                                            const SizedBox(height: 5),
                                            Text("Equivalent weight : ${data?.data?[index].paidWeight ?? ''}", style: planST),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 18),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Container(
                                              width: 100,
                                              height: 35,
                                              child: TextFormField(
                                                // initialValue: data?.data?[index].enterAmount ?? "",
                                                keyboardType: TextInputType.number,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return '';
                                                  }
                                                  final intValue = int.tryParse(value);
                                                  if (intValue == null) {
                                                    return '';
                                                  }
                                                  if (intValue < 1000 || intValue > 10000) {
                                                    return '';
                                                  }
                                                  return null;
                                                },
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(5),
                                                  FilteringTextInputFormatter.digitsOnly
                                                ],
                                                textAlign: TextAlign.left,
                                                enabled: isChecked,
                                                decoration: InputDecoration(
                                                  hintText: "INR",
                                                  filled: true,
                                                  fillColor: Colors.grey[300],
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                                ),
                                                onChanged: (text) {
                                                  var amount = int.parse(text);
                                                  setState(() {
                                                    data?.data?[index].enterAmount  = "{$amount}";
                                                    data?.data?[index].limitType == 1 ? totalAmount = amount: amount > 1 ? totalAmount = 0:0 ;
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 100,
                                              height: 35,
                                              child: TextField(
                                                textAlign: TextAlign.left,
                                                enabled: isChecked,
                                                decoration: InputDecoration(
                                                  hintText: "Enter Gram",
                                                  filled: true,
                                                  fillColor: Colors.grey[300],
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              color: Colors.grey[300],
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    color: Colors.grey[500],
                                                    child: Icon(Icons.remove),
                                                  ),
                                                  Container(
                                                      width: 50,
                                                      child: Text("1", textAlign: TextAlign.center)),
                                                  Container(
                                                    color: Colors.grey[500],
                                                    child: Icon(Icons.add),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text('Discount : ${data?.data?[index].discountValue}', style: planST),
                                            Text('Net Amount : ${data?.data?[index].enterAmount ?? ""}', style: planST),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                    ),
                  const SizedBox(height: 35),
                  HelpContainer(context, Color: pink4),
                  const SizedBox(height: 10),
                  Total_Online(),
                  totalAmount ==0 ? SizedBox(height: 50) : Container(),
                  totalAmount == 0? Container(): Padding(
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
                                await createOrder();
                              }, totalAmount: "${totalAmount}", mobileNumber: '${phoneVal}',
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
      },
          error: (Object error, StackTrace stackTrace){
            return Text("ERRO");
          },
          loading: (){
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  // Widget Plan_List() {
  //   return ListView.builder(
  //     itemCount: emiOptions.length,
  //     scrollDirection: Axis.vertical,
  //     physics: const NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     itemBuilder: (BuildContext context, int index) {
  //       final emiOption = emiOptions[index];
  //       return Container(
  //         margin: EdgeInsets.only(bottom: 15),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(15),
  //           border: Border.all(color: arrow,width: 2),
  //           color: white1,
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 10, right: 20),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const SizedBox(height: 20),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   EasyRadio(
  //                     value: emiOption,
  //                     groupValue: _selectedEmiOption,
  //                     onChanged: (value) {
  //                       setState(() {
  //                         _selectedEmiOption = value;
  //                         _calculateTotalAmount(); // Recalculate total when selection changes
  //                       });
  //                     },
  //                     dotRadius: 5.0,
  //                     radius: 10.0,
  //                     activeBorderColor: gradient1,
  //                     dotColor: white1,
  //                     inactiveBorderColor: Colors.grey,
  //                     inactiveFillColor: Colors.transparent,
  //                     activeFillColor: gradient1,
  //                     animateFillColor: true,
  //                     dotStyle: DotStyle.circle(),
  //                     shape: RadioShape.circle(),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 20, right: 5),
  //                     child: Text('Plan ${emiOption.plannum}', style: Plan_Style),
  //                   ),
  //                   const Spacer(),
  //                   Text("INR ₹${emiOption.amount}", style: rate2),
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom: 10,),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Container(
  //                       margin: EdgeInsets.only(left: 40),
  //                       width: MediaQuery.sizeOf(context).width / 2.3,
  //                       child: Text(
  //                         'Gold Ornaments Purchase Advance Scheme',
  //                         style: planST,
  //                         maxLines: 2,
  //                       ),
  //                     ),
  //                     const Spacer(),
  //                     Text('Advance EMA',style: walletT2,)
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom:20),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 40),
  //                       child: Row(
  //                         children: [
  //                           Container(
  //                             width: MediaQuery.sizeOf(context).width / 3.6,
  //                             child: Text('Equivalent Weight : ', style: planST),
  //                           ),
  //                           Text('0.794 gm', style: Goldweight),
  //                         ],
  //                       ),
  //                     ),
  //                     const Spacer(),
  //                     Container(
  //                       height: 30,
  //                       alignment: Alignment.topLeft,
  //
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(5),
  //
  //                         color: white2,
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //
  //                           Container(
  //                             height: 30,
  //                             width: 30,
  //                             color: white3,
  //                             child: InkWell(
  //                               onTap: () {
  //                                 _decrementCounter(emiOption);
  //                               },
  //                               child: Center(child: Text('-',style: TextStyle(fontSize: 22.5,fontWeight: FontWeight.bold),)),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(left: 10, right: 10),
  //                             child: Center(child: Text('${emiOption.count }')),
  //                           ),
  //                           Container(
  //                             height: 30,
  //                             width: 30,
  //                             color: white3,
  //                             child: InkWell(
  //                               onTap: () {
  //                                 _incrementCounter(emiOption);
  //                               },
  //                               child: Center(child: Text('+',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }


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


  void _incrementCounter(EmiOption emiOption) {
    setState(() {
      emiOption.count++;
      _calculateTotalAmount();
    });
  }

  void _decrementCounter(EmiOption emiOption) {
    setState(() {
      if (emiOption.count > 0) {
        emiOption.count--;
        _calculateTotalAmount();
      }
    });
  }


  Widget Total_Online() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        children: [
          Text(
            'Total EMIs Payment',
            style: maintext,
          ),
          const Spacer(),
          Text('₹${totalAmount}', style: plan1),
        ],
      ),
    );
  }
}

class EmiOption {
  final String label;
  final double amount;
  final String plannum;
  int count;

  EmiOption( {required this.label, required this.amount,required this.plannum,this.count = 1});
}




