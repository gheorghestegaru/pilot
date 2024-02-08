
import 'package:environment/src/environment_store.dart';

// An enumeration to represent different application environments
enum AppEnvironment { production, development }

abstract class EnvironmentDependencyProvider {
  EnvironmentStore envStore();
}

abstract class EnvironmentProtocol {
  AppEnvironment getEnvironment();
  void setProdEnvironment();
  void setDevEnvironment();
}

class Environment implements EnvironmentProtocol {
  final EnvironmentStore envStore;
  
  Environment._(this.envStore);

  factory Environment({EnvironmentDependencyProvider? dependencyProvider}) {
    final envStore = dependencyProvider?.envStore() ?? EnvironmentStore();
    return Environment._(envStore);
  }

  @override
  AppEnvironment getEnvironment() {
    return envStore.getAppEnvironment();
  }

  @override
  void setDevEnvironment() {
    envStore.save(AppEnvironment.development);
  }

  @override
  void setProdEnvironment() {
    envStore.save(AppEnvironment.production);
  }
}



