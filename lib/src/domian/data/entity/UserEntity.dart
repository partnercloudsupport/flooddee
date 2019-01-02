class UserEntity {
  String userId;
  String email;
  String password;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  UserEntity.fromJson(Map<String, dynamic> data) {
    this.userId = data["userId"];
    this.email = data["email"];
    this.password = data["password"];
    this.name = data["name"];
    this.createdAt = data["createdAt"];
    this.updatedAt = data["updatedAt"];
  }

  toMap() {
    return <String, dynamic>{
      "userId": userId,
      "email": email,
      "password": password,
      "name": name,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }
}
