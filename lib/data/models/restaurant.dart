class Restaurant {
  final String name;
  final String urlImage;

  Restaurant({
    required this.name,
    required this.urlImage,
  });
  
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['restaurant'],
      urlImage: json['url_image']
    );
  }
}
