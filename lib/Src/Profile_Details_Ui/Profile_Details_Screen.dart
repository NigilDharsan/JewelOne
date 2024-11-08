import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Custom_App_Bar.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/FAQ_Ui/FAQ_Screen.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';
class Profile_Details_Screen extends StatefulWidget {
  const Profile_Details_Screen({super.key});

  @override
  State<Profile_Details_Screen> createState() => _Profile_Details_ScreenState();
}

class _Profile_Details_ScreenState extends State<Profile_Details_Screen> {

  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _Dob = TextEditingController();
  TextEditingController _Wedding = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _nomineename = TextEditingController();
  TextEditingController _nomineeNumber = TextEditingController();


  //MR/MRS
  String? mrmrsVal;
  List<String> mrmrsOption = [
    "Mr",
    "Mrs",
  ];

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                _Dob.text = "";
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: Custom_AppBar(isNav: true, isTwoLine: false, title1: 'Edit Profile', title2: '',
        actionLogo: 'info.svg', isWhite: false,
        ActiononTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_Screen()));
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //MR/MRS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(text: 'Mr / Mrs'),
                        dropDownFieldRightArrow(
                          context,
                          width: MediaQuery.sizeOf(context).width/4,
                          hintT: 'Mr',
                          value: mrmrsVal,
                          listValue: mrmrsOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              mrmrsVal = newValue;
                            });
                          },
                        ),
                      ],
                    ),

                    //USER NAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(text: 'User name'),
                        Container(
                          width: MediaQuery.sizeOf(context).width/1.6,
                          child: textFormField_border(
                            // isEnabled: false,
                            hintText: "Vinoth Kumar",
                            keyboardtype: TextInputType.text,
                            Controller: _username,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter],
                            validating: (value) {
                              if (value
                                  == null || value.isEmpty) {
                                return "Please Enter user Name";
                              }
                              else if (!onlyText.hasMatch(value)) {
                                return "Please Enter User Name (Special Characters are Not Allowed)";
                              }
                              return null;
                            },
                            onChanged: null,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                //EMAIL
                Heading(text: 'Email'),
                textFormField_border(hintText: 'vinothkumar@brightbridgeinfotech.com',
                  keyboardtype: TextInputType.text,

                  Controller: _email,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter],
                  onChanged: null,
                  validating: (value){
                    if(value==null||value.isEmpty){
                      return "Enter Email";
                    }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                      return "Please Enter valid Email ";
                    }else{
                      return null;
                    }
                  },
                ),

                //PHONE NUMBER
                Heading(text: 'Phone number'),
                textFormField_border(
                  // isEnabled: false,
                    hintText: "994413xxxx",
                    keyboardtype: TextInputType.phone,
                    Controller: _phoneNumber,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: null,
                    validating: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Phone Number';
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit Phone Number';
                      }
                      return null;
                    },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //DATE OF BIRTH
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(text: 'Date of birth'),
                        TextFieldDatePickerprofile(
                          Controller: _Dob,
                          onChanged: null,
                          hintText: 'dd/MM/yyyy',
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              String formattedDate =
                              DateFormat("dd/MM/yyyy").format(pickedDate);
                              if (mounted) {
                                setState(() {
                                  _Dob.text = formattedDate;
                                });
                              }
                              DateTime currentDate = DateTime.now();
                              int age = currentDate.year - pickedDate.year;
                              if (age < 18) {
                                _showErrorDialog(
                                    "You must be at least 18 years old to register.");
                              }
                            }
                          },
                          validating: (value) {
                            if (value!.isEmpty) {
                              return 'Please Select Date of Birth';
                            } else {
                              DateTime selectedDate =
                              DateFormat("dd/MM/yyyy").parse(value);
                              DateTime currentDate = DateTime.now();
                              int age = currentDate.year - selectedDate.year;
                              if (age < 18) {
                                return 'You must be at least 18 years old to register.';
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                      ],
                    ),

                    //WEDDING DATE
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(text: 'Wedding date'),
                        TextFieldDatePickerprofile(
                          Controller: _Wedding,
                          onChanged: null,
                          hintText: 'dd/MM/yyyy',
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              String formattedDate =
                              DateFormat("dd/MM/yyyy").format(pickedDate);
                              if (mounted) {
                                setState(() {
                                  _Wedding.text = formattedDate;
                                });
                              }
                              DateTime currentDate = DateTime.now();
                              int age = currentDate.year - pickedDate.year;
                              if (age < 18) {
                                _showErrorDialog(
                                    "You must be at least 18 years old to register.");
                              }
                            }
                          },
                          validating: (value) {
                            if (value!.isEmpty) {
                              return 'Please Select Date of Birth';
                            } else {
                              DateTime selectedDate =
                              DateFormat("dd/MM/yyyy").parse(value);
                              DateTime currentDate = DateTime.now();
                              int age = currentDate.year - selectedDate.year;
                              if (age < 18) {
                                return 'You must be at least 18 years old to register.';
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),

                //ADDRESS
                Heading(text: 'Address'),
                textfieldDescription(hintText: 'Address'),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //COUNTRY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(text: 'Country'),
                        Container(
                          //height: 50,
                          width: MediaQuery.sizeOf(context).width/2.3,
                          decoration: BoxDecoration(
                            color: white1,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1,color: borderclr)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8,bottom: 8,),
                            child: CountryListPick(
                              initialSelection: '+91',
                              onChanged: (CountryCode? CountryCode){
                              },
                              theme: CountryTheme(
                                initialSelection: '+91',
                                isShowCode: false,
                                isShowTitle: true,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    //CITY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(text: 'City'),
                        Container(
                          width: MediaQuery.sizeOf(context).width/2.3,
                          child: textFormField_border(
                            // isEnabled: false,
                            hintText: "City",
                            keyboardtype: TextInputType.text,
                            Controller: _city,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter],
                            validating: (value) {
                              if (value
                                  == null || value.isEmpty) {
                                return "Please Enter Your City";
                              }
                              else if (!onlyText.hasMatch(value)) {
                                return "Please Enter Your City (Special Characters are Not Allowed)";
                              }
                              return null;
                            },
                            onChanged: null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),



                //NOMINEE NAME
                Heading(text: 'Nominee name'),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: textFormField_border(
                    // isEnabled: false,
                    hintText: "Nominee name",
                    keyboardtype: TextInputType.text,
                    Controller: _nomineename,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter],
                    validating: (value) {
                      if (value
                          == null || value.isEmpty) {
                        return "Please Enter Nominee Name";
                      }
                      else if (!onlyText.hasMatch(value)) {
                        return "Please Enter Nominee Name (Special Characters are Not Allowed)";
                      }
                      return null;
                    },
                    onChanged: null,
                  ),
                ),

                //NOMINEE PHONE NUMBER
                Heading(text: 'Nominee phone number'),
                textFormField_border(
                  // isEnabled: false,
                  hintText: "994413xxxx",
                  keyboardtype: TextInputType.phone,
                  Controller: _nomineeNumber,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: null,
                  validating: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Nominee phone number';
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit Phone Number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 50,),
                //SAVE BUTTON
                CommonContainerButton(context,
                    onPress: () {
                      if(_formKey.currentState!.validate())
                      {
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                      }
                    }, titleName: 'Save'),

                //DELETE TEXT
                deleteT(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Heading ({required String text}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: Text(text,style: phoneHT,),
  );
}

Widget deleteT (){
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImgPathSvg('delete.svg'),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text('Delete Account',style: delete,),
        ),
      ],
    ),
  );
}
