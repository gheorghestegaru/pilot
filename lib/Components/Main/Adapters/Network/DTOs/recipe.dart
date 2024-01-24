class Recipe {
  String? title;

  Recipe({this.title});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
    );
  }
}
