import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Common_Card.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Model/GoldRateMmodel.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Src/Menu_Ui/Menu_Screen.dart';
import 'package:jewelone/Src/My_SSP_Ui/My_SSP_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Screen.dart';
import 'package:jewelone/Src/Notification_Ui/Notification_Screen.dart';
import 'package:jewelone/Src/Online_Emi_Payment_Ui/Online_Emi_Payment_Screen.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utilits/Loading_Overlay.dart';
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
    //final bannerimagedata = ref.watch(BannerDataProvider);
    // final activelocationdata = ref.watch(ActivelocationProvider);
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
                    myplandata.when(data: (data){
                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 238,
                        child: ListView.builder(
                            itemCount: data?.data?.length ?? 0,
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index){
                              final cardWidth = data?.data?.length == 1
                                  ? MediaQuery.sizeOf(context).width / 1.1
                                  : MediaQuery.sizeOf(context).width / 1.3;
                              return Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 10,right: 15),
                                child: Wallet_Card(
                                  width: cardWidth,
                                  context,
                                  customername: "Hi ${name}",
                                  Acnumval: "${data?.data?[index].idSchemeAccount ?? ""}",
                                  totalpaidval: "${data?.data?[index].paidAmount ?? ""}",
                                  totaccval: '120',
                                  noofpaidval: "${data?.data?[index].paidInstallments ?? ""}",
                                ),
                              );
                            }
                        ),
                      );
                    }, error: (Object error, StackTrace stackTrace){
                      return Text('ERROR');
                    }, loading: (){
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
                                            Online_Emi_Payment_Screen()));
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
                                showDialog(
                                    context: (context),
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text(
                                          "Are you sure to close your account",
                                          style: radioST,
                                        ),
                                        actions: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                child: Text(
                                                  "Cancel",
                                                  style: radioST,
                                                ),
                                              )),
                                          const SizedBox(width: 10),
                                          InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                LoadingOverlay.show(context);
                                                final result = await ref.read(
                                                    closedaccountProvider
                                                        .future);
                                                LoadingOverlay.forcedStop();

                                                if (result?.status == true) {
                                                } else {}
                                              },
                                              child: Container(
                                                child: Text(
                                                  "Ok",
                                                  style: radioST,
                                                ),
                                              ))
                                        ],
                                      );
                                    });
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
                                items: [
                                  _carouselImg(context),
                                  _carouselImg(context),
                                  _carouselImg(context),
                                  _carouselImg(context),
                                ],
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
                                count: 4,
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
                    ),
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
Widget _carouselImg(context) {
  return Container(
    height: 185,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
          image: AssetImage("lib/assets/homedashboardimage.png"),
          fit: BoxFit.cover),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1 GRM (22KT) Gold : ',
            style: gramST,
          ),
          Text(
            '₹ ${widget.data?.data?.gold22ct ?? ""} ',
            style: gramrateST,
          ),
           double.parse(widget?.data?.data?.goldRateDifference ?? "0.0") < 0 ?
          Icon(Icons.arrow_downward_outlined,color: Colors.green,size: 18,) :
           Icon(Icons.arrow_upward_outlined,color: Colors.red,size: 18,),

          const Spacer(),

          Text(
            '1 (GRM) Silver : ',
            style: gramST,
          ),
          Text(
            '₹ ${widget.data?.data?.silverG ?? ""}',
            style: gramrateST,
          ),
          Icon(Icons.arrow_downward_outlined,color: Colors.black,size: 18,)
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
