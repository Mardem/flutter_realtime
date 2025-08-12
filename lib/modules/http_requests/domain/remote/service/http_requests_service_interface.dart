import '../../../data/remote/response/country_response.dart';

abstract class HttpRequestsServiceInterface {
  Future<CountryResponse> getCountry({required String country});
}
