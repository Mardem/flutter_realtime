import 'package:flutter/material.dart';
import 'package:flutter_realtime/design_system/card/app_card.dart';
import 'package:flutter_realtime/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/remote/mqtt/domain/mqtt_repository.dart';
import '../../../design_system/app_bar/app_bar.dart';

class HomePresentation extends StatefulWidget {
  const HomePresentation({super.key});

  @override
  State<HomePresentation> createState() => _HomePresentationState();
}

class _HomePresentationState extends State<HomePresentation> {
  final String _mqttTopic = 'flutter_chat/response';

  final MqttRepository _mqttRepo = inject<MqttRepository>();

  final TextEditingController _topicCtrl = TextEditingController(
    text: 'flutter_chat/response',
  );
  final TextEditingController _messageCtrl = TextEditingController(
    text: 'Olá, essa é minha primeira mensagem!',
  );

  final String postUrl =
      'https://medium.com/@mardenmc22/desenvolvimento-mobile-com-flutter-e-mqtt-o-guia-para-criar-aplicativos-inovadores-ad4f207203d1';

  @override
  void initState() {
    super.initState();
    _initMqttClient();
  }

  Future<void> _initMqttClient() async {
    await _mqttRepo.initialize().then(
      (_) => _mqttRepo.subscribe(
        _mqttTopic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Flutter MQTT ⚡'),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(
            context,
          ).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCard(
                title: 'Flutter com MVVM e MQTT',
                description: _screenDescription(),
                onTap: () => _launchUrl(postUrl),
              ),
              TextField(
                controller: _topicCtrl,
                decoration: InputDecoration(
                  labelText: 'Tópico',
                ),
              ),
              TextField(
                controller: _messageCtrl,
                decoration: InputDecoration(
                  labelText: 'Mensagem',
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final topic = _topicCtrl.text;
                      final msg = _messageCtrl.text;
                      _mqttRepo.publish(
                        topic,
                        {
                          'message': msg,
                        },
                      );
                    },
                    child: Text(
                      'Publicar',
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _mqttRepo.clearMessages(),
                    child: Text(
                      'Limpar mensagens',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ValueListenableBuilder<List<String>>(
                  valueListenable: _mqttRepo.messages,
                  builder: (context, messages, _) {
                    if (messages.isEmpty) {
                      return Center(
                        child: Text(
                          'Nenhuma mensagem recebida ainda.',
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder:
                          (
                            context,
                            index,
                          ) {
                            return ListTile(
                              title: Text(
                                messages[index],
                              ),
                              dense: true,
                            );
                          },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _screenDescription() => """
Aqui você encontra um resumo prático do conteúdo apresentado no artigo:
como integrar MVVM com MQTT no Flutter, garantindo uma arquitetura limpa, comunicação em tempo real e um código escalável e fácil de manter.
  """;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!ok) throw Exception('Could not launch $uri');
  }
}
