import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:jewelone/Model/ActiveLocationMOdel.dart';
import 'package:jewelone/Model/ActivePlanModel.dart';
import 'package:jewelone/Model/BannerModel.dart';
import 'package:jewelone/Model/ClosedAccountModel.dart';
import 'package:jewelone/Model/ForgotPasswwordModel.dart';
import 'package:jewelone/Model/GoldRateMmodel.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Model/MyPlanModel.dart';
import 'package:jewelone/Model/PaymentCreateModel.dart';
import 'package:jewelone/Model/PaymentHistoryModel.dart';
import 'package:jewelone/Model/SignUpModel.dart';
import 'package:jewelone/utilits/Generic.dart';
import 'package:jewelone/utilits/MakeApiCall.dart';

import 'ConstantsApi.dart';

// final dioProvider = Provider<Dio>((ref) {
//   final dio = Dio();
//   dio.interceptors.add(LogInterceptor(responseBody: true)); // For debugging
//   return dio;
// });

final httpClientProvider = Provider<http.Client>((ref) {
  // You can add any custom configuration if needed
  return http.Client();
});

class ApiService {
  final http.Client _dio;
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
  Future<SignUpModel> signupapi(Map<String, dynamic> formData) async {
    final result =
        await requestPOST2(url: ConstantApi.signupUrl, formData: formData);
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
  Future<Forgot_Password_Model> forgetpasswordapi(
      Map<String, dynamic> formData) async {
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
  Future<Forgot_Password_Model> verifyotpapi(
      Map<String, dynamic> formData) async {
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

  Future<Forgot_Password_Model> BuyNewPlanapi(
      Map<String, dynamic> formData) async {
    final result = await requestPOST(
        url: ConstantApi.buynewplanUrl, formData: formData, dio: _dio);
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
  Future<BannerImageModel> HomeBannerApi() async {
    final result = await requestGET(url: ConstantApi.bannerUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return BannerImageModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = BannerImageModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return BannerImageModel();
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

  //ACTIVE LOCATION
  Future<ActiveLocationModel> ActivelocationApi() async {
    final result =
        await requestGET(url: ConstantApi.activelocationUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return ActiveLocationModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = ActiveLocationModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return ActiveLocationModel();
  }

  //MY PLANS
  Future<MyPlanModel> MyplanApi() async {
    var formData = <String, dynamic>{
      "customer": await getCustomer_Id(),
    };

    final result = await requestPOST(
        url: ConstantApi.myplanUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return MyPlanModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = MyPlanModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return MyPlanModel();
  }

  //ACTIVE PLANS
  Future<ActivePlanModel> ActiveplanApi() async {
    final result = await requestGET(url: ConstantApi.activeplanUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return ActivePlanModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = ActivePlanModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return ActivePlanModel();
  }

  //PAYMENT HISTORY
  Future<PaymentHistoryModel> PaymenthistoryApi() async {
    var formData = <String, dynamic>{
      "id_customer": await getCustomer_Id(),
    };

    final result = await requestPOST(
        url: ConstantApi.paymenthistoryUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return PaymentHistoryModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = PaymentHistoryModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return PaymentHistoryModel();
  }

  //PAYMENT HISTORY
  Future<PaymentHistoryModel> paymentHistorySchemeApi(
      int scheme_account) async {
    var formData = <String, dynamic>{
      "id_customer": await getCustomer_Id(),
      "id_scheme_account": "${scheme_account}"
    };

    final result = await requestPOST(
        url: ConstantApi.paymenthistoryUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return PaymentHistoryModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = PaymentHistoryModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return PaymentHistoryModel();
  }

  //CLOSED ACCOUNT
  Future<ClosedAccountModel> closedAccountApi() async {
    final result = await requestGET(
        url: ConstantApi.accountCloseUrl +
            "?id_customer=${await getCustomer_Id()}",
        dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return ClosedAccountModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = ClosedAccountModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return ClosedAccountModel();
  }

  //PAYEMNT API
  Future<PaymentCreateModel> PaymentApi(
      List<Map<String, dynamic>> formData) async {
    String jsonString = jsonEncode(formData); // Correct for API body

    final result = await requestPOST4(
        url: ConstantApi.paymentUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return PaymentCreateModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = PaymentCreateModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return PaymentCreateModel();
  }
}
