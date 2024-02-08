
// A class to manage environment-related data storage and retrieval
import 'package:environment/environment.dart';

class EnvironmentStore {
  static String appEnvKey = "app_environment";

  Map<String, AppEnvironment> _storage = {};

  // Private constructor
  EnvironmentStore._(this._storage);

  // Static instance variable
  static EnvironmentStore? _instance;

  // Factory method to get the singleton instance
  factory EnvironmentStore({Map<String, AppEnvironment>? storage}) {
 
    _instance ??= EnvironmentStore._(storage ?? { appEnvKey : AppEnvironment.production });

    return _instance!;
  }

  AppEnvironment getAppEnvironment() {
    return _storage[appEnvKey] ?? AppEnvironment.production;
  }

  void save(AppEnvironment environment) {
    _storage[appEnvKey] = environment;
  }

  void clearAppEnvironment() {
    _storage.remove(appEnvKey);
  }

  void clearAll() {
    _storage.remove(appEnvKey);
  }
}
