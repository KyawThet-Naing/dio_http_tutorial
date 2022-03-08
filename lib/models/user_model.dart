class UserModel {
  String? name;
  int? age;
  String? id;

  UserModel({
    this.name,
    this.age,
    this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    age = json['age'] as int?;
    id = json['id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['age'] = age;
    json['id'] = id;
    return json;
  }
}
