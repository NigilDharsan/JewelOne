import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Store_Locator_Screen extends ConsumerStatefulWidget {
  const Store_Locator_Screen({super.key});

  @override
  ConsumerState<Store_Locator_Screen> createState() => _Store_Locator_ScreenState();
}

class _Store_Locator_ScreenState extends ConsumerState<Store_Locator_Screen> {
  @override
  Widget build(BuildContext context) {
    final activelocationdata = ref.watch(ActivelocationProvider);
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Store Locator', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: activelocationdata.when(data: (data){
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 30),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shining Dawn is available at',style: locationT,),

                  ListView.builder(
                    itemCount: data?.data?.length ?? 0,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Location_Container(
                        context,
                        mainaddress: "${data?.data?[index]?.address1 ?? ""} ",
                        address: "${data?.data?[index]?.address2 ?? ""} ",
                        number: "${data?.data?[index]?.mobile ?? ""} ",
                        image: 'lib/assets/location3.png',
                        timing: "STORE HOURS : ${data?.data?[index]?.stoneHours ?? ""} ",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }, error: (Object error, StackTrace stackTrace) {
        return Text("ERROR");
      }, loading: (){
        return Center(child: CircularProgressIndicator());
      })


    );
  }
}

Widget Location_Container (context,{required String mainaddress,
  required String address,
  required String number,
  required String image,
  required String timing,
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
                    // ImgPathSvg('map.svg')
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
                  child: Text(timing,style: hours,),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
