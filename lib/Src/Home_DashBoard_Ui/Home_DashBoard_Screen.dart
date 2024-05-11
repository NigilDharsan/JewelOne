import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Card.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home_DashBoard_Screen extends StatefulWidget {
  const Home_DashBoard_Screen({super.key});

  @override
  State<Home_DashBoard_Screen> createState() => _Home_DashBoard_ScreenState();
}

class _Home_DashBoard_ScreenState extends State<Home_DashBoard_Screen> {
  final List<String> items = ['Coimbatore', 'Salem', 'Chennai'];
  String selectedItem = 'Coimbatore';
  int myCurrentPage = 0;

  final ScrollController _scrollController = ScrollController();
  int _counter = 0;
  late Timer _timer;
  final double itemWidth = 100.0; // Width of each item
  final double scrollIncrement = 1.0; // Scroll increment for each timer tick

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      _scrollList();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _scrollList() {
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScrollExtent) {
      _scrollController.jumpTo(0);
      _counter = 0;
    } else {
      _scrollController.jumpTo(currentScroll + scrollIncrement);
      _counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: white2,
        toolbarHeight: 140,
        leading: Icon(Icons.menu_outlined),
        centerTitle: true,
        title: Container(
          child: ImgPathSvg('logo.svg'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 15),
            child: InkWell(
                onTap: () {},
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
              _Location_Dropdown(),
          
              //GOLD PRICE SCROLL
              _Gold_Scroll_Price(),
          
          
              Container(
                margin: EdgeInsets.only(top: 15),
                color: white2,
                child: Column(
                  children: [
                    //PLAN CARD
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Plan_Card(context, Img: 'plan1.svg', planT: 'Online EMI Payment',),
                          Plan_Card(context, Img: 'plan2.svg', planT: 'New Swarna Sakthi Purchase Plan',),
                          Plan_Card(context, Img: 'plan3.svg', planT: 'My Swarna Sakthi Plan',),
                        ],
                      ),
                    ),
                    //WALLET
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: Wallet_Card(context),
                    ),
                    //CAROSEL BANNER
                    Container(
                      color: white1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            //CAROSEL SLIDER
                            CarouselSlider(
                                items: [
                                  _carouselImg(context,),
                                  _carouselImg(context,),
                                  _carouselImg(context,),
                                  _carouselImg(context,),
                                ],
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  aspectRatio: 16/9,
                                  autoPlayAnimationDuration:Duration(milliseconds: 800),
                                  onPageChanged: (index,reason){
                                    setState(() {
                                      myCurrentPage = index;
                                    });
                                  },
                                )),
                            const SizedBox(height: 10,),
                            Center(
                              child: AnimatedSmoothIndicator(
                                activeIndex: myCurrentPage,
                                count: 4,
                                effect: ExpandingDotsEffect(
                                    dotHeight: 5,
                                    dotWidth: 5,
                                    activeDotColor: gradient1
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),

                          ],
                        ),
                      ),
                    ),

                    //GOLD PRICE SCROLL
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 50),
                      child: _Gold_Scroll_Price(),
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
Widget _Location_Dropdown(){
    return  Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Today Gold Rate -",style: skip_ST,),
            Text('Coimbatore',style: dropDownST,),
            Icon(Icons.keyboard_arrow_down_outlined,color: gradient1,size: 30,),
          ],
        ),
      ),
    );
}

//GOLD PRICE SCROLL
Widget _Gold_Scroll_Price(){
    return Container(
      height: 40,
      color: white1,
      child:  Center(
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.only(right: 15,left: 10),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      '1 GRM (22KT) Gold : ',
                      style: gramST,
                    ),
                    Text(
                      '₹5800.00',
                      style: gramrateST,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
}
}


//CAROUSEL IMG STACK
Widget _carouselImg(context){
  return Container(
    height: 185,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage('lib/assets/banner1.png'),
      fit: BoxFit.cover),

    ),

  );
}