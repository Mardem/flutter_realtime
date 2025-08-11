import 'package:fluro/fluro.dart';

import 'base_route.dart';

abstract class RoutesInterface {
  /// Define as rotas padrões da aplicação e linka o pacote a interface
  /// Facilitará a alteração do router no futuro
  BaseRoute<Handler> call();
  void define(FluroRouter router, {TransitionType? transitionType});
}
