import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realtime/startup/router.dart';

import 'core/routes/domain/application.dart';

import 'modules/onboarding/routes/onboarding_route_names.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  AppState() {
    final router = FluroRouter();
    AppRouter.defineRouter(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Flutter Realtime',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(40, 44, 52, 1),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      initialRoute: OnboardingRouteNames.splash.path,
    );
    return app;
  }
}
