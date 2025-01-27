import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/My_SSP_Ui/My_SSP_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

import '../../utilits/ApiProvider.dart';

class payment_History_Screen extends ConsumerStatefulWidget {
  const payment_History_Screen({super.key});

  @override
  ConsumerState<payment_History_Screen> createState() =>
      _payment_History_ScreenState();
}

class _payment_History_ScreenState
    extends ConsumerState<payment_History_Screen> {
  @override
  Widget build(BuildContext context) {
    final paymenthistorydata = ref.watch(paymenthistoryProvider);
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(
        isNav: true,
        isTwoLine: false,
        title1: 'Payment History',
        title2: '',
        actionLogo: 'info.svg',
        isWhite: false,
        ActiononTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Faq_Screen()));
        },
      ),
      body: paymenthistorydata.when(data: (data) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //LIST VIEW BUILDER
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: data?.responseData?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: white1,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 1,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data?.responseData?[index]
                                                  .schemeName ??
                                              "",
                                          style: Goldweight,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: ImgPathSvg(
                                                    'Greenright.svg'),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                  data?.responseData?[index]
                                                          .amount ??
                                                      "",
                                                  style: bottomotext,
                                                ),
                                              ),
                                              Container(
                                                //width: MediaQuery.sizeOf(context).width/8,
                                                decoration: BoxDecoration(
                                                    color: grey5,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 5,
                                                          bottom: 5),
                                                  child: Center(
                                                      child: Text(
                                                    data?.responseData?[index]
                                                            .statusName ??
                                                        "",
                                                    style: success,
                                                  )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'Gold Rate : ${data?.responseData?[index].metalRate ?? ""}',
                                          style: planST,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data?.responseData?[index]
                                                  .accountNumber ??
                                              "",
                                          style: rate2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                data?.responseData?[index]
                                                        .paymentDate ??
                                                    "",
                                                style: planST,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                //width: MediaQuery.sizeOf(context).width/8,
                                                decoration: BoxDecoration(
                                                    color: grey5,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15,
                                                          right: 15,
                                                          top: 2,
                                                          bottom: 2),
                                                  child: Center(
                                                      child: Text(
                                                    data?.responseData?[index]
                                                            .paymentMode ??
                                                        "",
                                                    style: planST,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'Gold Weight : ${data?.responseData?[index].metalWeight ?? ""} g',
                                          style: planST,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),

                  //HELP CONTAINER
                  HelpContainer(context, Color: grey5),

                  //BUTTON
                  CommonContainerButton(context, onPress: () {
                    Navigator.pop(context);
                  }, titleName: "Back"),
                ],
              ),
            ),
          ),
        );
      }, error: (Object error, StackTrace stackTrace) {
        return Text("ERROR, $error");
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
    );
  }

  // Widget _mainBody() {
  //   return
  // }
}
