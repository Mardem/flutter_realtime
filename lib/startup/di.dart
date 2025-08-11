import '../core/remote/http/data/client.dart';
import '../core/remote/http/http.dart';
import '../main.dart';
import '../modules/home/di/home_di.dart';

class InitAppModules {
  static Future<void> start() async {
    inject.registerSingleton<HttpClient>(
      HttpClientImpl(
        baseUrl: 'https://restcountries.com/v3.1',
      ),
    );

    await HomeDI().initiate();
  }
}
