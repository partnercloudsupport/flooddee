class ProductEntity {
  String id;
  String name;
  num price;
  String desc;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  ProductEntity.fromJson(Map<String, dynamic> data) {
    id = data["productId"];
    name = data["name"];
    desc = data["desc"];
    price = data["price"];
    image = data["image"];
    createdAt = data["createdAt"];
    updatedAt = data["updatedAt"];
  }
}
