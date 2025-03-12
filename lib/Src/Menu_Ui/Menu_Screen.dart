import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/Contact_Us_Screen.dart';
import 'package:jewelone/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:jewelone/Src/Login_Ui/LoginScreen.dart';
import 'package:jewelone/Src/Notification_Ui/Notification_Screen.dart';
import 'package:jewelone/Src/Online_Emi_Payment_Ui/Online_Emi_Payment_Screen.dart';
import 'package:jewelone/Src/Payment_History_Ui/payment_History_Screen.dart';
import 'package:jewelone/Src/Security_Setting_Ui/Settings_Screen.dart';
import 'package:jewelone/Src/Store_Locator_Ui/Store_Locator_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Text_Style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu_Screen extends ConsumerStatefulWidget {
  Menu_Screen({
    super.key,
  });
  @override
  ConsumerState<Menu_Screen> createState() => _Menu_ScreenState();
}

class _Menu_ScreenState extends ConsumerState<Menu_Screen> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  void _clearSearch() {
    setState(() {});
  }

  Future<void> _handleLogout() async {
    await accessToken("");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _clearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 180,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        gradient1,
                        gradient2,
                      ]),
                ),
                //APP BAR CONTENTS
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
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
                                    image: AssetImage(
                                        'lib/assets/profileimage.png')),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                name,
                                style: profilT,
                              ),
                              Text(
                                phoneVal,
                                style: profilenum,
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ImgPathSvg('cancel.svg'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 30),
                child: Column(
                  children: [
                    Settingscontainer(context,
                        text: 'Home',
                        image: 'profilehome.svg',
                        image2: 'rightarrow2.svg', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_DashBoard_Screen()));
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              NavContainer(
                                  image1: 'notification2.svg',
                                  planST: 'Notifications',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Notification_Screen()));
                                  }),
                              // Divider(),
                              // NavContainer(
                              //     image1: 'wallet2.svg',
                              //     text: 'Wallet',
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   Wallet_screen()));
                              //     }),
                              Divider(),
                              NavContainer(
                                  image1: 'ema.svg',
                                  planST: 'Pay EMA',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Online_Emi_Payment_Screen(
                                                  selectedIndex: null,
                                                )));
                                  }),
                              Divider(),
                              NavContainer(
                                  image1: 'history.svg',
                                  planST: 'Payment History',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                payment_History_Screen()));
                                  }),
                              Divider(),
                              NavContainer(
                                  image1: 'settings.svg',
                                  planST: 'Settings',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Settings_Screen()));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              NavContainer(
                                  image1: 'storeL.svg',
                                  planST: 'Store Locator',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Store_Locator_Screen()));
                                  }),
                              Divider(),
                              NavContainer(
                                  image1: 'contact.svg',
                                  planST: 'Contact Us',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Contact_Us_Screen()));
                                  }),
                              // Divider(),
                              // NavContainer(
                              //     image1: 'faq.svg',
                              //     text: 'FAQs',
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   Faq_Screen()));
                              //     }),
                              // Divider(),
                              // NavContainer(
                              //     image1: 'support.svg',
                              //     text: 'Support',
                              //     onTap: () {}),
                              // Divider(),
                              // NavContainer(
                              //     image1: 'dth.svg',
                              //     text: 'DTH / Experience Center',
                              //     onTap: () {}),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Settingscontainer(context,
                        text: 'About Shaining Dawn',
                        image: 'aboutone.svg',
                        image2: 'rightarrow2.svg', onTap: () {
                      //Navigator.pop(context);
                    }),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Terms & Conditions*', style: underline),
                          Text('Privacy Policy', style: underline),
                        ],
                      ),
                    ),
                    //DIVIDER
                    // Divider(
                    //   indent: 25,
                    //   endIndent: 25,
                    // ),

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

                    //SOCIAL MEDIAS
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
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: buttonIcon(context, onPress: () {
                        _handleLogout;
                        {
                          Routes("false");
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (Route<dynamic> route) =>
                                false, // Removes all previous routes
                          );
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

Widget Settingscontainer(context,
    {required String text,
    required String image,
    required String image2,
    required void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
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

Widget NavContainer(
    {required String image1,
    required String planST,
    required void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ImgPathSvg(image1),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              planST,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold, // Optional for emphasis
              ),
            ),
          ),
          const Spacer(),
          ImgPathSvg('rightarrow2.svg')
        ],
      ),
    ),
  );
}
