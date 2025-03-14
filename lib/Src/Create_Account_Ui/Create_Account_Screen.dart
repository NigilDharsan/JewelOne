import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jewelone/Common_Widgets/Common_Button.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/Common_Widgets/Text_Form_Field.dart';
import 'package:jewelone/Src/Login_Ui/LoginScreen.dart';
import 'package:jewelone/utilits/ApiProvider.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/Loading_Overlay.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class Create_Account_Screen extends ConsumerStatefulWidget {
  const Create_Account_Screen({super.key});

  @override
  ConsumerState<Create_Account_Screen> createState() =>
      _Create_Account_ScreenState();
}

class _Create_Account_ScreenState extends ConsumerState<Create_Account_Screen> {
  String NewPassword = '';
  String ReEnterPassword = '';

  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _LastName = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _ConfirmPassword = TextEditingController();
  TextEditingController _Dateofbirth = TextEditingController();

  bool _obscurePassword = true;
  bool _isChecked = false;

  //PASSWORD VISIBILITY FUNCTION
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  final _formKey = GlobalKey<FormState>();

  RegExp passwordSpecial =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).*$');
  RegExp passwordLength =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).{8,15}$');
  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      // appBar: Custom_AppBar(actions: [], isNav: true,),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: _MainBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _MainBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Back_Logo(context),

        //LOGO
        Center(child: Logo(context)),
        const SizedBox(
          height: 20,
        ),

        Heading_Text(context, Title: "Join Our Savings Scheme"),

        //FULL NAME
        // Title_Style(Title: 'Full name', isStatus: false),
        const SizedBox(height: 10),

        textFormField(
            hintText: 'Enter your first name',
            keyboardtype: TextInputType.text,
            inputFormatters: null,
            Controller: _fullName,
            validating: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter ${'Name'}";
              }
              if (!onlyText.hasMatch(value)) {
                return "Please Enter Your Name (Special Characters are Not Allowed)";
              }
              return null;
            },
            onChanged: null,
            prefixIcon: Icon(
              Icons.person,
              color: grey1,
            )),

        //LAST NAME
        // Title_Style(Title: 'Last name', isStatus: false),
        const SizedBox(height: 10),

        textFormField(
            hintText: 'Enter your last name',
            keyboardtype: TextInputType.text,
            inputFormatters: null,
            Controller: _LastName,
            validating: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter ${'Name'}";
              }
              if (!onlyText.hasMatch(value)) {
                return "Please Enter Your Name (Special Characters are Not Allowed)";
              }
              return null;
            },
            onChanged: null,
            prefixIcon: Icon(
              Icons.person,
              color: grey1,
            )),

        //Email
        // Title_Style(Title: 'Email', isStatus: false),
        const SizedBox(height: 10),

        textFormField(
            hintText: 'Enter your Email',
            keyboardtype: TextInputType.text,
            inputFormatters: null,
            Controller: _Email,
            validating: (value) {
              if (value!.isEmpty) {
                return "Please Enter a Email Address";
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return "Please Enter a Valid Email Address";
              }
              return null;
            },
            onChanged: null,
            prefixIcon: Icon(
              Icons.mail,
              color: grey1,
            )),

        // Phone Number Text and TextField
        // Title_Style(Title: 'Phone Number', isStatus: null),
        const SizedBox(height: 10),

        textFormField(
            // isEnabled: false,
            hintText: "Enter your mobile number",
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
            prefixIcon: Icon(
              Icons.phone_android_sharp,
              color: grey1,
            )),

        //DATE OF BIRTH
        // Title_Style(Title: 'Date of Birth', isStatus: true),
        const SizedBox(height: 10),

        TextFieldDatePickerF(
          context,
          Controller: _Dateofbirth,
          onChanged: null,
          hintText: '(dd/MM/yyyy)',
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
                  DateFormat("yyyy-MM-dd").format(pickedDate);
              if (mounted) {
                setState(() {
                  _Dateofbirth.text = formattedDate;
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
              DateTime selectedDate = DateFormat("yyyy-MM-dd").parse(value);
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

        //ENTER NEW PASSWORD
        // Title_Style(Title: 'Password', isStatus: true),
        const SizedBox(height: 10),

        textFormField(
            hintText: 'Password',
            keyboardtype: TextInputType.text,
            inputFormatters: null,
            Controller: _password,
            validating: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Valid ${'Password'}";
              }
              if (value == null) {
                return "Please Enter Valid ${'Password'}";
              }
              return null;
            },
            onChanged: (value) {
              NewPassword = value;
            },
            prefixIcon: Icon(
              Icons.lock,
              color: grey1,
            )),
        const SizedBox(height: 10),
        textFormField(
            hintText: 'Confirm Password',
            keyboardtype: TextInputType.text,
            inputFormatters: null,
            Controller: _ConfirmPassword,
            validating: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Valid ${'Password'}";
              }
              if (value != NewPassword) {
                return "Password does not match with password";
              }
              return null;
            },
            onChanged: (value) {
              ReEnterPassword = value;
            },
            prefixIcon: Icon(
              Icons.lock,
              color: grey1,
            )),
        const SizedBox(height: 15),

        CheckBoxes(context, value: _isChecked, onChanged: (value) {
          setState(() {
            setState(() => _isChecked = !_isChecked);
          });
        },
            onTap: () {},
            checkBoxText: 'I agree with the terms&condition',
            width: MediaQuery.sizeOf(context).width / 1.4),

        SizedBox(height: 15),

        // Sign up Button with Gradient
        CommonContainerButton(context, onPress: () async {
          if (_formKey.currentState!.validate()) {
            LoadingOverlay.show(context);

            final formData = {
              "firstname": _fullName.text,
              "lastname": _LastName.text,
              "email": _Email.text,
              "mobile": _phoneNumber.text,
              "date_of_birth": _Dateofbirth.text,
              "confirm_password": _ConfirmPassword.text,
            };

            final result = await ref.read(signupPostProvider(formData).future);
            LoadingOverlay.forcedStop();
            if (result?.status == true) {
              ShowToastMessage(result?.message ?? "");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else {
              // Handle failure
              ShowToastMessage(result?.message ?? "");
            }
          }
        }, titleName: 'Sign Up'),
        SizedBox(height: 16),

        // Don't have an account? Sign Up Now Text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: Sub_TextStyle,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                'Login',
                style: Sub_TextStyleBT,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }

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
                _Dateofbirth.text = "";
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
