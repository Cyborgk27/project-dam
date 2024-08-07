class Category {
  final String name;
  final String urlImage;

  Category({
    required this.name,
    required this.urlImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      urlImage: json['url_image'],
    );
  }
}