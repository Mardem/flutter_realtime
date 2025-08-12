import '../../../../../core/remote/http/http.dart';
import '../../../data/remote/response/country_response.dart';

abstract class HttpRequestsServiceInterface {
  Future<AppResponse<CountryResponse>> getCountry({required String country});
}
