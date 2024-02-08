import 'package:environment/environment.dart';
import 'package:environment/src/mocks/mock_environment_dependency_provider.dart';
import 'package:networking/networking.dart';

class MockNetworkingDependencyProvider extends NetworkingDependencyProvider {
  
  @override
  Environment environment() {
    return Environment(dependencyProvider: MockEnvironmentDependencyProvider());
  }
}