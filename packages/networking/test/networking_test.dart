import 'package:environment/environment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:networking/mocks/mock_networking_dependency_provider.dart';

import 'package:networking/networking.dart';

void main() {
  test('adds one to input values', () {
    final networking = Networking(dependencyProvider: MockNetworkingDependencyProvider());
    print(networking.environment.getEnvironment());
    expect(networking.environment.getEnvironment(), AppEnvironment.development);
  });
}
