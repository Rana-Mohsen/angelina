class UserDataModel {
  String? imagePath; 
  String? name;
  String? email;

  UserDataModel({this.imagePath, this.name, this.email});

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
      };

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
      );
}