import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Store_Locator_Screen extends StatefulWidget {
  const Store_Locator_Screen({super.key});

  @override
  State<Store_Locator_Screen> createState() => _Store_Locator_ScreenState();
}

class _Store_Locator_ScreenState extends State<Store_Locator_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Store Locator', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: _Mainboy(),
    );
  }

  Widget _Mainboy (){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shining Dawn is available at',style: locationT,),

              //LOCATION 1
              Location_Container(
                context,
                mainaddress: 'Coimbatore, Crosscut Road',
                address: '284 &, 285, Cross Cut Road, Gandhipuram, Tamil Nadu - 641012',
                number: '+91 82200 17613',
                image: 'lib/assets/location1.png',
              ),

              //LOCATION 2
              Location_Container(
                context,
                mainaddress: 'Chennai, Anna Nagar',
                address: 'JewelOne, Near Thirumangalam Metro station,233-235, 2nd Ave, L Block, Anna Nagar West,Chennai, Tamil Nadu 600040',
                number: '+91 97918 13222',
                image: 'lib/assets/location2.png',
              ),

              //LOCATION 3
              Location_Container(
                context,
                mainaddress: 'Vellore',
                address: '18/1, Anna Salai,, Opp Voorhees College,Vellore, Tamil Nadu 632001',
                number: '+91 82200 17613',
                image: 'lib/assets/location3.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Location_Container (context,{required String mainaddress,
  required String address,
  required String number,
  required String image
}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: white1,
          border: Border.all(width: 1,color: grey5),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [

          //IMAGE CONTAINER
          Container(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image))
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mainaddress,style: locationT1,),
                    ImgPathSvg('map.svg')
                  ],
                ),
                Divider(),

                Text(address,style: lighttext,),
                Row(
                  children: [

                    //PHONE
                    Text('Phone',style: lighttext,),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(number,style: location_Phone,),
                    ),
                  ],
                ),
                //TIMING
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('STORE HOURS: 09:30 A.M. - 08:30 P.M.',style: hours,),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
