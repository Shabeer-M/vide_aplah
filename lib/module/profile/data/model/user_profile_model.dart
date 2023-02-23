class UserProfileModel {
  UserProfileModel({
    required this.age,
    required this.name,
    required this.email,
  });

  String age;
  String name;
  String email;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        age: json["age"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "name": name,
        "email": email,
      };
}
