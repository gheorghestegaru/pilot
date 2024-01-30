import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MockClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String jsonString = '{"mocked": "mocked"}';

    if (request.url.path == "/recipes/random") {
      jsonString = await rootBundle.loadString('assets/mocks/mock_get_random_recipes.json');      
    }
    
    return Future.value(http.StreamedResponse(
      http.ByteStream.fromBytes(utf8.encode(jsonString)),
      200,
      contentLength: utf8.encode(jsonString).length,
    ));
  }
}

