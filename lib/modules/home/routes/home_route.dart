import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
import '../presentation/home_presentation.dart';
import 'home_route_names.dart';

/// Classe responsável por configurar as rotas do módulo de Login.
class HomeRoutes
    extends BaseRouterModule {
  @override
  Widget getPresentation({
    Map<String, dynamic>? params,
  }) {
    return const HomePresentation();
  }

  @override
  String getRoutePath() {
    return HomeRouteNames.home.path;
  }
}
