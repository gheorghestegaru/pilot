import 'package:pilot/Components/Main/AppRootDependencyProvider/app_root_dependency_provider_interface.dart';
import 'package:pilot/Components/Main/AppRouter/app_router.dart';

class AppRoot {
  final AppRouter _router;

  AppRoot._(this._router);

  factory AppRoot({AppRootDependencyProvider? dependencyProvider}) {

    final AppRouter router = AppRouterImpl();
    
    print("Did init App Root.");
    return AppRoot._(router);
  }
  
  AppRouter router() {
    return _router;
  }
}