library networking;
import 'package:environment/environment.dart';

abstract class NetworkingDependencyProvider {
  Environment environment();
}

abstract class NetworkingProtocol {
  void whatIsYourEnvironmnet();
}

class Networking implements NetworkingProtocol {
  final Environment environment;

  Networking._(this.environment);
  
  factory Networking({NetworkingDependencyProvider? dependencyProvider}) {
    final environment = dependencyProvider?.environment() ?? Environment();
    return Networking._(environment);
  }
  
  @override
  void whatIsYourEnvironmnet() {
    print("Networking environmnet is: ${environment.getEnvironment()}");
  }
}

