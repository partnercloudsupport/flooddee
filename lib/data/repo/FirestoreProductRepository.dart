import 'package:flutter_foodonline/domian/contract/repo/ProductRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_foodonline/domian/data/entity/ProductEntity.dart';

class FirestoreProductRepository extends ProductRepository {
  var productCollection = "products";

  @override
  getById({String productId}) async {
    var documentSnapshot = await Firestore.instance
        .collection(productCollection)
        .document(productId)
        .get();
    var product = this.getProduct(documentSnapshot);
    return product;
  }

  @override
  getWithPaging(int limit, [String start]) async {
    var querySnapshot = await Firestore.instance
        .collection(productCollection)
        .orderBy("name")
        .limit(limit)
        .getDocuments();
    var products = <ProductEntity>[];
    for (var doc in querySnapshot.documents) {
      products.add(getProduct(doc));
    }
    return products;
  }

  getProduct(DocumentSnapshot doc) {
    return ProductEntity()
      ..id = doc.data["productId"]
      ..name = doc.data["name"]
      ..desc = doc.data["desc"]
      ..price = doc.data["price"]
      ..image = doc.data["image"]
      ..createdAt = doc.data["createdAt"]
      ..updatedAt = doc.data["updatedAt"];
  }
}
