import 'package:api_template/modules/recipe/controller/recipe_controller.dart';
import 'package:api_template/modules/recipe/view/recipe_view.dart';
import 'package:api_template/shared/repositories/recipe_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});
  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const RecipePage(),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeController(recipeRepo: RecipeRepo()),
      child: const RecipeView(),
    );
  }
}
