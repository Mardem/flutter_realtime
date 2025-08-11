import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realtime/startup/di.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app.dart';
import 'startup/router.dart';

// Instância global do GetIt para injeção de dependências.
final GetIt inject = GetIt.instance;

// Instância global do FluroRouter para gerenciamento de rotas.
final router = FluroRouter();

main() async {
  // Define o locale padrão da aplicação como Português do Brasil.
  Intl.defaultLocale = 'pt_BR';

  // Define todas as rotas da aplicação utilizando o Fluro.
  AppRouter.defineRouter(router);

  // Garante que os bindings do Flutter estejam inicializados
  // antes de executar qualquer código assíncrono.
  WidgetsFlutterBinding.ensureInitialized();
  await InitAppModules.start();
  
  initializeDateFormatting('pt_BR', null).then((_) => runApp(const App()));
}
