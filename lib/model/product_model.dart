class Products {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  Products(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        images: json['images'].cast<String>(),
        creationAt: json['creationAt'],
        updatedAt: json['updatedAt'],
        category: json['category'] != null
            ? Category.fromJson(json['category'])
            : null);
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        creationAt: json['creationAt'],
        updatedAt: json['updatedAt']);
  }
}
