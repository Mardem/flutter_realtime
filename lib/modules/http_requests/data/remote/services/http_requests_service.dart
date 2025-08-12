import 'package:flutter_realtime/modules/http_requests/data/remote/response/country_response.dart';

import '../../../../../core/remote/http/http.dart';
import '../../../../../main.dart';
import '../../../domain/domain.dart';

class HttpRequestsServices implements HttpRequestsServiceInterface {
  final HttpClient _client = inject<HttpClient>();

  @override
  Future<AppResponse<CountryResponse>> getCountry({
    required String country,
  }) async {
    try {
      final String query = '?fullText=true';
      final String url = 'https://restcountries.com/v3.1/name/$country$query';

      final request = await _client.get(url);
      final data = request.data;

      if (data is! List || data.isEmpty) {
        throw Exception('Nenhum dado encontrado para o país "$country"');
      }

      return AppResponse(
        success: true,
        data: CountryResponse.fromJson(data.first as Map<String, dynamic>),
      );
    } catch (e) {
      return AppResponse(
        success: false,
        messageError: 'Houve um problema o buscar os dados do país!',
      );
    }
  }
}
