import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Menu_Screen extends StatefulWidget {
  const Menu_Screen({super.key});

  @override
  State<Menu_Screen> createState() => _Menu_ScreenState();
}

class _Menu_ScreenState extends State<Menu_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                     bottomRight: Radius.circular(20),
                     bottomLeft: Radius.circular(20)
                   ),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('lib/assets/profileimage.png')),
                                borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20,),
                              Text('Vinoth Kumar',style: profilT,),
                              Text('+91 99441x xxxxx',style: profilenum,),
                            ],
                          ),
                          const Spacer(),
                          ImgPathSvg('cancel.svg')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 30),
                child: Column(
                  children: [
                    Settingscontainer(context,text: 'Home', image: 'profilehome.svg', image2: 'rightarrow2.svg'),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          child: Column(
                            children: [
                              NavContainer(image1: 'notification2.svg', text: 'Notifications'),
                              Divider(),
                              NavContainer(image1: 'wallet2.svg', text: 'Wallet'),
                              Divider(),
                              NavContainer(image1: 'ema.svg', text: 'Pay EMA'),
                              Divider(),
                              NavContainer(image1: 'history.svg', text: 'Payment History'),
                              Divider(),
                              NavContainer(image1: 'settings.svg', text: 'Settings'),
                            ],
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          child: Column(
                            children: [
                              NavContainer(image1: 'storeL.svg', text: 'Store Locator'),
                              Divider(),
                              NavContainer(image1: 'contact.svg', text: 'Contact Us'),
                              Divider(),
                              NavContainer(image1: 'faq.svg', text: 'FAQs'),
                              Divider(),
                              NavContainer(image1: 'support.svg', text: 'Support'),
                              Divider(),
                              NavContainer(image1: 'dth.svg', text: 'DTH / Experience Center'),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Settingscontainer(context,text: 'Home', image: 'aboutone.svg', image2: 'rightarrow2.svg'),

                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 20,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Terms & Conditions*',style:underline),
                          Text('Privacy Policy',style: underline),
                        ],
                      ),
                    ),
                    //DIVIDER
                    Divider(indent: 25,endIndent: 25,),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,),
                      child: Center(child: Text('Follow us on',style: follow,)),
                    ),

                    //SOCIAL MEDIAS
                    Padding(
                      padding: const EdgeInsets.only(left: 50,right: 50,top: 20,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: buttonIcon(context,
                          onPress: () {
                            {
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                            }
                          }, titleName: 'Logout'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget Settingscontainer (context,{required String text,required String image,required String image2}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
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

Widget NavContainer ({required String image1,required String text}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: Row(
      children: [
        ImgPathSvg(image1),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(text),
        ),
        const Spacer(),
        ImgPathSvg('rightarrow2.svg')
      ],
    ),
  );
}