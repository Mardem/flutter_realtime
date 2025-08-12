import '../../../../../core/remote/http/http.dart';
import '../../../../../main.dart';
import '../../../domain/domain.dart';

class HttpRequestsServices implements HttpRequestsServiceInterface {
  final HttpClient _client = inject<HttpClient>();

  @override
  Future<void> getCountry({required String country}) async {
    final String url = 'https://restcountries.com/v3.1/name/$country';
  }
}
