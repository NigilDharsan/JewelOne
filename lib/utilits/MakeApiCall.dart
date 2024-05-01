import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jewelone/utilits/Generic.dart';

import 'ConstantsApi.dart';

Future<dynamic> requestGET({required String url, required Dio dio}) async {
  try {
    String? accessToken = await getToken();
    // if (accessToken != "") {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await dio.get(url);
    switch (response.statusCode) {
      case 200:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      case 201:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      // case 400:
      //   final result = jsonDecode(response.body);
      //   final jsonResponse = {'success': false, 'response': result};
      //   return jsonResponse;
      // case 401:
      //   final jsonResponse = {
      //     'success': false,
      //     'response': ConstantApi.UNAUTHORIZED
      //   };
      //   return jsonResponse;
      // case 500:
      // case 501:
      // case 502:
      //   final jsonResponse = {
      //     'success': false,
      //     'response': ConstantApi.SOMETHING_WRONG
      //   };
      //   return jsonResponse;
      default:
        final jsonResponse = {'success': false, 'response': response.data};
        return jsonResponse;
    }
  } on SocketException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.NO_INTERNET
    };
    return jsonResponse;
  } on FormatException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.BAD_RESPONSE
    };
    return jsonResponse;
  } on HttpException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.SOMETHING_WRONG //Server not responding
    };
    return jsonResponse;
  }
}

Future<dynamic> requestPOST(
    {required String url, required FormData formData, required Dio dio}) async {
  try {
    String? accessToken = await getToken();

    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    dio.options.baseUrl = url;

    final response = await dio.post(url, data: formData);
    print(response);
    switch (response.statusCode) {
      case 200:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      case 201:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      // case 400:
      //   final result = jsonDee.body);
      //   final jsonResponse = {'success': false, 'response': result};
      //   return jsonResponse;
      // case 401:
      //   final jsonResponse = {
      //     'success': false,
      //     'response': ConstantApi.UNAUTHORIZED
      //   };
      //   return jsonResponse;
      // case 500:
      // case 501:
      // case 502:
      //   final jsonResponse = {
      //     'success': false,
      //     'response': ConstantApi.SOMETHING_WRONG
      //   };
      //   return jsonResponse;
      default:
        final jsonResponse = {'success': false, 'response': response.data};
        return jsonResponse;
    }
  } on SocketException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.NO_INTERNET
    };
    return jsonResponse;
  } on FormatException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.BAD_RESPONSE
    };
    return jsonResponse;
  } on HttpException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.SOMETHING_WRONG //Server not responding
    };
    return jsonResponse;
  } on DioError catch (e) {
    if (e.response?.statusCode == 400) {
      print(e.response?.statusCode);
      print(e.response?.data);

      final jsonResponse = {
        'success': false,
        'response': e.response?.data //Server not responding
      };
      return jsonResponse;
    } else {
      final jsonResponse = {
        'success': false,
        'response': ConstantApi.SOMETHING_WRONG //Server not responding
      };
      return jsonResponse;
    }
  }
}

Future<dynamic> requestPOST2(
    {required String url, required Object formData, required Dio dio}) async {
  try {
    String? accessToken = await getToken();

    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    dio.options.baseUrl = url;
    print(url);

    final response = await dio.post(url, data: formData);
    print(response);
    switch (response.statusCode) {
      case 200:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      case 201:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      default:
        final jsonResponse = {'success': false, 'response': response.data};
        return jsonResponse;
    }
  } on SocketException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.NO_INTERNET
    };
    return jsonResponse;
  } on FormatException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.BAD_RESPONSE
    };
    return jsonResponse;
  } on HttpException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.SOMETHING_WRONG //Server not responding
    };
    return jsonResponse;
  } on DioError catch (e) {
    if (e.response?.statusCode == 400) {
      print(e.response?.statusCode);
      print(e.response?.data);

      final jsonResponse = {
        'success': false,
        'response': e.response?.data //Server not responding
      };
      return jsonResponse;
    } else {
      final jsonResponse = {
        'success': false,
        'response': ConstantApi.SOMETHING_WRONG //Server not responding
      };
      return jsonResponse;
    }
  }
}

