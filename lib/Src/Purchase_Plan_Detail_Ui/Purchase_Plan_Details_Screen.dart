import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Purchase_Plan_detail_Screeen extends ConsumerStatefulWidget {
  int schemeAccountID;
  Purchase_Plan_detail_Screeen({super.key, required this.schemeAccountID});

  @override
  ConsumerState<Purchase_Plan_detail_Screeen> createState() =>
      _Purchase_Plan_detail_ScreeenState();
}

class _Purchase_Plan_detail_ScreeenState
    extends ConsumerState<Purchase_Plan_detail_Screeen> {
  @override
  Widget build(BuildContext context) {
    final paymenthistorydata =
        ref.watch(paymentHistorySchemeProvider(widget.schemeAccountID));

    return Scaffold(
      backgroundColor: white2,
      appBar: AppBar(
        backgroundColor: white2,
        leading: Container(
          margin: EdgeInsets.all(12.5),
          decoration: BoxDecoration(shape: BoxShape.circle, color: white1),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        title: Text(
          "My Purchase Plan Details",
          style: appbarT2,
          textAlign: TextAlign.left,
        ),
      ),
      body: paymenthistorydata.when(data: (data) {
        return data?.responseData != null
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //HEADER CONTAINER
                    Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        gradient: appGradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: MediaQuery.sizeOf(context).width / 10,
                                child: Text(
                                  '#',
                                  style: Content1,
                                )),
                            Container(
                                width: MediaQuery.sizeOf(context).width / 5,
                                child: Text(
                                  'Amount',
                                  style: Content1,
                                )),
                            Container(
                                width: MediaQuery.sizeOf(context).width / 5,
                                child: Text(
                                  'Weight',
                                  style: Content1,
                                )),
                            Container(
                                width: MediaQuery.sizeOf(context).width / 5,
                                child: Text(
                                  'Ins Date',
                                  style: Content1,
                                )),
                            Text(
                              'Receipt',
                              style: Content1,
                            ),
                          ],
                        ),
                      ),
                    ),

                    //PLAN DETAILS LIST
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data?.responseData?.length ?? 0,
                      itemBuilder: (context, index) {
                        Color color;
                        if ((index + 1) % 2 == 0) {
                          color = white2;
                        } else {
                          color = white1;
                        }

                        return Container(
                          width: MediaQuery.sizeOf(context).width,
                          color: color,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.sizeOf(context).width / 10,
                                    child: Text(
                                      "${index + 1}",
                                      style: plandetailT,
                                    )),
                                Container(
                                    width: MediaQuery.sizeOf(context).width / 5,
                                    child: Text(
                                      "${data?.responseData?[index].amount}",
                                      style: plandetailT,
                                    )),
                                Container(
                                    width: MediaQuery.sizeOf(context).width / 5,
                                    child: Text(
                                      data?.responseData?[index].metalWeight ??
                                          "",
                                      style: plandetailT,
                                    )),
                                Container(
                                    width: MediaQuery.sizeOf(context).width / 5,
                                    child: Text(
                                      data?.responseData?[index].paymentDate ??
                                          "",
                                      style: plandetailT,
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, bottom: 3),
                                  child: Container(
                                      width: MediaQuery.sizeOf(context).width /
                                          4.3,
                                      child: Text(
                                        data?.responseData?[index].receipt_no ??
                                            "",
                                        style: plandetailT,
                                        textAlign: TextAlign.left,
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20,top: 15),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       ImgPathSvg('info2.svg'),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 10,),
                    //         child: Container(
                    //           width: MediaQuery.sizeOf(context).width/1.2,
                    //             child: Text('Last EMA is less due to less number of ays in the first month EMA',style: walletT2,maxLines: 4,)),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //
                    //
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    //   child: Text('Penalty charges applicable on repayment post due date for each installments :',style: detailsT,),
                    // ),
                    //
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text('EMA Bounce Charge (1 Month)',style: walletT2,),
                    //       const Spacer(),
                    //       Container(
                    //         width: MediaQuery.sizeOf(context).width/2.4,
                    //           child: Text('10% of Gold value* or ₹500,whichever is lower',style: plancode,))
                    //     ],
                    //   ),
                    // ),
                    //
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text('Penal Charges for 2 - 365 days',style: walletT2,),
                    //       const Spacer(),
                    //       Text('36% p.a. on amount overdue*',style: plancode,)
                    //     ],
                    //   ),
                    // ),

                    //BACK BUTTON
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 20, right: 20, top: 30, bottom: 30),
                    //   child: CommonContainerButton(context, onPress: () {
                    //     Navigator.pop(context);
                    //   }, titleName: "Back"),
                    // ),
                  ],
                ),
              )
            : Container(
                child: Center(child: Text("${data?.message ?? ""}")),
              );
      }, error: (Object error, StackTrace stackTrace) {
        return Text("ERROR, $error");
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
