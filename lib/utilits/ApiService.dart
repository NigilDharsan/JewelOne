import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Model/BannerModel.dart';
import 'package:jewelone/Model/ForgotPasswwordModel.dart';
import 'package:jewelone/Model/GoldRateMmodel.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Model/SignUpModel.dart';
import 'package:jewelone/utilits/MakeApiCall.dart';
import 'ConstantsApi.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true)); // For debugging
  return dio;
});

class ApiService {
  final Dio _dio;
  ApiService(this._dio);


  //LOGIN
  Future<LoginModel> LoginApi(Map<String, dynamic> formData) async {
    final result = await requestPOST3(
        url: ConstantApi.loginUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //SIGNUP
  Future<SignUpModel> signupapi (Map<String, dynamic> formData) async {
    final result = await requestPOST3(
        url: ConstantApi.signupUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SignUpModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SignUpModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SignUpModel();
  }

  //FORGOT PASSWORD
  Future<Forgot_Password_Model> forgetpasswordapi (Map<String, dynamic> formData) async {
    final result = await requestPOST3(
        url: ConstantApi.forgetpasswordUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return Forgot_Password_Model?.fromJson(result["response"]);
    } else {
      try {
        var resultval = Forgot_Password_Model.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return Forgot_Password_Model();
  }

  //VERIFY OTP
  Future<Forgot_Password_Model> verifyotpapi (Map<String, dynamic> formData) async {
    final result = await requestPOST3(
        url: ConstantApi.forgetpasswordUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return Forgot_Password_Model?.fromJson(result["response"]);
    } else {
      try {
        var resultval = Forgot_Password_Model.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return Forgot_Password_Model();
  }

  //BANNER IMAGE
  Future<BannerModel> HomeBannerApi() async {
    final result = await requestGET(url: ConstantApi.bannerUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return BannerModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = BannerModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return BannerModel();
  }


  //BANNER IMAGE
  Future<GoldRateModel> GoldrateApi() async {
    final result = await requestGET(url: ConstantApi.goldrateUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return GoldRateModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = GoldRateModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return GoldRateModel();
  }

}
