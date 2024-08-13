import 'package:api_template/shared/model/recipe.dart';
import 'package:api_template/shared/repositories/recipe_repo.dart';
import 'package:flutter/material.dart';

class RecipeController extends ChangeNotifier {
  // Constructor body use as initial function.
  RecipeController({required RecipeRepo recipeRepo}) {
    _isLoading = true;
    recipeRepo.recipe().then((recipes) {
      _recipes = recipes!;
      _isLoading = false;
      notifyListeners();
    });
  }

  // state
  List<Recipe> _recipes = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Recipe>? get recipes => _recipes;
}
