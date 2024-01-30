import 'package:pilot/Components/Main/DependencyProvider/app_root_dependency_provider_interface.dart';
import 'package:pilot/Components/Network/network.dart';
import '../../Network/Mocks/mock_network_dependency_provider.dart';

class MockAppRootDependencyProvider extends AppRootDependencyProvider {
  @override
  NetworkProtocol network() {
    return Network(dependencyProvider: MockNetworkDependencyProvider());
  }
}