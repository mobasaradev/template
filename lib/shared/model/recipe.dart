import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Recipe extends Equatable {
  int id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;

  Recipe({
    required this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'cuisine': cuisine,
      'caloriesPerServing': caloriesPerServing,
      'tags': tags,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'mealType': mealType,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      name: json['name'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      instructions: List<String>.from(json['instructions'] as List),
      prepTimeMinutes: json['prepTimeMinutes'] as int,
      cookTimeMinutes: json['cookTimeMinutes'] as int,
      cuisine: json['cuisine'] as String,
      caloriesPerServing: json['caloriesPerServing'] as int,
      tags: List<String>.from(json['tags'] as List),
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      mealType: List<String>.from(json['mealType'] as List),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        ingredients,
        instructions,
        prepTimeMinutes,
        cookTimeMinutes,
        cuisine,
        caloriesPerServing,
        tags,
        image,
        rating,
        reviewCount,
        mealType,
      ];
}
