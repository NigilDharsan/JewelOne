import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jewelone/utilits/Generic.dart';

import 'ConstantsApi.dart';

Future<dynamic> requestGET(
    {required String url, required http.Client dio}) async {
  try {
    String? accessToken = await getToken();
    // if (accessToken != "") {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token $accessToken'
    };

    final response = await dio.get(Uri.parse(url), headers: headers);
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      case 201:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
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
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': false, 'response': responseDecode};
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
    {required String url,
    required Map<String, dynamic> formData,
    required http.Client dio}) async {
  try {
    String? accessToken = await getToken();

    final headers = {
      // 'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token $accessToken'
    };

    final response = await dio.post(Uri.parse(url),
        headers: headers, body: jsonEncode(formData));
    print(response);
    switch (response.statusCode) {
      case 200:
        final decodedBody = utf8.decode(response.bodyBytes);

        final Map<String, dynamic> responseDecode = jsonDecode(decodedBody);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      case 201:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
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
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': false, 'response': responseDecode};
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

Future<dynamic> requestPOST2(
    {required String url,
    required Map<String, dynamic> formData,
    required http.Client dio}) async {
  try {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final response = await dio.post(Uri.parse(url),
        body: jsonEncode(formData), headers: headers);

    print(response);
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      case 201:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      default:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': false, 'response': responseDecode};
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

Future<dynamic> requestPOST3(
    {required String url,
    required Map<String, dynamic> formData,
    required http.Client dio}) async {
  try {
    print(url);
    // final headers = {
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/x-www-form-urlencoded',
    //   'Authorization': 'Token $accessToken'
    // };

    final response = await dio.post(Uri.parse(url), body: formData);
    print(response);
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      case 201:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      default:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': false, 'response': responseDecode};
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

Future<dynamic> requestPOST4(
    {required String url,
    required List<Map<String, dynamic>> formData,
    required http.Client dio}) async {
  try {
    print(url);
    String? accessToken = await getToken();

    final headers = {
      'Accept': 'application/json',
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Type': 'application/json',

      'Authorization': 'Token $accessToken'
    };

    final response = await dio.post(Uri.parse(url),
        body: jsonEncode(formData), headers: headers);
    print(response);
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      case 201:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      default:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': false, 'response': responseDecode};
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

Future<dynamic> requestMultiPart({
  required String url,
  required Map<String, dynamic> formData,
}) async {
  try {
    String? accessToken = await getToken();

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $accessToken'
    };

    final response =
        await http.post(Uri.parse(url), body: formData, headers: headers);
    print(response);
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
        return jsonResponse;
      case 201:
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': true, 'response': responseDecode};
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
        final Map<String, dynamic> responseDecode = jsonDecode(response.body);

        final jsonResponse = {'success': false, 'response': responseDecode};
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
