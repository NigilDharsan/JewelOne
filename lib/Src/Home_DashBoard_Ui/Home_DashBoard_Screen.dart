import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Common_Card.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Model/GoldRateMmodel.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Src/Close_Account_UI/CloseAccountScreen.dart';
import 'package:jewelone/Src/Menu_Ui/Menu_Screen.dart';
import 'package:jewelone/Src/My_SSP_Ui/My_SSP_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Screen.dart';
import 'package:jewelone/Src/Notification_Ui/Notification_Screen.dart';
import 'package:jewelone/Src/Online_Emi_Payment_Ui/Online_Emi_Payment_Screen.dart';
import 'package:jewelone/Src/Purchase_Plan_Detail_Ui/Purchase_Plan_Details_Screen.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Payment_History_Ui/payment_History_Screen.dart';

class Home_DashBoard_Screen extends ConsumerStatefulWidget {
  Customer? customer;

  Home_DashBoard_Screen({super.key, this.customer});

  @override
  ConsumerState<Home_DashBoard_Screen> createState() =>
      _Home_DashBoard_ScreenState();
}

class _Home_DashBoard_ScreenState extends ConsumerState<Home_DashBoard_Screen> {
  // final List<String> items = ['Coimbatore', 'Salem', 'Chennai'];
  // String selectedItem = 'Coimbatore';
  int myCurrentPage = 0;

  String? location;
  List<String> locationoption = ["Pollachi"];

  String name = '';

  Future<void> getDetails() async {
    String cusname = await getCustomer_name();
    setState(() {
      name = cusname;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    final priceRate = ref.watch(GoldrateProvider);
    final bannerimagedata = ref.watch(BannerDataProvider);
    final myplandata = ref.watch(MyplanProvider);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: white2,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Menu_Screen()));
            },
            child: Icon(Icons.menu_outlined)),
        centerTitle: true,
        title: App_Logo(context),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Notification_Screen()));
                },
                child: ImgPathSvg("notification.svg")),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //LOCATION DROPDOWN
              // activelocationdata.when(data: (data){
              //   return _Location_Dropdown();
              // }, error: (Object error, StackTrace stackTrace){
              //   return Text('ERROR $error');
              // }, loading: (){
              //   return CircularProgressIndicator();
              //  }),

              //GOLD PRICE
              priceRate.when(data: (data) {
                return GoldScrollPriceWidget(
                  data: data,
                );
              }, error: (Object error, StackTrace stackTrace) {
                return Text("$error");
              }, loading: () {
                return CircularProgressIndicator();
              }),

              Container(
                color: white2,
                child: Column(
                  children: [
                    //CARD
                    myplandata.when(data: (data) {
                      if (data?.data?.isNotEmpty ?? false) {
                        return Container (
                          width: MediaQuery.sizeOf(context).width,
                          height: 238,
                          child: ListView.builder(
                              itemCount: data?.data?.length ?? 0,
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                final cardWidth = data?.data?.length == 1
                                    ? MediaQuery.sizeOf(context).width / 1.1
                                    : MediaQuery.sizeOf(context).width / 1.2;
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Wallet_Card(
                                    width: cardWidth,
                                    context,
                                    customername:
                                        "${data?.data?[index].accountName ?? ""}",
                                    Acnumval:
                                        "${data?.data?[index].idSchemeAccount ?? ""}",
                                    totalpaidval: '₹' +
                                        "${data?.data?[index].paidAmount?.toStringAsFixed(2) ?? ""}",
                                    totaccval: data?.data?[index].paidWeight
                                            ?.toStringAsFixed(3) ??
                                        "",
                                    noofpaidval:
                                        "${data?.data?[index].paidInstallments ?? ""}",
                                    paynow: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Online_Emi_Payment_Screen(
                                                    selectedIndex: index,
                                                  ))).then((onValue) {
                                        ref.refresh(MyplanProvider);
                                      });
                                    },
                                    payMentHistory: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Purchase_Plan_detail_Screeen(
                                                    schemeAccountID: data
                                                            ?.data?[index]
                                                            .idSchemeAccount ??
                                                        0,
                                                  )));
                                    },
                                  ),
                                );
                              }),
                        );
                      } else {
                        return const SizedBox(height: 10);
                      }
                    }, error: (Object error, StackTrace stackTrace) {
                      return Text('');
                    }, loading: () {
                      return CircularProgressIndicator();
                    }),

                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 20, right: 20, bottom: 20, top: 20),
                    //   child: Wallet_Card(
                    //     context,
                    //     customername: "Hi ${name}",
                    //     Acnumval: '81278172817271',
                    //     totalpaidval: '20,000',
                    //     totaccval: '12',
                    //     noofpaidval: '8',
                    //   ),
                    // ),

                    //PLAN CARD
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //ONLINE PAYMENT
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Online_Emi_Payment_Screen(
                                              selectedIndex: null,
                                            ))).then((onValue) {
                                  ref.refresh(MyplanProvider);
                                });
                              },
                              child: Plan_Card(
                                context,
                                Img: 'plan1.svg',
                                planT: 'Online EMI',
                              )),

                          //NEW SWARNA
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            New_SSP_Screen()));
                              },
                              child: Plan_Card(
                                context,
                                Img: 'plan2.svg',
                                planT: 'New Plan',
                              )),

                          //MY SWARNA
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => My_SSP_Screen()));
                              },
                              child: Plan_Card(
                                context,
                                Img: 'plan3.svg',
                                planT: 'My Plan',
                              )),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // PAYMENT HISTORY
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            payment_History_Screen()));
                              },
                              child: Plan_Card(
                                context,
                                Img: 'plan1.svg',
                                planT: 'Payment history',
                              )),

                          //CLOSED ACCOUNT
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CloseAccountScreen()));
                              },
                              child: Plan_Card(
                                context,
                                Img: 'plan2.svg',
                                planT: 'Closed account',
                              )),

                          //MY ORDER
                          InkWell(
                              onTap: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>My_SSP_Screen()));
                              },
                              child: Plan_Card(
                                context,
                                Img: 'plan3.svg',
                                planT: 'My order',
                              )),
                        ],
                      ),
                    ),
                    bannerimagedata.when(data: (data) {
                      List<Widget> carouselItems =
                          data?.data?.map<Widget>((item) {
                                return _carouselImg(context,
                                    item.bannerImg); // Pass the item to your _carouselImg method
                              }).toList() ??
                              [];

                      return
                          //CAROSEL BANNER
                          Container(
                        color: white1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              //CAROSEL SLIDER

                              CarouselSlider(
                                  items: carouselItems,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    enlargeCenterPage: true,
                                    aspectRatio: 16 / 9,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        myCurrentPage = index;
                                      });
                                    },
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: AnimatedSmoothIndicator(
                                  activeIndex: myCurrentPage,
                                  count: carouselItems.length,
                                  effect: ExpandingDotsEffect(
                                      dotHeight: 5,
                                      dotWidth: 5,
                                      activeDotColor: gradient1),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    }, error: (Object error, StackTrace stackTrace) {
                      return Text("$error");
                    }, loading: () {
                      return CircularProgressIndicator();
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//LOCATION DROPDOWN
// Widget _Location_Dropdown(){
//     return  Padding(
//       padding: const EdgeInsets.only(top: 10,bottom: 10),
//       child: Center(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Today Gold Rate  -",style: skip_ST,),
//
//             homedropDownFieldprofileedit(
//               context,
//               width: MediaQuery.sizeOf(context).width/2.5,
//               hintT: 'Coimbatore',
//               value: location,
//               listValue: locationoption,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   location = newValue;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
// }
}

//CAROUSEL IMG STACK
Widget _carouselImg(context, imageURL) {
  return Container(
    height: 185,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: NetworkImage(imageURL), fit: BoxFit.cover),
    ),
  );
}

