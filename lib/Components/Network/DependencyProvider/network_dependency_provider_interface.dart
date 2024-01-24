import 'package:http/http.dart' as http;

abstract class NetworkDependencyProvider {
  http.Client client();
}