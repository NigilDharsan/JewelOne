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
      backgroundColor: white1,
      // appBar: Custom_AppBar(actions: [],title: '', isBlue: false, isNav: false,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
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
                    child: Tab(
                      text: 'MESSAGES',
                    ),
                  ),
                  Container(
                    child: Tab(
                      text: 'NOTIFICATION',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 5,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  ImgPathSvg('noti.svg'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: MediaQuery.sizeOf(context).width/1.4,
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
