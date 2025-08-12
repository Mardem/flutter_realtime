import 'package:flutter_realtime/modules/http_requests/data/remote/response/country_response.dart';

import '../../../../../core/remote/http/http.dart';
import '../../../../../main.dart';
import '../../../domain/domain.dart';

class HttpRequestsServices implements HttpRequestsServiceInterface {
  final HttpClient _client = inject<HttpClient>();

  @override
  Future<CountryResponse> getCountry({required String country}) async {
    try {
      final String url = 'https://restcountries.com/v3.1/name/$country';

      final request = await _client.get(url);

      final data = request.data;
      if (data is! List || data.isEmpty) {
        throw Exception('Nenhum dado encontrado para o país "$country"');
      }

      return CountryResponse.fromJson(data.first as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
