import 'dart:convert';

import 'package:api_template/shared/model/recipe.dart';
import 'package:api_template/shared/services/web_api_service.dart';

class RecipeRepo {
  final _webApiService = WebApiService();

  Future<List<Recipe>?> recipe() async {
    final response = await _webApiService.requestRecipes();
    if (response != null) {
      final responseBody = await response.stream.bytesToString();
      final jsonMap = jsonDecode(responseBody) as Map?;
      if (jsonMap != null) {
        // For fetch list
        final recipes = jsonMap['recipes'];
        // for run a loop in a list
        final recipe = [for (var recipe in recipes) Recipe.fromJson(recipe)];
        return recipe;
      }
    }
    return null;
  }
}
