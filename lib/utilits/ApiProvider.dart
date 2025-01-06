import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Model/ActiveLocationMOdel.dart';
import 'package:jewelone/Model/ActivePlanModel.dart';
import 'package:jewelone/Model/BannerModel.dart';
import 'package:jewelone/Model/ClosedAccountModel.dart';
import 'package:jewelone/Model/ForgotPasswwordModel.dart';
import 'package:jewelone/Model/GoldRateMmodel.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/Model/MyPlanModel.dart';
import 'package:jewelone/Model/PaymentCreateModel.dart';
import 'package:jewelone/Model/SignUpModel.dart';
import 'package:jewelone/utilits/ApiService.dart';

import '../Model/PaymentHistoryModel.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(httpClientProvider);
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

//FORGOT PASSWORD
final ForgotpasswordPostProvider = FutureProvider.autoDispose
    .family<Forgot_Password_Model?, Map<String, dynamic>>(
        (ref, formData) async {
  return ref.watch(apiServiceProvider).forgetpasswordapi(formData);
});

//VERIFY OTP
final verifyotpPostProvider = FutureProvider.autoDispose
    .family<Forgot_Password_Model?, Map<String, dynamic>>(
        (ref, formData) async {
  return ref.watch(apiServiceProvider).verifyotpapi(formData);
});

//BANNER IMAGE
final BannerDataProvider = FutureProvider<BannerImageModel?>((ref) async {
  return ref.watch(apiServiceProvider).HomeBannerApi();
});

//GOLD RATE
final GoldrateProvider = FutureProvider<GoldRateModel?>((ref) async {
  return ref.watch(apiServiceProvider).GoldrateApi();
});

//ACTIVE LOCATION
final ActivelocationProvider =
    FutureProvider<ActiveLocationModel?>((ref) async {
  return ref.watch(apiServiceProvider).ActivelocationApi();
});

//MY PLAN
final MyplanProvider = FutureProvider.autoDispose<MyPlanModel?>((ref) async {
  return ref.watch(apiServiceProvider).MyplanApi();
});

//Buy New Plan
final buyplanProvider =
    FutureProvider.family<Forgot_Password_Model?, Map<String, dynamic>>(
        (ref, body) async {
  return ref.watch(apiServiceProvider).BuyNewPlanapi(body);
});

//ACTIVE PLAN
final ActiveplanProvider = FutureProvider<ActivePlanModel?>((ref) async {
  return ref.watch(apiServiceProvider).ActiveplanApi();
});

//PAYMENT HISTORY
final paymenthistoryProvider =
    FutureProvider.autoDispose<PaymentHistoryModel?>((ref) async {
  return ref.watch(apiServiceProvider).PaymenthistoryApi();
});

final paymentHistorySchemeProvider = FutureProvider.autoDispose
    .family<PaymentHistoryModel?, int>((ref, schemeAccountID) async {
  return ref.watch(apiServiceProvider).paymentHistorySchemeApi(schemeAccountID);
});

//CLOSED ACCOUNT
final closedaccountProvider =
    FutureProvider.autoDispose<ClosedAccountModel?>((ref) async {
  return ref.watch(apiServiceProvider).closedAccountApi();
});

//SIGNUP
final paymentPostProvider = FutureProvider.autoDispose
    .family<PaymentCreateModel?, List<Map<String, dynamic>>>(
        (ref, formData) async {
  return ref.watch(apiServiceProvider).PaymentApi(formData);
});
