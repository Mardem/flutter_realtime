import 'package:flutter/material.dart';
import 'package:flutter_realtime/modules/onboarding/presentation/onboarding_presentation.dart';
import 'package:flutter_realtime/modules/onboarding/routes/onboarding_route_names.dart';

import '../../../core/routes/routes.dart';

/// Classe responsável por configurar as rotas do módulo de Onboarding.
class OnboardingRoute extends BaseRouterModule {
  @override
  Widget getPresentation({
    Map<String, dynamic>? params,
  }) {
    return const OnboardingPresentation();
  }

  @override
  String getRoutePath() {
    return OnboardingRouteNames.splash.path;
  }
}
