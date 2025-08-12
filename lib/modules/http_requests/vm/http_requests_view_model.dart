import 'package:flutter_realtime/core/core.dart';

import '../../../core/remote/http/http.dart';
import '../../../main.dart';
import '../data/remote/response/country_response.dart';
import '../domain/domain.dart';

class HttpRequestsViewModel extends BaseViewModel {
  final service = inject<HttpRequestsServiceInterface>();

  CountryResponse? _countryData;

  CountryResponse? get countryData => _countryData;

  void setCountry(CountryResponse? value) {
    _countryData = value;
    notifyListeners();
  }

  Future<void> getCountryData({required String country}) async {
    setLoading(true);
    final AppResponse<CountryResponse> data = await service.getCountry(
      country: country,
    );

    if (data.success) {
      _countryData = data.data!;
    }

    setLoading(false);
  }
}
