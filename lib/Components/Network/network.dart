import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pilot/Components/Network/DependencyProvider/network_dependency_provider_interface.dart';

abstract class NetworkProtocol {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, {Map<String, dynamic>? body, Map<String, String>? headers});
}

// A wrapper class for handling HTTP requests using the http package.
class Network implements NetworkProtocol {
  final http.Client _client;

  Network._(this._client);

  factory Network({NetworkDependencyProvider? dependencyProvider}) {
    
    final http.Client httpClient = dependencyProvider?.client() ?? http.Client();

    return Network._(httpClient);
  }

  // Static method to perform a GET request
  // Takes a URL as a parameter and returns the response body
  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await _client.get(Uri.parse(url));
      return response.body;
    } catch (e) {
      print('Network: Error during GET request: $e');
      throw Exception('Network: Failed to perform GET request');
    }
  }

  // Static method to perform a POST request
  // Takes a URL, an optional Map representing the request body, and optional headers
  // Returns the response body
  @override
  Future<dynamic> post(String url, {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      final mergedHeaders = {...?headers, 'Content-Type': 'application/json'};
      final response = await _client.post(
        Uri.parse(url),
        body: body != null ? jsonEncode(body) : null,
        headers: mergedHeaders,
      );
      return response.body;
    } catch (e) {
      print('Network: Error during POST request: $e');
      throw Exception('Network: Failed to perform POST request');
    }
  }
}