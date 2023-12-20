class FormationModelResponse {
  final int? id;
  final String image;
  final String name;
  final double rating;
  final num price;

  FormationModelResponse({
    this.id,
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
  });

  factory FormationModelResponse.fromJson(Map<String, dynamic> json) {
    return FormationModelResponse(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'rating': rating,
      'price': price,
    };
  }
}

