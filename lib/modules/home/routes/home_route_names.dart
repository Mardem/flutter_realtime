/// Enum que representa as rotas disponíveis no módulo de Home.
enum HomeRouteNames {
  /// Tela principal
  home;

  /// Getter que retorna o caminho da rota correspondente.
  String get path {
    switch (this) {
      case HomeRouteNames.home:
        return '/home-screen';
    }
  }
}
