class RecipesResponse {
  List<Recipe> recipes;

  RecipesResponse(this.recipes);

  factory RecipesResponse.fromJson(Map<String, dynamic> json) =>
      RecipesResponse(
          List.from(json['recipes'].map((e) => Recipe.fromJson(e))));
}

class Recipe {
  int id;
  String name;
  List<int> ingredients;
  String description;
  String duration;
  String? headerImageUrl;

  Recipe(this.id, this.name, this.ingredients, this.description, this.duration,
      this.headerImageUrl);

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
      json['id'],
      json['name'],
      List.from(json['ingredients'].map((e) => e)),
      json['description'],
      json['duration'],
      json['header_image_url']);
}