Future<dynamic> requestMultiPart({
  required String url,
  required FormData formData,
}) async {
  try {
    String? accessToken = await getToken();

    Dio _dio = new Dio();
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $accessToken'
    };
    _dio.options.baseUrl = url;

    final response = await _dio.post(url, data: formData);
    print(response);
    switch (response.statusCode) {
      case 200:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      case 201:
        final jsonResponse = {'success': true, 'response': response.data};
        return jsonResponse;
      // case 400:
      //   final result = jsonDee.body);
      //   final jsonResponse = {'success': false, 'response': result};
      //   return jsonResponse;
      // case 401:
      //   final jsonResponse = {
      //     'success': false,
      //     'response': ConstantApi.UNAUTHORIZED
      //   };
      //   return jsonResponse;
      // case 500:
      // case 501:
      // case 502:
      //   final jsonResponse = {
      //     'success': false,
      //     'response': ConstantApi.SOMETHING_WRONG
      //   };
      //   return jsonResponse;
      default:
        final jsonResponse = {'success': false, 'response': response.data};
        return jsonResponse;
    }
  } on SocketException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.NO_INTERNET
    };
    return jsonResponse;
  } on FormatException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.BAD_RESPONSE
    };
    return jsonResponse;
  } on HttpException {
    final jsonResponse = {
      'success': false,
      'response': ConstantApi.SOMETHING_WRONG //Server not responding
    };
    return jsonResponse;
  } on DioError catch (e) {
    if (e.response?.statusCode == 400) {
      print(e.response?.statusCode);
      print(e.response?.data);

      final jsonResponse = {
        'success': false,
        'response': e.response?.data //Server not responding
      };
      return jsonResponse;
    } else {
      final jsonResponse = {
        'success': false,
        'response': ConstantApi.SOMETHING_WRONG //Server not responding
      };
      return jsonResponse;
    }
  }
}

// Future<dynamic> requestMultiPart({
//   required String url,
//   required FormData formData,
// }) async {
//   try {
//     // var stream =
//     // new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     // var length = await imageFile.length();
//     // var multipartFile = new http.MultipartFile('file', stream, length,
//     //     filename: basename(imageFile.path));
//     // //contentType: new MediaType('image', 'png'));
//     // request.files.add(multipartFile);
//
//     Dio _dio = new Dio();
//     _dio.options.headers = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     };
//     _dio.options.baseUrl = url;
//
//     final response = await _dio.post(url, data: formData);
//     print(response);
//
//     Dio().post(url, data: formData).then((response) async {
//       // print(onValue.statusCode);
//
//       // print(onValue.headers);
//       // print(onValue.contentLength);
//
//       switch (response.statusCode) {
//         case 200:
//           final result = jsonDecode(response.toString());
//           final jsonResponse = {'success': true, 'response': result};
//           return jsonResponse;
//         case 201:
//           final result = jsonDecode(response.toString());
//           final jsonResponse = {'success': true, 'response': result};
//           return jsonResponse;
//         // case 400:
//         //   final result = jsonDecode(response.body);
//         //   final jsonResponse = {'success': false, 'response': result};
//         //   return jsonResponse;
//         // case 401:
//         //   final jsonResponse = {
//         //     'success': false,
//         //     'response': ConstantApi.UNAUTHORIZED
//         //   };
//         //   return jsonResponse;
//         // case 500:
//         // case 501:
//         // case 502:
//         //   final jsonResponse = {
//         //     'success': false,
//         //     'response': ConstantApi.SOMETHING_WRONG
//         //   };
//         //   return jsonResponse;
//         default:
//           final result = jsonDecode(response.toString());
//
//           final jsonResponse = {'success': false, 'response': result};
//           return jsonResponse;
//       }
//     });
//   } on SocketException {
//     final jsonResponse = {
//       'success': false,
//       'response': ConstantApi.NO_INTERNET
//     };
//     return jsonResponse;
//   } on FormatException {
//     final jsonResponse = {
//       'success': false,
//       'response': ConstantApi.BAD_RESPONSE
//     };
//     return jsonResponse;
//   } on HttpException {
//     final jsonResponse = {
//       'success': false,
//       'response': ConstantApi.SOMETHING_WRONG //Server not responding
//     };
//     return jsonResponse;
//   }
// }

// void makeAddClgUploadApiCall() async {
//     loadingGauge.showLoader(context);
//     Dio dio = new Dio();
//     dio.options.baseUrl = ConstantsApi.addCollegeURL;
// FormData formData = new FormData.fromMap({

//   "privacy": "radioSelectedValue",
// });
//     print("Data formed:${formData}");
//     print("ADDCollege url:${ConstantsApi.addCollegeURL}");
//     if (_imageFileList.isEmpty) {
//       print("image array empty");
//     } else {
//       print("image array not empty");
//       for (int i = 0; i < _imageFileList.length; i++) {
//         print("welcome");
//         formData.files.addAll([
//           MapEntry(
//               'files[]', await MultipartFile.fromFile(_imageFileList[i].path)),
//         ]);
//       }
//     }
//     var response = await dio.post(ConstantsApi.addCollegeURL, data: formData);
//     print(response);
//     loadingGauge.hideLoader();
//     if (response.statusCode == 200) {
//       print("Image Uploaded");
//       widget.callback();
//       Navigator.pop(context);
//     } else {
//       print("Upload Failed");
//     }
//   }
// }
