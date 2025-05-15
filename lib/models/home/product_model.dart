class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String dateCreated;
  final List<Category> categories;
  final List<ProductImage> images;
  final List<Attribute> attributes;
  int count;
  bool isFav;
  bool buttonEnabled;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.dateCreated,
    required this.categories,
    required this.images,
    required this.attributes,
    this.count = 1,
    this.isFav = false,
    this.buttonEnabled = true,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    dateCreated:json["date_created"],
    categories: List<Category>.from(
      json["categories"].map((x) => Category.fromJson(x)),
    ),
    images: List<ProductImage>.from(
      json["images"].map((x) => ProductImage.fromJson(x)),
    ),
    attributes: List<Attribute>.from(
      json["attributes"].map((x) => Attribute.fromJson(x)),
    ),
    isFav: json["isFav"] ?? false,
    count: json["count"] ?? 1,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "date_created":dateCreated,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "isFav": isFav,
    "count": count,
  };
}

class Attribute {
  final int id;
  final String name;
  final String slug;
  final int position;
  final bool visible;
  final bool variation;
  final List<String> options;

  Attribute({
    required this.id,
    required this.name,
    required this.slug,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    position: json["position"],
    visible: json["visible"],
    variation: json["variation"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "position": position,
    "visible": visible,
    "variation": variation,
    "options": List<dynamic>.from(options.map((x) => x)),
  };
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class ProductImage {
  final int id;
  final DateTime dateCreated;
  final DateTime dateCreatedGmt;
  final DateTime dateModified;
  final DateTime dateModifiedGmt;
  final String src;
  final String name;
  final String alt;

  ProductImage({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
  };
}
