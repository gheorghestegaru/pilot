import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/DependencyProvider/app_root_dependency_provider_interface.dart';
import 'package:pilot/Components/Main/Flows/Main/Router/app_router.dart';
import 'package:pilot/Components/Network/network.dart';

class AppRoot {
  final AppRouter _router;

  AppRoot._(this._router);

  factory AppRoot({AppRootDependencyProvider? dependencyProvider}) {
 
    final network = dependencyProvider?.network() ?? Network();

    final appRootNetwork = AppRootNetwork(network: network);
    final router = AppRouterImpl(network: appRootNetwork);
    
    print("Did init App Root.");
    return AppRoot._(router);
  }
  
  AppRouter router() {
    return _router;
  }
}