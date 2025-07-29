import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mqtt_client/mqtt_client.dart';

import '../../../../remote/mqtt/data/mqtt_service.dart';
import '../mocks/core_mock_mqtt_client.dart';

void main() {
  late MqttService service;
  late MockMqttClient mockClient;

  group('Testing Core MqttService With Success', () {
    setUpAll(() {
      mockClient = MockMqttClient();

      service = MqttService(
        server: 'test.mosquitto.org',
        clientIdentifier: 'test-client',
      );

      service.testClient = mockClient;
    });

    test(
      'Given mqtt client, When call subscribe, Then call mqtt subscribe',
      () {
        // Arrange
        const topic = 'chat/test';
        when(
          () => mockClient.subscribe(topic, MqttQos.atMostOnce),
        ).thenReturn(null);

        // Act
        service.subscribe(topic);

        // Assert
        verify(() => mockClient.subscribe(topic, MqttQos.atMostOnce)).called(1);
      },
    );
  });
}
