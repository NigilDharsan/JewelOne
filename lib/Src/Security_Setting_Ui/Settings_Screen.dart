import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/Src/Login_Ui/LoginScreen.dart';
import 'package:jewelone/Src/Profile_Details_Ui/Profile_Details_Screen.dart';
import 'package:jewelone/Src/Security_Setting_Ui/Password_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Settings_Screen extends ConsumerStatefulWidget {
  Settings_Screen({
    super.key,
  });

  @override
  ConsumerState<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends ConsumerState<Settings_Screen> {
  @override
  String phoneVal = '';
  String name = '';

  Future<void> getDetails() async {
    String phval = await getCustomer_phone();
    String cusname = await getCustomer_name();
    setState(() {
      phoneVal = phval;
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
    return Scaffold(
      backgroundColor: white2,
      body: SingleChildScrollView(child: _Mainbody()),
    );
  }

  Widget _Mainbody() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 140,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          gradient1,
                          gradient2,
                        ]),
                  ),

                  //APP BAR CONTENTS
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 55, left: 15),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ImgPathSvg('backbutton.svg')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 55, left: 15),
                        child: Text(
                          'Settings',
                          style: appbarT,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Faq_Screen()));
                            },
                            child: ImgPathSvg('info.svg')),
                      ),
                    ],
                  ),
                ),

                //PROFILE
                Positioned(
                  top: 90,
                  left: 30,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('lib/assets/profileimage.png')),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ],
            ),

            //NAME CONTAINER
            Padding(
              padding: const EdgeInsets.only(
                top: 80,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: white1,
                      border: Border.all(width: 1, color: grey5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                name,
                                style: TBlack2,
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Profile_Details_Screen()));
                                  },
                                  child: ImgPathSvg('Edit.svg'))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              phoneVal,
                              style: rate2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //SETTINGS CONTAINER
                  Settingscontainer(context,
                      text: 'Change Password',
                      image: 'lock.svg',
                      image2: 'rightarrow2.svg', onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Password_Screen()));
                  }),
                  // Settingscontainer(context,text: 'KYC', image: 'kyc.svg', image2: 'rightarrow2.svg', onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>KYC_Screen()));
                  // }),
                ],
              ),
            ),

            //TERMS AND CONDITIONS
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Terms & Conditions*', style: underline),
                  Text('Privacy Policy', style: underline),
                ],
              ),
            ),
            //DIVIDER
            Divider(
              indent: 40,
              endIndent: 40,
            ),

            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 10,
            //   ),
            //   child: Center(
            //       child: Text(
            //     'Follow us on',
            //     style: follow,
            //   )),
            // ),

            // //SOCIAL MEDIAS
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 50,
            //     right: 50,
            //     top: 20,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ImgPathSvg('fb.svg'),
            //       ImgPathSvg('x.svg'),
            //       ImgPathSvg('pin.svg'),
            //       ImgPathSvg('Instagram.svg'),
            //       ImgPathSvg('youtube.svg'),
            //     ],
            //   ),
            // ),

            //BUTTON
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: buttonIcon(context, onPress: () async {
                {
                  await accessToken("");

                  Routes("false");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                }
              }, titleName: 'Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget Settingscontainer(context,
    {required String text,
    required String image,
    required String image2,
    required void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
    ),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: white1,
            border: Border.all(width: 1, color: grey5),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              ImgPathSvg(image),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: rate2,
                ),
              ),
              const Spacer(),
              ImgPathSvg(image2)
            ],
          ),
        ),
      ),
    ),
  );
}
