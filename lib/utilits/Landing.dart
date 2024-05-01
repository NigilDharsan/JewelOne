import 'package:flutter/material.dart';

import 'Generic.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String _isLoggedIn = "false";

  @override
  void initState() {
    super.initState();
    initialize();
    _loadUserInfo();
  }

  void initialize() async {
    await Future.delayed(Duration(seconds: 1));
    // FlutterNativeSplash.remove();
  }

  _loadUserInfo() async {
    final routesData = await getRoutes();
    routesData != null ? _isLoggedIn = routesData : _isLoggedIn = "false";
    if (_isLoggedIn == "true") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/home'));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
