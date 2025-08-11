import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realtime/design_system/app_bar/app_bar.dart';

import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../../../main.dart';
import '../../home/routes/home_route_names.dart';

class OnboardingPresentation extends StatefulWidget {
  const OnboardingPresentation({super.key});

  @override
  State<OnboardingPresentation> createState() => _OnboardingPresentationState();
}

class _OnboardingPresentationState extends State<OnboardingPresentation> {
  String mqttIcon =
      'https://raw.githubusercontent.com/mqtt/mqttorg-graphics/refs/heads/master/png/mqtt-icon-solid.png';

  String httpIcon =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/HTTP_logo.svg/2560px-HTTP_logo.svg.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Flutter MVVM ⚡'),
      body: ListView(
        children: [
          GFListTile(
            avatar: CachedNetworkImage(
              imageUrl: mqttIcon,
              width: 50,
            ),
            titleText: 'MQTT',
            subTitleText:
                'Ao acessar esta tela você poderá ver a integração com MQTT funcionando',
            onTap: () => router.navigateTo(context, HomeRouteNames.home.path),
          ),
          GFListTile(
            avatar: CachedNetworkImage(
              imageUrl: httpIcon,
              width: 50,
            ),
            titleText: 'HTTP Requests',
            subTitleText:
                'Ao acessar esta tela você poderá ver a integração com HTTP funcionando',
          ),
        ],
      ),
    );
  }
}
