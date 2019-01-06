import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_foodonline/src/domian/contract/repo/StockRepository.dart';
import 'package:flutter_foodonline/src/domian/data/aggregate/ProductStock.dart';

class FirestoreProductStockRepository extends ProductStockRepository {
  var stockCollection = "stock";

  @override
  getById({String productId}) async {
    var documentSnapshot = await Firestore.instance
        .collection(stockCollection)
        .document(productId)
        .get();
    return ProductStockEntity.fromJson(documentSnapshot.data);
  }

  @override
  getByIds(List<String> productIds) async {
    var querySnapshot = await Firestore.instance
        .collection(stockCollection)
        .where("productId", arrayContains: productIds)
        .getDocuments();
    var stocks = <ProductStockEntity>[];
    querySnapshot.documents.forEach((documentSnapshot) {
      stocks.add(ProductStockEntity.fromJson(documentSnapshot.data));
    });
    return stocks;
  }

  @override
  upsert(ProductStockEntity stock) async {
    await Firestore.instance
        .collection(stockCollection)
        .document(stock.productId)
        .setData(stock.toMap());
    return true;
  }
}
