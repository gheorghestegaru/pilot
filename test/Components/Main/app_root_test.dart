import 'package:flutter_test/flutter_test.dart';
import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_model.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_view_model.dart';
import 'package:pilot/Components/Main/Features/Main/Router/app_router.dart';
import 'package:pilot/Components/Main/app_root.dart';
import 'Mocks/mock_app_root_dependency_provider.dart';

void main() {
  group('Main Component', () {

    setUp(() {
        TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('Main Module setup test', () async {
      // Arrange
      final appRoot = AppRoot(dependencyProvider: MockAppRootDependencyProvider());

      // Act
      final router = appRoot.router();

      // Assert
      expect(router, isNotNull);
    }); 

    test('Router setup test', () async {
      // Arrange
      final dependencyProvider = MockAppRootDependencyProvider();
      final appRootNetwork = AppRootNetwork(network: dependencyProvider.network());
      final router = AppRouterImpl(network: appRootNetwork);
      
      // Act
      final homeScreen = router.home();

      // Assert
      expect(homeScreen, isA<HomeScreen>());
      expect(router.network, isNotNull);
    });

    test('HomeScreen viewModel get first recipe test', () async {
      // Arrange
      final dependencyProvider = MockAppRootDependencyProvider();
      final appRootNetwork = AppRootNetwork(network: dependencyProvider.network());
      final viewModel = HomeScreenViewModel(network: appRootNetwork, model: HomeScreenModel());
 
      // Act
      final result = await viewModel.getFirstRecipe();

      // Assert
      expect(result, 'Classic Boeuf Bourguignon');
    });
  });
}



