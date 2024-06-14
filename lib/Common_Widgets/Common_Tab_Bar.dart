import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

import 'Text_Form_Field.dart';

class TabBarWithSearch extends StatefulWidget {
  @override
  _TabBarWithSearchState createState() => _TabBarWithSearchState();
}

class _TabBarWithSearchState extends State<TabBarWithSearch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      // appBar: Custom_AppBar(actions: [],title: '', isBlue: false, isNav: false,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: white1,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                padding: EdgeInsets.only(left: 5, right: 5),
                labelStyle: maintext,
                // labelStyle: TabT,
                indicatorColor: Font_Primary_Color,
                unselectedLabelStyle: TabbarT,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Tab(
                            text: 'MESSAGES',
                          ),
                         Padding(
                           padding: const EdgeInsets.only(left: 10),
                           child: Container(height: 20,width: 20,
                             decoration: BoxDecoration(
                               color: Font_Primary_Color,
                               borderRadius: BorderRadius.circular(50)
                             ),
                             child: Center(child: Text('1',style: noticount,)),
                           ),
                         ),
                        ],
                      ),
                    )
                  ),
                  Container(
                    child: Row(
                      children: [
                        Tab(
                          text: 'NOTIFICATION',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(height: 20,width: 20,
                            decoration: BoxDecoration(
                                color: Font_Primary_Color,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(child: Text('1',style: noticount,)),
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 7,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImgPathSvg('noti.svg'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: MediaQuery.sizeOf(context).width/1.6,
                                            child: Text('To avail your XXXX05895  EMI amount is Rs. 5000 payable on 21-Feb-24 every...',style: phoneHT,)),
                                        Text('9 minutes ago',style: lighttext,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
