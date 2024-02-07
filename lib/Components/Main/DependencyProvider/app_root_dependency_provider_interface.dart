import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Network/network.dart';

abstract class AppRootDependencyProvider {
  NetworkProtocol network();
  AuthenticationProtocol authentication();
}