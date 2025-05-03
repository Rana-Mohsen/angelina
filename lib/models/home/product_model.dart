class ProductModel {
  final int id;
  final String name;
  final String description;
  final String shortDescription;
  final String sku;
  final String price;
  final bool onSale;
  final List<Category> categories;
  final List<ProductImage> images;
  final String stockStatus;
  final bool hasOptions;
   bool isFavourite;
   int count;
  ProductModel( {
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.onSale,
    required this.categories,
    required this.images,
    required this.stockStatus,
    required this.hasOptions,
    this.isFavourite = false, this.count=1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    shortDescription: json["short_description"],
    sku: json["sku"],
    price: json["price"],
    onSale: json["on_sale"],
    categories: List<Category>.from(
      json["categories"].map((x) => Category.fromJson(x)),
    ),
    images: List<ProductImage>.from(
      json["images"].map((x) => ProductImage.fromJson(x)),
    ),
    stockStatus: json["stock_status"],
    hasOptions: json["has_options"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "short_description": shortDescription,
    "sku": sku,
    "price": price,
    "on_sale": onSale,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "Products": List<dynamic>.from(images.map((x) => x.toJson())),
    "stock_status": stockStatus,
    "has_options": hasOptions,
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
