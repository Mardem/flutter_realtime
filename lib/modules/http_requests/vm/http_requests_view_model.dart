import 'package:flutter_realtime/core/core.dart';

import '../../../main.dart';
import '../domain/domain.dart';

class HttpRequestsViewModel extends BaseViewModel {
  final service = inject<HttpRequestsServiceInterface>();

  List<Map<String, dynamic>> _countryData = [];

  List<Map<String, dynamic>> get countryData => _countryData;

  void setCountry(List<Map<String, dynamic>> value) {
    _countryData = value;
    notifyListeners();
  }

  Future<void> getCountryData({required String country}) async {
    setLoading(true);
    await service.getCountry(country: country);
    setLoading(false);
  }
}
