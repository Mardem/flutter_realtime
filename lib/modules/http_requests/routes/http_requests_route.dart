import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
import '../presentation/http_requests_presentation.dart';
import 'http_requests_route_names.dart';

/// Classe responsável por configurar as rotas do módulo.
class HttpRequestsRoute extends BaseRouterModule {
  @override
  Widget getPresentation({
    Map<String, dynamic>? params,
  }) {
    return const HttpRequestsPresentation();
  }

  @override
  String getRoutePath() {
    return HttpRequestsRouteNames.home.path;
  }
}
