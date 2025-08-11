/// Enum que representa as rotas disponíveis no módulo.
enum HttpRequestsRouteNames {
  /// Tela principal
  home;

  /// Getter que retorna o caminho da rota correspondente.
  String get path {
    switch (this) {
      case HttpRequestsRouteNames.home:
        return '/http-screen';
    }
  }
}
