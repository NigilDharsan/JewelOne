import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import '../../Common_Widgets/Image_Path.dart';
import '../../utilits/Common_Colors.dart';
import '../../utilits/Text_Style.dart';
class My_SSP_Screen extends ConsumerStatefulWidget {
  My_SSP_Screen({super.key});

  @override
  ConsumerState<My_SSP_Screen> createState() => _My_SSP_ScreenState();
}

class _My_SSP_ScreenState extends ConsumerState<My_SSP_Screen> {
  bool _Custom_icon = false;
  bool _Custom_icon2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink3,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'My Purchase Plan', title2: '',
        actionLogo: 'homescreen.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen(
          )));
        },
      ),
      body: _Mainbody(),
    );
  }
  Widget _Mainbody (){
    final myplandata = ref.watch(MyplanProvider);
    return myplandata.when(data: (data){
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  ImgPathSvg('calendar2.svg'),
                  const SizedBox(width: 10),
                  Text("${data?.data?.length ?? 0} Plan Active",style: rate2,),
                ],
              ),
                 ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10 ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: arrow),
                            borderRadius: BorderRadius.circular(10),
                            color: white1,
                          ),
                          child: Theme(
                            data: ThemeData(dividerColor:Colors.transparent),
                            child: ExpansionTile(
                              trailing:   SizedBox.shrink(),
                              onExpansionChanged: (bool expanded){
                                setState(() {
                                  _Custom_icon = expanded;
                                });
                              },
                              title: Padding(
                                padding:EdgeInsets.zero,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Plan ${data?.data?[index].idSchemeAccount ?? ""}',style: Plan_Style,),
                                        const Spacer(),
                                        _Custom_icon == true ? ImgPathSvg('downarrow.svg') : ImgPathSvg('rightarrow.svg'),
                                      ],
                                    ),
                                    Text(data?.data?[index].schemeName ?? "",style: phoneHT,),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Text('View details',style: colortexts,),
                                        ),
                                        ImgPathSvg('rightarrow2.svg'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              tilePadding: EdgeInsets.only(left: 20,right: 0),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Divider(),
                                      Row_List(text1: 'ID number', text2: "${data?.data?[index].schemeAccNumber}"),
                                      Divider(),
                                      Row_List(text1: 'A/c name', text2: data?.data?[index].customerName ?? ""),
                                      Divider(),
                                      Row_List(text1: 'Location', text2: data?.data?[index].branchName ?? ""),
                                      Divider(),
                                      Row_List(text1: 'Total plan amount', text2: '₹${data?.data?[index].maximumPayable?.maxAmount}'),
                                      Divider(),
                                      Row_List(text1: 'Monthly EMA', text2: '₹${data?.data?[index].minimumPayable?.minAmount}'),
                                      Divider(),
                                      Row_List(text1: 'Tenure', text2: 'up to ${data?.data?[index].totalInstallments ?? ""} months'),
                                      Divider(),
                                      Row_List(text1: 'Gold saved till date', text2: '${data?.data?[index].paidWeight ?? ""} g'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

              //HELP CONTAINER
              HelpContainer(context, Color: pink4),
            ],
          ),
        ),
      );
    }, error: (Object error, StackTrace stackTrace){
      return Text("ERROR $error");
    }, loading: (){
      return Center(child: CircularProgressIndicator());
    }) ;
  }
}

Widget ssp_plan_text ({required String title,required dynamic style}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(title,style: style,),
  );
}

Widget ssp_plan_details ({required String text,required String text2}){
  return Padding(
    padding: const EdgeInsets.only(right: 10,bottom: 10,top: 10,),
    child: Row(
      children: [
        Text(text,style: lighttext,),
        const Spacer(),
        Text(text2,style: rate2,),
        const Divider(),
      ],
    ),
  );
}

 Widget Row_List ({required String text1,required String text2}){
  return
    Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text1,style: lighttext,),
          const Spacer(),
          Text(text2,style: planlist,)
        ],
      ),
    );
 }



 Widget HelpContainer(context,{required dynamic Color}){
  return Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 30),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Color,
          border: Border.all(width: 1,color: pink5),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Help',style: help,),
            Row(
              children: [
                ImgPathSvg('radio.svg'),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text('View Frequently Asked Questions'),
                )
              ],
            ),
            Row(
              children: [
                ImgPathSvg('radio.svg'),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text('How to Repay?'),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
 }
