import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Grammage_Plan_Screen extends ConsumerStatefulWidget {
  const Grammage_Plan_Screen({super.key});

  @override
  ConsumerState<Grammage_Plan_Screen> createState() =>
      _Grammage_Plan_ScreenState();
}

class _Grammage_Plan_ScreenState extends ConsumerState<Grammage_Plan_Screen> {
  bool? isCheked = false;
  String? name;
  //LOCATION
  String? locationval;
  List<String> locationOption = [
    "Coimbatore",
    "Chennai",
    "Madurai",
  ];

  Future<void> getDetails() async {
    String cusname = await getCustomer_name();
    setState(() {
      name = cusname;
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
    final activelocationdata = ref.watch(ActivelocationProvider);

    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(
        isNav: true,
        isTwoLine: false,
        title1: 'Buy Gold',
        title2: '',
        actionLogo: 'info.svg',
        isWhite: false,
        ActiononTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Faq_Screen()));
        },
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: Text(
                      'Swarna Sakthi Plan ID (Grammage Plan)',
                      style: Heading_Style1,
                    )),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: white1,
                        border: Border.all(width: 1, color: grey5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              name ?? "",
                              style: GPlanT,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Enter Custom name for your plan',
                              style: radioST,
                            ),
                          ),
                          SSPtextFormField(
                              hintText: "Eg: Your Daughter's name: “Meena”",
                              keyboardtype: TextInputType.text),
                        ],
                      ),
                    ),
                  ),
                ),

                //ENTER MONTHLY EMI
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, bottom: 10),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: white1,
                //         border: Border.all(width: 1, color: grey5),
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 20, right: 20),
                //       child: Row(
                //         children: [
                //           Text(
                //             'Enter Monthly EMA',
                //             style: radioST,
                //           ),
                //           const Spacer(),
                //           Padding(
                //             padding: const EdgeInsets.only(top: 15, bottom: 15),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                   border: Border.all(
                //                       width: 1, color: Font_Primary_Color),
                //                   borderRadius: BorderRadius.circular(10),
                //                   color: white1),
                //               child: Padding(
                //                 padding: const EdgeInsets.only(
                //                     left: 30, top: 5, bottom: 5, right: 30),
                //                 child: Center(
                //                     child: Text(
                //                   '5000',
                //                   style: lighttext,
                //                 )),
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 10,
                ),

                activelocationdata.when(data: (data) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white1,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Select Branch',
                            style: radioST,
                          ),

                          const Spacer(),
                          //SELECT LOCATION
                          dropDownField(
                            context,
                            value: locationval,
                            listValue: data?.data
                                ?.map((toElement) => toElement.name ?? "")
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                locationval = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }, error: (Object error, StackTrace stackTrace) {
                  return Text("ERROR $error");
                }, loading: () {
                  return Center(child: CircularProgressIndicator());
                }),

                //INFO
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 30, left: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImgPathSvg('info2.svg'),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          'Tenure for the scheme completion is 11 month',
                          style: radioST,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),

                //CHECK BOX
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity(
                            horizontal: -4,
                            vertical:
                                -4), // Optionally shrink the tap target size
                        side: BorderSide(width: 1, color: checkbox),
                        value: isCheked,
                        activeColor: gradient1,
                        onChanged: (newvalue) {
                          setState(() {
                            isCheked = newvalue;
                          });
                        }),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'I agree with terms & conditions',
                      style: radioST,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 100,
                ),

                CommonContainerButton(context, onPress: () {
                  {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => KYC_Screen()));
                  }
                }, titleName: 'Proceed to Buy'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
