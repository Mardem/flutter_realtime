import 'package:flutter_realtime/core/core.dart';

class HttpRequestsViewModel extends BaseViewModel {
  Future<void> getCountryData({required String country}) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 3));
    setLoading(false);
  }
}
