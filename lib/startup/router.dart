import 'package:fluro/fluro.dart';

import '../modules/home/routes/home_route.dart';
import '../modules/onboarding/routes/onboarding_route.dart';

class AppRouter {
  static void defineRouter(FluroRouter router) {
    const TransitionType transitionType = TransitionType.fadeIn;

    OnboardingRoute().define(router, transitionType: transitionType);
    HomeRoutes().define(router, transitionType: transitionType);
  }
}