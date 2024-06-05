import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Settings_Screen extends StatefulWidget {
  const Settings_Screen({super.key});

  @override
  State<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height/6,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            gradient1,
                            gradient2,
                          ]
                      ),
                    ),

                    //APP BAR CONTENTS
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,left: 15),
                          child: ImgPathSvg('backbutton.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,left: 15),
                          child: Text('Settings',style: appbarT,),
                        ),
                        const Spacer(),
                        ImgPathSvg('info.svg'),
                      ],
                    ),
                  ),

                  //PROFILE
                  Positioned(
                    top: 100,
                    left: 30,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('lib/assets/profileimage.png')),
                          borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                  ),
                ],
              ),

              //NAME CONTAINER
              Padding(
                padding: const EdgeInsets.only(top: 60,left: 20,right: 20,),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: white1,
                        border: Border.all(width: 1,color: grey5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Vinoth Kumar',style: TBlack2,),
                                const Spacer(),
                                ImgPathSvg('Edit.svg')
                              ],
                            ),
                            Text('+91 994413xxxx',style: rate2,)
                          ],
                        ),
                      ),
                    ),

                    //SETTINGS CONTAINER
                    Settingscontainer(context,text: 'Change Password', image: 'lock.svg', image2: 'rightarrow2.svg'),
                    Settingscontainer(context,text: 'KYC', image: 'kyc.svg', image2: 'rightarrow2.svg'),
                    Settingscontainer(context,text: 'About JewelOne', image: 'aboutjweleone.svg', image2: 'rightarrow2.svg'),
                  ],
                ),
              ),

              //TERMS AND CONDITIONS
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Terms & Conditions*',style:underline),
                    Text('Privacy Policy',style: underline),
                  ],
                ),
              ),
              //DIVIDER
              Divider(indent: 40,endIndent: 40,),

              Padding(
                padding: const EdgeInsets.only(top: 10,),
                child: Text('Follow us on',style: follow,),
              ),

              //SOCIAL MEDIAS
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50,top: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImgPathSvg('fb.svg'),
                    ImgPathSvg('x.svg'),
                    ImgPathSvg('pin.svg'),
                    ImgPathSvg('Instagram.svg'),
                    ImgPathSvg('youtube.svg'),
                  ],
                ),
              ),

              //BUTTON
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: CommonContainerButton(context,
                    onPress: () {
                      {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                      }
                    }, titleName: 'Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Settingscontainer (context,{required String text,required String image,required String image2}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: white1,
          border: Border.all(width: 1,color: grey5),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Row(
          children: [
            ImgPathSvg(image),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(text,style: rate2,),
            ),
            const Spacer(),
            ImgPathSvg(image2)
          ],
        ),
      ),
    ),
  );
}
