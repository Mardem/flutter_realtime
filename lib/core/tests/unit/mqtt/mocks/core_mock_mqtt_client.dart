import 'package:mocktail/mocktail.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MockMqttClient extends Mock
    implements MqttServerClient {}
