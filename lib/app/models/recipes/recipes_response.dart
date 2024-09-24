class RecipesResponse {
  List<Recipe> recipes;

  RecipesResponse(this.recipes);

  factory RecipesResponse.fromJson(Map<String, dynamic> json) =>
      RecipesResponse(
          List.from(json['recipes'].map((e) => Recipe.fromJson(e))));
}

class Recipe {
  String id;
  String name;
  List<String> ingredientIds = [];
  String description;
  String duration;
  String? headerImageUrl;

  factory Recipe.mock(
          String id, String name, String description, String headerImageUrl) =>
      Recipe(id, name, [], description, '30 min', headerImageUrl);

  Recipe(this.id, this.name, this.ingredientIds, this.description,
      this.duration, this.headerImageUrl);

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
      json['id'],
      json['name'],
      List.from(json['ingredients'].map((e) => e)),
      json['description'],
      json['duration'],
      json['header_image_url']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'ingredients': ingredientIds,
        'description': description,
        'duration': duration,
        'headerImageUrl': headerImageUrl
      };
}
