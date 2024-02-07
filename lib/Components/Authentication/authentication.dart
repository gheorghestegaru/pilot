import 'package:pilot/Components/Authentication/DependencyProvider/authentication_dependency_provider.dart';
import 'package:pilot/Components/Network/network.dart';

abstract class AuthenticationProtocol {
  Future<bool> login(String username, String password);
  Future<void> logout();
  Future<bool> isLoggedIn();
}

class Authentication implements AuthenticationProtocol {
  final NetworkProtocol _network;

  Authentication._(this._network);

  final Map<String, String> _credentials = {};

  factory Authentication({AuthenticationDependencyProvider? dependencyProvider}) {
    final network = dependencyProvider?.network() ?? Network();
    return Authentication._(network);
  }

  @override
  Future<bool> login(String username, String password) async {
    print("using $_credentials instead of $_network for now...");
    
    // Use the dictionary to store credentials 
    // instead of performing calls to network component.
    if (_credentials.isEmpty) {
      _credentials[username] = password;
      return true;
    } else {
      print('Authentication: Another user is already logged in');
      return false;
    } 
  }

  @override
  Future<void> logout() async {
    // Perform logout actions, in this case, just clearing the credentials
    _credentials.clear();
  }

  @override
  Future<bool> isLoggedIn() async {
    // Return true if there is a user currently logged in
    return _credentials.isNotEmpty;
  }
}

