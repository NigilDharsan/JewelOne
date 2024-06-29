import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Model/LoginModel.dart';
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

  T _fromJson<T>(dynamic json) {
    // if (json != null) {
    //   if (T == LoginModel) {
    //     return LoginModel.fromJson(json) as T;
    //   } else if (T == SuccessModel) {
    //     return SuccessModel.fromJson(json) as T;
    //   }
    // }
    // else {
    //   final jsonResponse = {
    //     'status': false,
    //     'message': ConstantApi.SOMETHING_WRONG, //Server not responding
    //   };
    //   json = jsonResponse;
    // }

    // Add more conditionals for other model classes as needed
    throw Exception("Unknown model type");
  }

  Future<T> _requestGET<T>(BuildContext context, String path) async {
    try {
      final response = await _dio.get(path);
      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.
      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here
      throw e;
    }
  }

  Future<T> _requestPOST<T>(
    String path, {
    FormData? data,
  }) async {
    try {
      final response = await _dio.post(path, data: data);

      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here

      throw e;
    }
  }

  Future<T> _requestPOST1<T>(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(path, data: data);

      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here

      throw e;
    }
  }

  Future<T> _requestPOST2<T>(
    String path, {
    FormData? data,
  }) async {
    try {
      final response = await _dio.put(path, data: data);

      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here

      throw e;
    }
  }

  Future<dynamic> get<T>(BuildContext context, String path) async {
    return _requestGET<T>(context, path);
  }

  Future<T> post<T>(String path, FormData data) async {
    return _requestPOST<T>(path, data: data);
  }

  Future<T> post1<T>(String path, Map<String, dynamic> data) async {
    return _requestPOST1<T>(path, data: data);
  }

  Future<T> post2<T>(String path, FormData data) async {
    return _requestPOST2<T>(path, data: data);
  }

  Future<LoginModel> LoginApi(FormData formData) async {
    final result = await requestMultiPart(
        url: ConstantApi.servicesStore, formData: formData);
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

  // Future<T> login<T>(String path, FormData data) async {
  //   Dio dio = Dio();

  //   dio.options = BaseOptions(
  //     baseUrl: ConstantApi.SERVER_ONE, // Your base URL
  //     validateStatus: (status) {
  //       // Return true if the status code is between 200 and 299 (inclusive)
  //       // Return false if you want to throw an error for this status code
  //       return status! >= 200 && status < 300 || status == 404;
  //     },
  //   );

  //   try {
  //     Response response = await dio.post(path, data: data);
  //     // Handle successful response

  //     print(response.data);
  //     return _fromJson<T>(response.data);
  //   } on DioException catch (e) {
  //     if (e.response != null && e.response!.statusCode == 404) {
  //       // Handle 404 error

  //       print('Resource not found');
  //       return _fromJson<T>(e.response!.data);
  //     } else {
  //       // Handle other Dio errors
  //       print('Error: ${e.message}');
  //       throw e;
  //     }
  //   }
  // }

//   Future<SuccessModel> getUserLogApi(FormData formData) async {
//     final result = await requestPOST(
//         url: ConstantApi.usersLogdUrl, formData: formData, dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return SuccessModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = SuccessModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return SuccessModel();
//   }

//   Future<DashboardModel> getDashboardApi() async {
//     final result = await requestGET(url: ConstantApi.dashboardUrl, dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return DashboardModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = DashboardModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return DashboardModel();
//   }

//   Future<ServiceListModel> getServiceListApi() async {
//     var formData = FormData.fromMap({
//       "executive_id": "",
//       "client_id": "",
//       "status_id": "",
//       "daterange": ""
//     });

//     final result = await requestPOST(
//         url: ConstantApi.servicesList, formData: formData, dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return ServiceListModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = ServiceListModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return ServiceListModel();
//   }

//   Future<EditModel> getServiceEditApi(String service_id) async {
//     final result = await requestGET(
//         url: ConstantApi.servicesStore + "/${service_id}/" + "edit", dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return EditModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = EditModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return EditModel();
//   }

//   Future<SuccessModel> EditServiceData(
//       String service_id, FormData formData) async {
//     final result = await requestMultiPart(
//         url: ConstantApi.servicesStore + "/${service_id}", formData: formData);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return SuccessModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = SuccessModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return SuccessModel();
//   }

//   Future<SuccessModel> AddServiceData(FormData formData) async {
//     final result = await requestMultiPart(
//         url: ConstantApi.servicesStore, formData: formData);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return SuccessModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = SuccessModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return SuccessModel();
//   }

//   Future<ServiceHistoryModel> getServiceHistoryApi(String service_id) async {
//     var formData = FormData.fromMap({});

//     final result = await requestPOST(
//         url: ConstantApi.servicesHistory + service_id,
//         formData: formData,
//         dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return ServiceHistoryModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = ServiceHistoryModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return ServiceHistoryModel();
//   }

//   Future<MarketingHistoryModel> getMarketingHistoryApi(
//       String service_id) async {
//     var formData = FormData.fromMap({});

//     final result = await requestPOST(
//         url: ConstantApi.marketingHistory + service_id,
//         formData: formData,
//         dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return MarketingHistoryModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = MarketingHistoryModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return MarketingHistoryModel();
//   }

//   Future<ServiceModel> getServiceDataApi() async {
//     final result = await requestGET(url: ConstantApi.servicesCreate, dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return ServiceModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = ServiceModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return ServiceModel();
//   }

//   Future<MarketingListModel> getMarketingListApi() async {
//     var formData = FormData.fromMap({
//       "executive_id": "",
//       "client_id": "",
//       "status_id": "",
//       "daterange": ""
//     });

//     final result = await requestPOST(
//         url: ConstantApi.marketingList, formData: formData, dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return MarketingListModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = MarketingListModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return MarketingListModel();
//   }

//   Future<MarketingEditModel> getMarketingEditApi(String service_id) async {
//     final result = await requestGET(
//         url: ConstantApi.marketingStore + "/${service_id}/" + "edit",
//         dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return MarketingEditModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = MarketingEditModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return MarketingEditModel();
//   }

//   Future<ServiceModel> getMarketingDataApi() async {
//     final result =
//         await requestGET(url: ConstantApi.marketingCreate, dio: _dio);
//     if (result["success"] == true) {
//       print("resultOTP:$result");
//       print("resultOTPsss:${result["success"]}");
//       return ServiceModel?.fromJson(result["response"]);
//     } else {
//       try {
//         var resultval = ServiceModel.fromJson(result["response"]);
//         // Toast.show(resultval.message.toString(), context);
//         print(result["response"]);
//         return resultval;
//       } catch (e) {
//         print(result["response"]);
//         // Toast.show(result["response"], context);
//       }
//     }
//     return ServiceModel();
//   }]/
// }
}
