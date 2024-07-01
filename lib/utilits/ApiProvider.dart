import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelone/Model/LoginModel.dart';
import 'package:jewelone/utilits/ApiService.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(dioProvider);
  return ApiService(dio);
});

final loginPostProvider = FutureProvider.autoDispose
    .family<LoginModel?, Map<String, dynamic>>((ref, formData) async {
  return ref.watch(apiServiceProvider).LoginApi(formData);
});

// final dashboardProvider =
//     FutureProvider.autoDispose<DashboardModel?>((ref) async {
//   return ref.watch(apiServiceProvider).getDashboardApi();
// });

// final serviceListProvider =
//     FutureProvider.autoDispose<ServiceListModel?>((ref) async {
//   return ref.watch(apiServiceProvider).getServiceListApi();
// });

// final serviceDataProvider = FutureProvider<ServiceModel?>((ref) async {
//   return ref.watch(apiServiceProvider).getServiceDataApi();
// });

// final serviceEditProvider =
//     FutureProvider.autoDispose.family<EditModel?, String>((ref, id) async {
//   return ref.watch(apiServiceProvider).getServiceEditApi(id);
// });

// final serviceUpdateProvider = FutureProvider.autoDispose
//     .family<SuccessModel?, Tuple2<String, FormData>>((ref, tuple) async {
//   final id = tuple.item1;
//   final formData = tuple.item2;

//   return ref.watch(apiServiceProvider).EditServiceData(id, formData);
// });

// final servicePostProvider = FutureProvider.autoDispose
//     .family<SuccessModel?, FormData>((ref, formData) async {
//   return ref.watch(apiServiceProvider).AddServiceData(formData);
// });

// final serviceHistoryProvider = FutureProvider.autoDispose
//     .family<ServiceHistoryModel?, String>((ref, id) async {
//   return ref.watch(apiServiceProvider).getServiceHistoryApi(id);
// });

// final marketingListProvider =
//     FutureProvider.autoDispose<MarketingListModel?>((ref) async {
//   return ref.watch(apiServiceProvider).getMarketingListApi();
// });

// final marketingDataProvider = FutureProvider<ServiceModel?>((ref) async {
//   return ref.watch(apiServiceProvider).getMarketingDataApi();
// });

// final marketingEditProvider = FutureProvider.autoDispose
//     .family<MarketingEditModel?, String>((ref, id) async {
//   return ref.watch(apiServiceProvider).getMarketingEditApi(id);
// });

// final marketingHistoryProvider = FutureProvider.autoDispose
//     .family<MarketingHistoryModel?, String>((ref, id) async {
//   return ref.watch(apiServiceProvider).getMarketingHistoryApi(id);
// });
