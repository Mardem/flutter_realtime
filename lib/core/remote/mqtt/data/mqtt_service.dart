import 'dart:async';
import 'dart:convert';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../domain/mqtt_repository.dart';

class MqttService implements MqttRepository {
  late final MqttServerClient _client;
  StreamSubscription? _subscription;

  final String server;
  final int port;
  final String clientIdentifier;

  MqttService({
    required this.server,
    this.port = 1883,
    required this.clientIdentifier,
  });

  @override
  Future<void> initialize() async {
    _client = MqttServerClient(server, clientIdentifier)
      ..port = port
      ..keepAlivePeriod = 20
      ..logging(on: false)
      ..onDisconnected = _onDisconnected
      ..onConnected = _onConnected
      ..onSubscribed = _onSubscribed;

    final connMess = MqttConnectMessage()
        .withClientIdentifier(clientIdentifier)
        .startClean();

    _client.connectionMessage = connMess;

    try {
      await _client.connect();
    } catch (e) {
      _client.disconnect();
      rethrow;
    }
  }

  @override
  void publish(
    String topic,
    Map<String, dynamic> jsonMap, {
    MqttQos qos = MqttQos.atLeastOnce,
  }) {
    final payload = MqttClientPayloadBuilder();
    payload.addString(json.encode(jsonMap));
    _client.publishMessage(topic, qos, payload.payload!);
  }

  @override
  void subscribe(String topic, {MqttQos qos = MqttQos.atMostOnce}) {
    _client.subscribe(topic, qos);
  }

  @override
  void unsubscribe(String topic) {
    _client.unsubscribe(topic);
  }

  @override
  void disconnect() {
    _subscription?.cancel();
    _client.disconnect();
  }

  void _onSubscribed(String topic) => print('Inscrito em $topic');

  void _onDisconnected() => print('Desconectado do broker');

  void _onConnected() => print('Conectado ao broker');
}
