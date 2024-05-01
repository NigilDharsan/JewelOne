import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';


// PNG IMAGE PATH
Widget ImgPathPng(String pathPNG){
  return  Image(image: AssetImage("lib/assets/${pathPNG}"));
}


// SVG IMAGE PATH

Widget ImgPathSvg(String pathSVG){
  return  SvgPicture.asset("lib/assets/${pathSVG}");
}

// Logo Image
 Widget LoginScreenImage(){
  return ImgPathSvg("LoginscreenImg.svg");
 }
Widget Logo(){
  return ImgPathSvg("logo.svg");
}


//CANDIDATE IMAGE

Widget Candidate_Img({required String ImgPath}){
  return  Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage("lib/assets/$ImgPath"),
            fit: BoxFit.cover
        )
    ),
  );
}

// PROFILE IMG
Widget profileImg({required String ProfileImg}){
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 20,bottom: 11),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(image: AssetImage('lib/assets/${ProfileImg}'))
      ),
    ),
  );
}

//NODATA IMAGE
Widget noDataImg(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ImgPathPng('nodata.png'),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("Oops! No Data Available",),
      ),
    ],
  );
}