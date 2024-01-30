import 'package:flutter_test/flutter_test.dart';
import 'package:pilot/Components/Network/network.dart';
import 'Mocks/mock_network_dependency_provider.dart';

void main() {
  group('Network', () {
    late Network network;

    setUp(() {
      // Use the mock client for testing
      network = Network(dependencyProvider: MockNetworkDependencyProvider());
    });

    test('GET request should return response body', () async {
      final response = await network.get('https://example.com');
      expect(response, equals('{"mocked": "mocked"}'));
    });


    test('POST request should return response body', () async {
      final response = await network.post('https://example.com', body: {'key': 'value'});
      expect(response, equals('{"mocked": "mocked"}'));
    });
  });
}