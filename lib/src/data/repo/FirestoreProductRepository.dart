import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_foodonline/src/domian/contract/repo/ProductRepository.dart';
import 'package:flutter_foodonline/src/domian/data/aggregate/ProductPaging.dart';
import 'package:flutter_foodonline/src/domian/data/entity/ProductEntity.dart';

class FirestoreProductRepository extends ProductRepository {
  var productCollection = "products";

  @override
  getById({String productId}) async {
    var documentSnapshot =
        await Firestore.instance.collection(productCollection).document(productId).get();
    var product = ProductEntity.fromJson(documentSnapshot.data);
    return product;
  }

  @override
  getWithPaging(int limit, [String start]) async {
    var query = Firestore.instance.collection(productCollection).orderBy("name");
    if (start != null) {
      query.startAfter([start]);
    }
    var querySnapshot = await query.limit(limit).getDocuments();
    var productPaging = ProductPaging()
      ..products = <ProductEntity>[]
      ..start = querySnapshot.documents.last.data["name"];
    for (var doc in querySnapshot.documents) {
      productPaging.products.add(ProductEntity.fromJson(doc.data));
    }
    return productPaging;
  }
}
