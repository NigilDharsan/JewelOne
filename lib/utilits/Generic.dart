import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Common_Colors.dart';

final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
String? accesstokens = 'accessToken';
String? userId = 'user_id';
String? userRole = 'user_role';
String? usercheckIN = 'user_checkin';

String Storage = 'storage';
String? routes = "routes_Log";

AndroidOptions _androidOptions() => AndroidOptions();
IOSOptions _getIOSOptions() => IOSOptions(
      accountName: Storage,
    );

void deleteAll() async {
  await _secureStorage.deleteAll(iOptions: _getIOSOptions());
}

accessToken(dynamic val) async {
  await _secureStorage.write(
      key: accesstokens!, value: val, aOptions: _androidOptions());
  print("val!:$val" + "$accesstokens");
}

Future<dynamic> getToken() async {
  final String? gettoken = await _secureStorage.read(
      key: accesstokens!, aOptions: _androidOptions());
  print("valu:$gettoken");
  return gettoken!;
}

UserId(dynamic val) async {
  await _secureStorage.write(
      key: userId!, value: val!, aOptions: _androidOptions());
  print("value!:${val!}" + "$userId");
}

Future<dynamic> getuserId() async {
  dynamic user_id =
      await _secureStorage.read(key: userId!, aOptions: _androidOptions());
  print("valuesss:$user_id");
  return user_id;
}

UserRole(dynamic val) async {
  await _secureStorage.write(
      key: userRole!, value: val!, aOptions: _androidOptions());
  print("value!:${val!}" + "$userRole");
}

Future<dynamic> getUserRole() async {
  dynamic user_id =
      await _secureStorage.read(key: userRole!, aOptions: _androidOptions());
  print("valuesss:$user_id");
  return user_id;
}

UsercheckIN(dynamic val) async {
  await _secureStorage.write(
      key: usercheckIN!, value: val!, aOptions: _androidOptions());
  print("value!:${val!}" + "$usercheckIN");
}

Future<dynamic> getUsercheckIN() async {
  dynamic user_id =
      await _secureStorage.read(key: usercheckIN!, aOptions: _androidOptions());
  print("valuesss:$user_id");
  return user_id;
}

Routes(dynamic val) async {
  await _secureStorage.write(
      key: routes!, value: val!, aOptions: _androidOptions());
  print("valuesss:$routes");
  return routes;
}

Future<dynamic> getRoutes() async {
  dynamic routes_Log =
      await _secureStorage.read(key: routes!, aOptions: _androidOptions());
  print("valuesss:$routes_Log");
  return routes_Log;
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

void ShowToastMessage(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0);

class GetterSetter {
  String? _myValue;

  String get myValue {
    return _myValue ?? "";
  }

  set myValue(String value) {
    _myValue = value;
  }
}

class SingleTon {
  static final SingleTon qwerty = SingleTon._internal();
  factory SingleTon() {
    return qwerty;
  }
  SingleTon._internal();
  String setLocation = "";
  String lattidue = "";
  String longitude = "";
  bool isLoading = true;
}

Widget buildLoadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: SpinKitWave(
        type: SpinKitWaveType.center,
        size: 50,
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? blue3 : Colors.black,
            ),
          );
        },
      ),
    ),
  );
}

// Future<void> readall() async{
// final all =await _secureStorage.readAll(aOptions: _androidOptions());
// }

// void tokenVal(tokens, farmerId) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString("tokenval", tokens);
//   await prefs.setInt("farmerID", farmerId);
//   final _tokenval = await prefs.getString("tokenval");
//   final _idVal = await prefs.getInt("farmerID");
//   print(_tokenval);
//   print(_idVal);
// }


