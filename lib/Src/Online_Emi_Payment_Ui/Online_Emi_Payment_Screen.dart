import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Common_Model_Bottom_Sheet.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Model/MyPlanModel.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/Src/Success_UI/PayemntSuccess.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Loading_Overlay.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Online_Emi_Payment_Screen extends ConsumerStatefulWidget {
  int? selectedIndex = 0;
  Online_Emi_Payment_Screen({super.key, required this.selectedIndex});

  @override
  ConsumerState<Online_Emi_Payment_Screen> createState() =>
      _Online_Emi_Payment_ScreenState();
}

class _Online_Emi_Payment_ScreenState
    extends ConsumerState<Online_Emi_Payment_Screen> {
  // int? _groupValue = 1;
  int _count = 1;
  num totalAmount = 0;
  EmiOption? _selectedEmiOption;
  void _calculateTotalAmount() {
    totalAmount = _selectedEmiOption!.amount * _selectedEmiOption!.count;
  }

  final String clientId = 'TEST1019783451b01da019e7d8e03edd43879101';
  final String clientSecret =
      'cfsk_ma_test_a563a0f0dac40e802b3592ecffbb4ad9_122e4d57';
  final CFEnvironment environment = CFEnvironment.SANDBOX;

  String phoneVal = '';
  String name = '';
  final _formKey = GlobalKey<FormState>();

  String? selectedAmount;
  List<String> amounts = ['100', '500', '1000'];

  Future<void> getDetails() async {
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
    final priceRate = ref.watch(GoldrateProvider);

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home_DashBoard_Screen()));
        },
      ),
      body: myplandata.when(data: (data) {
        widget.selectedIndex != null
            ? data?.data != null
                ? data?.data![widget.selectedIndex ?? 0].isChecked = true
                : null
            : null;
        amountCalculation(int selectIndex, int amount) {
          if (data?.data?[selectIndex].discountType == 2) {
            final taxAmount =
                ((data?.data?[selectIndex].taxPercentage ?? 0.0) / 100) *
                    amount;

            final finalAmount =
                (amount * (data?.data?[selectIndex].incrementCount ?? 0)) -
                    ((data?.data?[selectIndex].discountValue ?? 0) + taxAmount);

            data?.data?[selectIndex].totalTaxAmount = "$taxAmount";
            data?.data?[selectIndex].enterAmount = "$amount";
            data?.data?[selectIndex].totalAmount =
                finalAmount.toStringAsFixed(2);
          } else if (data?.data?[selectIndex].discountType == 1) {
            final taxAmount =
                ((data?.data?[selectIndex].taxPercentage ?? 0.0) / 100) *
                    amount;

            final dicountAmout =
                ((data?.data?[selectIndex].discountValue ?? 0) / 100) * amount;

            final finalAmount =
                (amount * (data?.data?[selectIndex].incrementCount ?? 0)) -
                    (dicountAmout + taxAmount);

            data?.data?[selectIndex].totalTaxAmount = "$taxAmount";
            data?.data?[selectIndex].totalDiscountAmount = "$dicountAmout";

            data?.data?[selectIndex].enterAmount = "$amount";

            data?.data?[selectIndex].totalAmount =
                finalAmount.toStringAsFixed(2);
          } else {
            final taxAmount =
                ((data?.data?[selectIndex].taxPercentage ?? 0.0) / 100) *
                    amount;
            final finalAmount =
                (amount * (data?.data?[selectIndex].incrementCount ?? 0)) -
                    taxAmount;

            data?.data?[selectIndex].totalTaxAmount = "$taxAmount";
            data?.data?[selectIndex].enterAmount = "$amount";

            data?.data?[selectIndex].totalAmount =
                finalAmount.toStringAsFixed(2);
          }
          if (data?.data?[selectIndex].convertToWeight == true) {
            data?.data?[selectIndex].totalWeight =
                (amount / (data.data?[selectIndex].todaysRate ?? 0.0))
                    .toStringAsFixed(3);
          }

          totalAmount = data?.data!
              .map((item) => double.parse(item.totalAmount ?? "0"))
              .reduce((a, b) => a + b) as num;

          totalAmount = double.parse(totalAmount.toStringAsFixed(2));
        }

        gramCalculation(int selectIndex, double amount) {
          if (data?.data?[selectIndex].discountType == 2) {
            final finalAmount =
                ((amount * (data?.data?[selectIndex].incrementCount ?? 0)) *
                        (data?.data?[selectIndex].todaysRate ?? 0.0)) -
                    ((data?.data?[selectIndex].discountValue ?? 0));

            if (data?.data?[selectIndex].taxType == 2) {
              final taxAmount =
                  ((data?.data?[selectIndex].taxPercentage ?? 0.0) / 100) *
                      finalAmount;

              data?.data?[selectIndex].enterAmount =
                  (amount + taxAmount).toStringAsFixed(2);
              data?.data?[selectIndex].totalAmount =
                  (finalAmount + taxAmount).toStringAsFixed(2);
              data?.data?[selectIndex].totalTaxAmount = "$taxAmount";
            } else {
              data?.data?[selectIndex].enterAmount = amount.toStringAsFixed(2);
              data?.data?[selectIndex].totalAmount =
                  finalAmount.toStringAsFixed(2);
            }
          } else if (data?.data?[selectIndex].discountType == 1) {
            final dicountAmout =
                ((data?.data?[selectIndex].discountValue ?? 0) / 100) * amount;

            final finalAmount =
                ((amount * (data?.data?[selectIndex].incrementCount ?? 0)) *
                        (data?.data?[selectIndex].todaysRate ?? 0.0)) -
                    (dicountAmout);

            if (data?.data?[selectIndex].taxType == 2) {
              final taxAmount =
                  ((data?.data?[selectIndex].taxPercentage ?? 0.0) / 100) *
                      finalAmount;

              data?.data?[selectIndex].enterAmount =
                  (amount + taxAmount).toStringAsFixed(2);
              data?.data?[selectIndex].totalAmount =
                  (finalAmount + taxAmount).toStringAsFixed(2);
              data?.data?[selectIndex].totalTaxAmount = "$taxAmount";
              data?.data?[selectIndex].totalDiscountAmount = "$dicountAmout";
            } else {
              data?.data?[selectIndex].enterAmount = amount.toStringAsFixed(2);
              data?.data?[selectIndex].totalDiscountAmount = "$dicountAmout";

              data?.data?[selectIndex].totalAmount =
                  finalAmount.toStringAsFixed(2);
            }
          } else {
            final taxAmount =
                ((data?.data?[selectIndex].taxPercentage ?? 0.0) / 100) *
                    amount;

            final finalAmount =
                (((amount * (data?.data?[selectIndex].incrementCount ?? 0)) *
                        (data?.data?[selectIndex].todaysRate ?? 0.0))) -
                    taxAmount;

            data?.data?[selectIndex].enterAmount = amount.toStringAsFixed(2);
            data?.data?[selectIndex].totalTaxAmount = "$taxAmount";

            data?.data?[selectIndex].totalAmount =
                finalAmount.toStringAsFixed(2);
          }
          totalAmount = (data?.data!
              .map((item) => double.parse(item.totalAmount ?? "0"))
              .reduce((a, b) => a + b) as num);
          totalAmount = double.parse(totalAmount.toStringAsFixed(2));
        }

        clearAmount(int selectIndex) {
          data?.data?[selectIndex].enterAmount = "0";

          data?.data?[selectIndex].totalAmount = "0";
          data?.data?[selectIndex].selectedAmount = "";
          data?.data?[selectIndex].incrementCount = 1;
          data?.data?[selectIndex].totalDiscountAmount = "";
          data?.data?[selectIndex].totalTaxAmount = "";

          data?.data?[selectIndex].selectedGram = null;

          totalAmount = data?.data!
              .map((item) => double.parse(
                  item.totalAmount == "" ? "0" : item.totalAmount ?? "0"))
              .reduce((a, b) => a + b) as num;
        }

        return Stack(children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    priceRate.when(data: (data) {
                      return GoldScrollPriceWidget(
                        data: data,
                      );
                    }, error: (Object error, StackTrace stackTrace) {
                      return Text("$error");
                    }, loading: () {
                      return CircularProgressIndicator();
                    }),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 20, right: 20),
                      child: Row(
                        children: [
                          ImgPathSvg('calendar2.svg'),
                          const SizedBox(width: 10),
                          Text('${data?.data?.length ?? 0} Plan Active',
                              style: rate2)
                        ],
                      ),
                    ),
                    // Container(child: Plan_List()),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ListView.builder(
                        itemCount: data?.data?.length ?? 0,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          int returnType = data?.data?[index].limitType ?? 1;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: arrow, width: 2),
                                color: white1,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          child: Checkbox(
                                            side: BorderSide(
                                                width: 1, color: checkbox),
                                            value: data?.data?[index].isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                data?.data?[index].isChecked =
                                                    value ?? false;
                                                if (data?.data?[index]
                                                        .isChecked !=
                                                    true) {
                                                  "";
                                                  clearAmount(index);
                                                }
                                              });
                                            },
                                          ),
                                        ),

                                        //SCHEME NAME
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                            data?.data?[index].accountName ??
                                                "",
                                            style: planST.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                    data?.data?[index].limitType == 1
                                        ? Row(
                                            children: [
                                              Container(
                                                  width: (MediaQuery.sizeOf(
                                                                  context)
                                                              .width /
                                                          2) -
                                                      30,
                                                  child: Text(
                                                      "Min / Max Amount ",
                                                      style:
                                                          planST2.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15))),
                                              Text(
                                                "₹ ${(data?.data?[index].minimumPayable?.minAmount ?? 0.0).toStringAsFixed(2)} / ${(data?.data?[index].maximumPayable?.maxAmount ?? 0.0).toStringAsFixed(2)}",
                                                style: planST.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                width:
                                                    (MediaQuery.sizeOf(context)
                                                                .width /
                                                            2) -
                                                        30,
                                                child: Text('Min/Max Weight: ',
                                                    style: planST2.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15)),
                                              ),
                                              Text(
                                                "${(data?.data?[index].minimumPayable?.minWeight ?? 0.0).toStringAsFixed(3)} / ",
                                                style: planST.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                "${(data?.data?[index].maximumPayable?.maxWeight ?? 0.0).toStringAsFixed(3)}",
                                                style: planST.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: (MediaQuery.sizeOf(
                                                                  context)
                                                              .width /
                                                          2) -
                                                      30,
                                                  child: Text("Pay",
                                                      style: planST2.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                ),
                                                (data?.data?[index].limitType ==
                                                            1 &&
                                                        data?.data?[index]
                                                                .denomType ==
                                                            3)
                                                    ? Container(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2) -
                                                            35,
                                                        height: 35,
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter amount';
                                                            }
                                                            final intValue =
                                                                int.tryParse(
                                                                    value);
                                                            if (intValue ==
                                                                null) {
                                                              return '';
                                                            }
                                                            if (intValue <=
                                                                    1000 ||
                                                                intValue >=
                                                                    10000) {
                                                              return '';
                                                            }
                                                            return null;
                                                          },
                                                          inputFormatters: [
                                                            // LengthLimitingTextInputFormatter(
                                                            //     5),7510618517
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            TextInputFormatter
                                                                .withFunction(
                                                                    (oldValue,
                                                                        newValue) {
                                                              if (newValue.text
                                                                  .isEmpty) {
                                                                return newValue; // Allow empty input
                                                              }
                                                              final int value =
                                                                  int.tryParse(
                                                                          newValue
                                                                              .text) ??
                                                                      0;
                                                              if (value <=
                                                                  (data
                                                                          ?.data?[
                                                                              index]
                                                                          .maximumPayable
                                                                          ?.maxAmount ??
                                                                      0.0)) {
                                                                return newValue; // Allow if value is less than or equal to 10000
                                                              }
                                                              return oldValue; // Reject the input if it exceeds 10000
                                                            }),
                                                          ],
                                                          textAlign:
                                                              TextAlign.left,
                                                          enabled: (data
                                                                      ?.data?[
                                                                          index]
                                                                      .isChecked ??
                                                                  false) &&
                                                              data?.data?[index]
                                                                      .limitType ==
                                                                  1,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.symmetric(
                                                                    vertical:
                                                                        10.0,
                                                                    horizontal:
                                                                        10.0),
                                                            hintText: "INR",
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          grey5),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          grey5),
                                                            ),
                                                            fillColor:
                                                                Colors.grey[50],
                                                            filled: true,
                                                          ),
                                                          onChanged: (text) {
                                                            var amount =
                                                                text != ""
                                                                    ? int.parse(
                                                                        text)
                                                                    : 0;
                                                            if ((data
                                                                        ?.data?[
                                                                            index]
                                                                        .maximumPayable
                                                                        ?.maxAmount ??
                                                                    0.0) >=
                                                                amount
                                                                    .toDouble()) {
                                                              setState(() {
                                                                amountCalculation(
                                                                    index,
                                                                    amount);

                                                                // int.parse(
                                                                //     data?.data?[index]
                                                                //             .totalAmount ??
                                                                //         "0");
                                                              });
                                                            } else {}
                                                          },
                                                        ),
                                                      )
                                                    : (data
                                                                    ?.data?[
                                                                        index]
                                                                    .amountDenom
                                                                    ?.length ??
                                                                0) !=
                                                            0
                                                        ? Container(
                                                            height: 35,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2) -
                                                                60,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              isExpanded: true,
                                                              underline:
                                                                  SizedBox(),
                                                              value:
                                                                  selectedAmount,
                                                              icon: Icon(Icons
                                                                  .keyboard_arrow_down_rounded),
                                                              hint: Text(
                                                                  "Amount"),
                                                              items: amounts
                                                                  .map((String
                                                                      amount) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: amount,
                                                                  child: Text(
                                                                      amount),
                                                                );
                                                              }).toList(),
                                                              onChanged: ((data
                                                                              ?.data?[
                                                                                  index]
                                                                              .isChecked ??
                                                                          false) &&
                                                                      data?.data?[index].limitType ==
                                                                          1)
                                                                  ? (String?
                                                                      newValue) {
                                                                      setState(
                                                                          () {
                                                                        selectedAmount =
                                                                            newValue;

                                                                        data?.data?[index].selectedAmount =
                                                                            newValue;
                                                                        var amount = newValue !=
                                                                                ""
                                                                            ? int.parse(newValue ??
                                                                                "0")
                                                                            : 0;

                                                                        amountCalculation(
                                                                            index,
                                                                            amount);
                                                                        // if ((data?.data?[index].maximumPayable?.maxAmount ??
                                                                        //         0.0) >=
                                                                        //     amount
                                                                        //         .toDouble()) {
                                                                        // data
                                                                        //     ?.data?[
                                                                        //         index]
                                                                        //     .enterAmount = "${amount}";
                                                                        // data
                                                                        //     ?.data?[
                                                                        //         index]
                                                                        //     .totalAmount = "${amount}";

                                                                        // totalAmount =
                                                                        //     double.parse(data
                                                                        //             ?.data?[
                                                                        //                 index]
                                                                        //             .totalAmount ??
                                                                        //         "0.0");
                                                                        // totalAmount = data
                                                                        //     ?.data!
                                                                        //     .map((item) => double.parse(item.totalAmount ??
                                                                        //         "0"))
                                                                        //     .reduce((a, b) =>
                                                                        //         a +
                                                                        //         b) as num;
                                                                        // }
                                                                      });
                                                                    }
                                                                  : null,
                                                            ),
                                                          )
                                                        : (data
                                                                        ?.data?[
                                                                            index]
                                                                        .weightDenom
                                                                        ?.length ??
                                                                    0) !=
                                                                0
                                                            ? Container(
                                                                height: 35,
                                                                width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        2) -
                                                                    60,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                                child:
                                                                    DropdownButton<
                                                                        String>(
                                                                  isExpanded:
                                                                      true,
                                                                  underline:
                                                                      SizedBox(),
                                                                  value: data
                                                                      ?.data?[
                                                                          index]
                                                                      .selectedGram,
                                                                  icon: Icon(Icons
                                                                      .keyboard_arrow_down_rounded),
                                                                  hint: Text(
                                                                      "Grams"),
                                                                  items: data!
                                                                      .data![
                                                                          index]
                                                                      .weightDenom!
                                                                      .map((AmountDenom
                                                                          amount) {
                                                                    return DropdownMenuItem<
                                                                        String>(
                                                                      value: amount
                                                                          .value,
                                                                      child: Text(
                                                                          amount.value ??
                                                                              ""),
                                                                    );
                                                                  }).toList(),
                                                                  onChanged: ((data.data?[index].isChecked ??
                                                                              false) &&
                                                                          data.data?[index].limitType ==
                                                                              2)
                                                                      ? (String?
                                                                          newValue) {
                                                                          setState(
                                                                              () {
                                                                            data.data?[index].selectedGram =
                                                                                newValue;

                                                                            double amount = newValue != ""
                                                                                ? double.parse(newValue ?? "0.0")
                                                                                : 0;

                                                                            gramCalculation(index,
                                                                                amount);
                                                                            if ((data.data?[index].maximumPayable?.maxWeight ?? 0.0) >=
                                                                                amount.toDouble()) {}
                                                                          });
                                                                        }
                                                                      : null,
                                                                ),
                                                              )
                                                            : Container(
                                                                width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        2) -
                                                                    60,
                                                                height: 35,
                                                                child:
                                                                    TextFormField(
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty) {
                                                                      return 'Please enter gram';
                                                                    }
                                                                    final intValue =
                                                                        double.tryParse(
                                                                            value);
                                                                    if (intValue ==
                                                                        null) {
                                                                      return '';
                                                                    }
                                                                    if (intValue <=
                                                                            1 ||
                                                                        intValue >=
                                                                            8) {
                                                                      return '';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  onChanged:
                                                                      (value) {
                                                                    double
                                                                        amount =
                                                                        value !=
                                                                                ""
                                                                            ? double.parse(value)
                                                                            : 0;

                                                                    if ((data?.data?[index].maximumPayable?.maxWeight ??
                                                                            0.0) >=
                                                                        amount
                                                                            .toDouble()) {
                                                                      setState(
                                                                          () {
                                                                        gramCalculation(
                                                                            index,
                                                                            amount);
                                                                        // data
                                                                        //     ?.data?[
                                                                        //         index]
                                                                        //     .enterAmount = "${amount}";
                                                                        // data
                                                                        //     ?.data?[
                                                                        //         index]
                                                                        //     .totalAmount = "${amount * (data.data?[index].todaysRate ?? 0.0)}";

                                                                        // // totalAmount =
                                                                        // //     double.parse(data
                                                                        // //             ?.data?[
                                                                        // //                 index]
                                                                        // //             .totalAmount ??
                                                                        // //         "0.0");
                                                                        // totalAmount = data
                                                                        //     ?.data!
                                                                        //     .map((item) => double.parse(item.totalAmount ??
                                                                        //         "0"))
                                                                        //     .reduce((a, b) =>
                                                                        //         a +
                                                                        //         b) as num;
                                                                      });
                                                                    }
                                                                  },
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  enabled: (data
                                                                              ?.data?[
                                                                                  index]
                                                                              .isChecked ??
                                                                          false) &&
                                                                      data?.data?[index]
                                                                              .limitType ==
                                                                          2,
                                                                  keyboardType:
                                                                      TextInputType.numberWithOptions(
                                                                          decimal:
                                                                              true),
                                                                  inputFormatters: [
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            r'^\d+\.?\d{0,3}')),
                                                                    TextInputFormatter.withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                      if (newValue
                                                                          .text
                                                                          .isEmpty) {
                                                                        return newValue; // Allow empty input
                                                                      }
                                                                      final int
                                                                          value =
                                                                          int.tryParse(newValue.text) ??
                                                                              0;
                                                                      if (value <=
                                                                          (data?.data?[index].maximumPayable?.maxWeight ??
                                                                              0.0)) {
                                                                        return newValue; // Allow if value is less than or equal to 10000
                                                                      }
                                                                      return oldValue; // Reject the input if it exceeds 10000
                                                                    }),
                                                                  ],
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10.0,
                                                                        horizontal:
                                                                            10.0),
                                                                    hintText:
                                                                        "Enter gram",
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: grey5),
                                                                    ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: grey5),
                                                                    ),
                                                                    fillColor:
                                                                        Colors.grey[
                                                                            50],
                                                                    filled:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                    data?.data?[index].convertToWeight == true
                                        ? Row(
                                            children: [
                                              Container(
                                                width:
                                                    (MediaQuery.sizeOf(context)
                                                                .width /
                                                            2) -
                                                        30,
                                                child: Text('Weight',
                                                    style: planST2.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15)),
                                              ),
                                              Text(
                                                '${data?.data?[index].totalWeight ?? 0.0}',
                                                style: planST.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          )
                                        : SizedBox.shrink(),
                                    const SizedBox(height: 10),

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: (MediaQuery.sizeOf(context)
                                                      .width /
                                                  2) -
                                              30,
                                          child: Text("Installment",
                                              style: planST2.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15)),
                                        ),
                                        Container(
                                          height: 30,
                                          color: Colors.grey[300],
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if ((data?.data?[index]
                                                                  .advanceMonths ??
                                                              0) >=
                                                          (data?.data?[index]
                                                                  .incrementCount ??
                                                              0) &&
                                                      (data?.data?[index]
                                                                  .incrementCount ??
                                                              0) >
                                                          1) {
                                                    setState(() {
                                                      data?.data?[index]
                                                          .incrementCount = (data
                                                                  .data?[index]
                                                                  .incrementCount ??
                                                              0) -
                                                          1;
                                                      if (data?.data?[index]
                                                              .limitType ==
                                                          1) {
                                                        final amount =
                                                            int.parse(data
                                                                    ?.data?[
                                                                        index]
                                                                    .enterAmount ??
                                                                "0");
                                                        amountCalculation(
                                                            index, amount);
                                                      } else {
                                                        double amount =
                                                            (double.parse(data
                                                                    ?.data?[
                                                                        index]
                                                                    .enterAmount ??
                                                                "0"));

                                                        gramCalculation(
                                                            index, amount);
                                                      }
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      ((MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2) -
                                                              35) /
                                                          3,
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                color: Colors.grey[50],
                                                width: ((MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2) -
                                                        35) /
                                                    3,
                                                height: 30,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(
                                                      "${data?.data?[index].incrementCount}",
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (data?.data?[index]
                                                              .allowAdvance ==
                                                          true &&
                                                      (data?.data?[index]
                                                              .isChecked ??
                                                          false)) {
                                                    // _incrementCounter();
                                                    if ((data?.data?[index]
                                                                .advanceMonths ??
                                                            0) >
                                                        (data?.data?[index]
                                                                .incrementCount ??
                                                            0)) {
                                                      setState(() {
                                                        data?.data?[index]
                                                            .incrementCount = (data
                                                                    .data?[
                                                                        index]
                                                                    .incrementCount ??
                                                                0) +
                                                            1;

                                                        if (data?.data?[index]
                                                                .limitType ==
                                                            1) {
                                                          final amount =
                                                              int.parse(data
                                                                      ?.data?[
                                                                          index]
                                                                      .enterAmount ??
                                                                  "0");
                                                          amountCalculation(
                                                              index, amount);
                                                        } else {
                                                          double amount =
                                                              (double.parse(data
                                                                      ?.data?[
                                                                          index]
                                                                      .enterAmount ??
                                                                  "0"));

                                                          gramCalculation(
                                                              index, amount);
                                                        }
                                                        // totalAmount = data?.data!
                                                        //     .map((item) =>
                                                        //         double.parse(
                                                        //             item.totalAmount ??
                                                        //                 "0"))
                                                        //     .reduce((a, b) =>
                                                        //         a + b) as num;
                                                      });
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      ((MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2) -
                                                              35) /
                                                          3,
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),

                                    data?.data?[index].discountValue != 0
                                        ? Row(
                                            children: [
                                              Container(
                                                width:
                                                    (MediaQuery.sizeOf(context)
                                                                .width /
                                                            2) -
                                                        30,
                                                child: Text("Discount",
                                                    style: planST2.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15)),
                                              ),
                                              Text(
                                                  '${data?.data?[index].discountValue ?? ''}',
                                                  style: planST.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14)),
                                            ],
                                          )
                                        : SizedBox.shrink(),
                                    const SizedBox(height: 8),

                                    data?.data?[index].taxPercentage != null
                                        ? Row(
                                            children: [
                                              Container(
                                                width:
                                                    (MediaQuery.sizeOf(context)
                                                                .width /
                                                            2) -
                                                        30,
                                                child: Text('Tax',
                                                    style: planST2.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15)),
                                              ),
                                              Text(
                                                '${data?.data?[index].taxPercentage ?? ''}',
                                                style: planST.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          )
                                        : SizedBox.shrink(),
                                    const SizedBox(height: 8),

                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       width:
                                    //           MediaQuery.sizeOf(context).width /
                                    //               2.2,
                                    //       child: Text('weight',
                                    //           style: planST2.copyWith(
                                    //               fontWeight: FontWeight.w500,
                                    //               fontSize: 15)),
                                    //     ),
                                    //     Text(
                                    //       '${data?.data?[index].paidWeight ?? ''}',
                                    //       style: planST.copyWith(
                                    //           fontWeight: FontWeight.bold,
                                    //           fontSize: 14),
                                    //     )
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Container(
                                          width: (MediaQuery.sizeOf(context)
                                                      .width /
                                                  2) -
                                              30,
                                          child: Text('Net Amount',
                                              style: planST2.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15)),
                                        ),
                                        Text(
                                          '₹${data?.data?[index].totalAmount ?? '0'}',
                                          style: planST.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // const SizedBox(height: 35),
                    // HelpContainer(context, Color: pink4),
                    // const SizedBox(height: 10),
                    SizedBox(height: 200), // Add extra space at the bottom
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Fix at the bottom of the screen
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Add a background to buttons
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
                  Total_Online(),
                  totalAmount == 0 ? SizedBox(height: 50) : Container(),
                  totalAmount == 0
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 50),
                          child: CommonContainerButton(
                            context,
                            onPress: () {
                              SingleTon().plandata = data?.data ?? [];

                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Total_Amount_Bottom_Sheet(
                                    context,
                                    onPress: () async {
                                      List<Map<String, dynamic>> data = [];
                                      for (int i = 0;
                                          i < (SingleTon().plandata.length);
                                          i++) {
                                        var now = DateTime.now();
                                        var formatter =
                                            DateFormat('yyyy-MM-dd');
                                        String formattedDate =
                                            formatter.format(now);
                                        if (SingleTon().plandata[i].isChecked ==
                                            true) {
                                          data.add({
                                            "advance": 1,
                                            "id_scheme_account": SingleTon()
                                                .plandata[i]
                                                .idSchemeAccount,
                                            "trans_date": formattedDate,
                                            "date_payment": formattedDate,
                                            "payment_charges": 0,
                                            "payment_status": 1,
                                            "paid_through": 2,
                                            "installment": SingleTon()
                                                .plandata[i]
                                                .incrementCount,
                                            "id_branch": SingleTon()
                                                .plandata[i]
                                                .idBranch,
                                            "id_payGateway": 1,
                                            "payment_amount": totalAmount,
                                            "tax_amount": SingleTon()
                                                .plandata[i]
                                                .totalTaxAmount,
                                            "net_amount": SingleTon()
                                                .plandata[i]
                                                .totalAmount,
                                            "total_net_amount": SingleTon()
                                                .plandata[i]
                                                .totalAmount,
                                            "discountAmt": SingleTon()
                                                .plandata[i]
                                                .totalDiscountAmount,
                                            "actual_trans_amt": 0,
                                            "ref_trans_id": null,
                                            "trans_id": null,
                                            "metal_weight": SingleTon()
                                                .plandata[i]
                                                .totalWeight,
                                            "metal_rate": SingleTon()
                                                .plandata[i]
                                                .todaysRate,
                                            "tax_type":
                                                SingleTon().plandata[i].taxType,
                                            "tax_id":
                                                SingleTon().plandata[i].taxId
                                          });
                                        }
                                      }
                                      final result = await ref.read(
                                          paymentPostProvider(data).future);

                                      // final result = await ref.watch(
                                      //     paymentPostProvider(data));
                                      LoadingOverlay.forcedStop();
                                      if (result?.message ==
                                          "Payment Created successfully.") {
                                        // ShowToastMessage(result?.message ?? "");
                                        // await createOrder();
                                        Navigator.pop(context);

                                        await initiatePay(
                                            orderId: result?.orderId ?? "",
                                            paymentSessionId:
                                                result?.paymentSessionId ?? "");
                                      } else {
                                        // Handle failure
                                        ShowToastMessage(result?.message ?? "");
                                      }
                                    },
                                    totalAmount: "${totalAmount}",
                                    mobileNumber: '${phoneVal}',
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
          )
        ]);
      }, error: (Object error, StackTrace stackTrace) {
        return Text("ERROR, $error");
      }, loading: () {
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

  Future<void> initiatePay(
      {required String orderId, required String paymentSessionId}) async {
    try {
      var session = CFSessionBuilder()
          .setEnvironment(environment)
          .setOrderId(orderId)
          .setPaymentSessionId(paymentSessionId)
          .build();

      var cfWebCheckout =
          CFWebCheckoutPaymentBuilder().setSession(session).build();

      var cfPaymentGateway = CFPaymentGatewayService();

      cfPaymentGateway.setCallback(
        (resultsMsg) async {
          print('Payment successful for Order ID: $resultsMsg');

          Map<String, dynamic> data = {
            "type": "Success",
            "order_id": orderId,
          };

          final result = await ref.read(paymentSuccessProvider(data).future);

          LoadingOverlay.forcedStop();
          if (result?.status == true) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentSuccess(
                          isPaymentSuccess: true,
                          paymentStatusMsg: result?.message ?? "",
                        )));
          } else {
            // Handle failure
            ShowToastMessage(result?.message ?? "");
          }
        },
        (error, resultsMsg) async {
          Map<String, dynamic> data = {
            "type": "Failure",
            "order_id": orderId,
          };

          final result = await ref.read(paymentSuccessProvider(data).future);

          LoadingOverlay.forcedStop();
          if (result?.status == false) {
            ShowToastMessage(result?.message ?? "");
          } else {
            // Handle failure
            ShowToastMessage(result?.message ?? "");
          }
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
          Text('₹${totalAmount.toStringAsFixed(2)}', style: plan1),
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

  EmiOption(
      {required this.label,
      required this.amount,
      required this.plannum,
      this.count = 1});
}
