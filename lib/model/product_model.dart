
class ProductModel {
  int id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String creationAt;
  String updatedAt;
  Category? category;

  ProductModel({
    required this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    required this.creationAt,
    required this.updatedAt,
     this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    creationAt: json["creationAt"],
    updatedAt: json["updatedAt"],
    category: Category.fromJson(json["category"]),
  );

}

class Category {
  int id;
  String? name;
  String? image;
  String creationAt;
  String updatedAt;

  Category({
    required this.id,
    this.name,
    this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>  Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    creationAt: json["creationAt"],
    updatedAt: json["updatedAt"],
  );

}
