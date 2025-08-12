import 'package:get_it/get_it.dart';

import '../../../core/core.dart';
import '../../../main.dart';
import '../data/data.dart';
import '../domain/domain.dart';
import '../vm/http_requests_view_model.dart';

class HttpRequestsDI extends BaseServiceLocator {
  @override
  GetIt locator = inject;

  @override
  Future<void> setServices() async {
    inject.registerFactory<HttpRequestsServiceInterface>(
      () => HttpRequestsServices(),
    );
  }

  @override
  Future<void> setRepositories() async {}

  @override
  Future<void> setViewModels() async {
    inject.registerFactory<HttpRequestsViewModel>(
      () => HttpRequestsViewModel(),
    );
  }
}
