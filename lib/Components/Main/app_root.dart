import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/DependencyProvider/app_root_dependency_provider_interface.dart';
import 'package:pilot/Components/Main/Features/Main/Router/app_router.dart';
import 'package:pilot/Components/Network/network.dart';

class AppRoot {
  final AppRouter _router;

  AppRoot._(this._router);

  factory AppRoot({AppRootDependencyProvider? dependencyProvider}) {
 
    final network = dependencyProvider?.network() ?? Network();
    final authentication = dependencyProvider?.authentication() ?? Authentication();

    final appRootNetwork = AppRootNetwork(network: network, auth: authentication);
    final router = AppRouterImpl(network: appRootNetwork, auth: authentication);
    
    return AppRoot._(router);
  }
  
  AppRouter router() {
    return _router;
  }
}