import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Plan1_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Plan2_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Plan3_Screen.dart';
import 'package:jewelone/Src/New_SSP_Ui/New_SSP_Plan4_Screen.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Common_Widgets/Common_Button.dart';
import '../../utilits/Common_Colors.dart';
class New_SSP_Screen extends StatefulWidget {
  const New_SSP_Screen({super.key});

  @override
  State<New_SSP_Screen> createState() => _New_SSP_ScreenState();
}

class _New_SSP_ScreenState extends State<New_SSP_Screen> {
  int myCurrentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'New Purchase Plan', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },),
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
        child: Column(
          children: [
            //BANNER
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
                  autoPlayAnimationDuration:Duration(milliseconds: 700),
                  onPageChanged: (index,reason){
                    setState(() {
                      myCurrentPage = index;
                    });
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 10),
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: myCurrentPage,
                  count: 4,
                  effect: ExpandingDotsEffect(
                      dotHeight: 5,
                      dotWidth: 5,
                      activeDotColor: gradient2
                  ),
                ),
              ),
            ),

            //JOIN NOW CONTAINER
            Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: white1,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10,right: 10,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImgPathSvg('Rupees.svg'),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Plan 1",style: plan1,),
                        Container(
                            width: MediaQuery.sizeOf(context).width/2.5,
                            child: Text('Gold Ornaments Purchase Advance Scheme',style: lighttext,maxLines: 2,)),
                      ],
                    ),
                    const Spacer(),
                    Paynowcommonbutton1 (context,
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>New_SSP_Plan1_Screen()));
                        }, titleName: 'Join Now')
                  ],
                ),
              ),
            ),

            //REGISTER NOW CONTAINERS
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>New_SSP_Plan2_Screen()));
                },
                child: plancontainer(context, texts: 'Plan 2', planname: 'One-Time Lump-Sum Advance Plan')),


            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>New_SSP_Plan3_Screen()));
                },
                child: plancontainer(context, texts: 'Plan 3', planname: 'Old Gold Advance Plan')),


            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>New_SSP_Plan4_Screen()));
                },
                child: plancontainer(context, texts: 'Plan 4', planname: 'Wedding Jewellery Plan')),
          ],
        ),
      ),
    );
  }
}

//CAROUSEL IMG STACK
Widget _carouselImg(context){
  return Padding(
    padding: const EdgeInsets.only(left: 10,right: 10),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage('lib/assets/New_SSP_Banner.png'),
            fit: BoxFit.cover),
      ),
    ),
  );
}

//REGISTER NOW CONTAINER
Widget plancontainer (context,{required String texts,required String planname}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: white1,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10,left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ImgPathSvg('Rupees.svg'),
            ),
            //const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(texts,style: plan1,),
                Container(
                    width: MediaQuery.sizeOf(context).width/2.8,
                    child: Text(planname,style: lighttext,maxLines: 2,)),
              ],
            ),
            const Spacer(),
            Text('Register Now ',style: colortexts,),
            Icon(Icons.arrow_forward_ios,color: arrow,size: 20,),
          ],
        ),
      ),
    ),
  );
}
