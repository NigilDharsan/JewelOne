import 'package:flutter/material.dart';
import 'package:jewelone/Common_Widgets/Image_Path.dart';
import 'package:jewelone/utilits/Common_Colors.dart';
import 'package:jewelone/utilits/Text_Style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'lib/assets/background_img.png'), // Change to your SVG image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Your image goes here
              SizedBox(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Skip Login',
                      style: BlackTextColor,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: BlackNormal,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: ImgPathSvg("logo.svg"),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Back Text
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Phone Number Text and TextField
                    Text('Phone Number'),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      height: 52,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Password Text and TextField
                    Text('Password'),
                    SizedBox(height: 10),

                    Container(
                      color: Colors.white,
                      height: 52,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 16),

                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Text(
                          'Remember me',
                          style: BlackTextColorLowSize,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            // Implement forget password action
                          },
                          child: Text(
                            'Forgot Password?',
                            style: BlackTextColorLowSize,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Login Button with Gradient
                    Container(
                      height: 58,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(159, 33, 44, 1),
                            Color.fromARGB(238, 238, 79, 1)
                          ], // Change gradient colors as needed
                        ),
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement login action
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(159, 33, 79, 1),

                          //rgba(159, 33, 44, 0.25)
                          elevation: 0,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Don't have an account? Sign Up Now Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don’t have an account? '),
                        InkWell(
                          onTap: () {
                            // Implement sign up action
                          },
                          child: Text(
                            'Sign Up Now',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),

                    // Trouble Logging in? Please call: Text
                    Center(
                        child: Text(
                      'Trouble Logging in? Please call:',
                      style: BlackTextColor,
                    )),
                    SizedBox(height: 16),

                    // Icon and Trouble Logging in? Please call: Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.call),
                        ImgPathSvg('Call.svg'),
                        SizedBox(width: 8),
                        Text('18001033916'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
