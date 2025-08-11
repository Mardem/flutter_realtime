enum OnboardingRouteNames {
  /// Tela principal
  splash;

  /// Getter que retorna o caminho da rota correspondente.
  String get path {
    switch (this) {
      case OnboardingRouteNames.splash:
        return '/';
    }
  }
}
