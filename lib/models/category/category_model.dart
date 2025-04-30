import 'dart:convert';

class CategoryModel {
    final int id;
    final String name;
    final String description;
    final String display;
    final String image;
    final int count;

    CategoryModel({
        required this.id,
        required this.name,
        required this.description,
        required this.display,
        required this.image,
        required this.count,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        display: json["display"],
        image: json["image"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "display": display,
        "image": image,
        "count": count,
    };
}
