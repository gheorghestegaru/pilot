import 'dart:convert';
import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Main/Adapters/Network/DTOs/recipe.dart';
import 'package:pilot/Components/Network/network.dart';

class AppRootNetwork {
  final NetworkProtocol network;
  final AuthenticationProtocol auth;
  static const String baseUrlHost = "api.spoonacular.com";
  static const String spoonacularApiKey = "0793e5849b644a0d8cb4876de125a6d5";

  AppRootNetwork({required this.network, required this.auth});

  // Method to execute a GET request for random recipes using the provided parameters
  Future<List<Recipe>?> executeRandomRecipesGetRequest() async {
    try {
      final url = Uri(
        scheme: "https",
        host: baseUrlHost,
        path: "recipes/random",
        queryParameters: {
          "number": "20",
          "apiKey": spoonacularApiKey,
        },
      );

      final responseJsonStr = await network.get(url.toString());

      // map the "recipes" list to a list of Recipe objects
      Map<String, dynamic> jsonMap = json.decode(responseJsonStr);

      final List<Recipe>? recipes = (jsonMap['recipes'] as List<dynamic>?)
          ?.map((recipeJson) => Recipe.fromJson(recipeJson))
          .toList();

      return recipes;
    } catch (e) {
      print('AppRootNetwork: Error during GET request: $e');
      throw Exception('AppRootNetwork: Failed to execute random recipes GET request');
    }
  }
}