class GoldScrollPriceWidget extends ConsumerStatefulWidget {
  GoldRateModel? data;

  GoldScrollPriceWidget({required this.data});

  @override
  _GoldScrollPriceWidgetState createState() => _GoldScrollPriceWidgetState();
}

class _GoldScrollPriceWidgetState extends ConsumerState<GoldScrollPriceWidget> {
  // Timer? _timer;
  // final ScrollController _scrollController = ScrollController();
  // int _counter = 0;
  // double scrollIncrement = 2.0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
  //     _scrollList();
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
  //
  // void _scrollList() {
  //   double maxScrollExtent = _scrollController.position.maxScrollExtent;
  //   double currentScroll = _scrollController.position.pixels;
  //
  //   if (currentScroll >= maxScrollExtent) {
  //     _scrollController.jumpTo(0);
  //     _counter = 0;
  //   } else {
  //     _scrollController.jumpTo(currentScroll + scrollIncrement);
  //     _counter++;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '1 GM (22KT) Gold',
                style: gramST, // Style for the title
              ),
              Text(
                '₹ ${widget.data?.data?.gold22ct ?? ""}', // Display the price
                style: gramrateST, // Style for the price
              ),
            ],
          ),
          double.parse((widget.data?.data?.goldRateDifference ?? "0.0")
                      .replaceAll(',', '')) <
                  0
              ? Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.black,
                  size: 18,
                )
              : Icon(
                  Icons.arrow_upward_outlined,
                  color: Colors.red,
                  size: 18,
                ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '1 (GM) Silver',
                style: gramST,
              ),
              Text(
                '₹ ${widget.data?.data?.silverG ?? ""}',
                style: gramrateST,
              ),
            ],
          ),
          double.parse(widget.data?.data?.silverRateDifference ?? "0.0") < 0
              ? Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.black,
                  size: 18,
                )
              : Icon(
                  Icons.arrow_upward_outlined,
                  color: Colors.red,
                  size: 18,
                ),
          // const SizedBox(width: 20,),
          // Text(
          //   'Platinum : ',
          //   style: gramST,
          // ),
          // Text(
          //   '₹ ${widget.data?.data?.platinum ?? ""}',
          //   style: gramrateST,
          // ),
        ],
      ),
    );
  }
}
