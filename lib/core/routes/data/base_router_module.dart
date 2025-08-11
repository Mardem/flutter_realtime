import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

import '../routes.dart';

abstract class BaseRouterModule implements RoutesInterface {
  @override
  BaseRoute<Handler> call() => BaseRoute(
        handler: Handler(
          handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
            return getPresentation(params: params);
          },
        ),
      );

  @override
  define(FluroRouter router, {TransitionType? transitionType}) {
    router.define(
      getRoutePath(),
      handler: call().handler,
      transitionType: transitionType,
    );
  }

  Widget getPresentation({Map<String, dynamic>? params});

  String getRoutePath();
}
