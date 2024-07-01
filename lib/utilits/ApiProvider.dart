import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Model/SignUpModel.dart';
import 'package:jewelone/utilits/ApiService.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(dioProvider);
  return ApiService(dio);
});

//LOGIN
final loginPostProvider = FutureProvider.autoDispose
    .family<LoginModel?, Map<String, dynamic>>((ref, formData) async {
  return ref.watch(apiServiceProvider).LoginApi(formData);
});

//SIGNUP
final signupPostProvider = FutureProvider.autoDispose
    .family<SignUpModel?, Map<String, dynamic>>((ref, formData) async {
  return ref.watch(apiServiceProvider).signupapi(formData);
});



