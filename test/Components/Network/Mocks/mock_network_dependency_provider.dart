import 'package:pilot/Components/Network/DependencyProvider/network_dependency_provider_interface.dart';
import 'package:http/http.dart' as http;

import 'mock_client.dart';

class MockNetworkDependencyProvider extends NetworkDependencyProvider {
  @override
  http.Client client() {
    return MockClient();
  }
}