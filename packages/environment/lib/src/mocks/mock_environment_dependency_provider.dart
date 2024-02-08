import 'package:environment/environment.dart';
import 'package:environment/src/environment_store.dart';

class MockEnvironmentDependencyProvider extends EnvironmentDependencyProvider {
  @override
  EnvironmentStore envStore() {
    final mockDefaultStorage = { EnvironmentStore.appEnvKey : AppEnvironment.development };
    return EnvironmentStore(storage: mockDefaultStorage);
  }
}