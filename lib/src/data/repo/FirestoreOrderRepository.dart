import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_foodonline/src/domian/contract/repo/OrderRepository.dart';
import 'package:flutter_foodonline/src/domian/data/aggregate/OrderPaging.dart';
import 'package:flutter_foodonline/src/domian/data/entity/OrderEntity.dart';
import 'package:meta/meta.dart';

class FirestoreOrderRepository extends OrderRepository {
  var orderCollection = "orders";

  @override
  upsert(OrderEntity orderEntity) async {
    await Firestore.instance
        .collection(orderCollection)
        .document(orderEntity.orderId)
        .setData(orderEntity.toMap());
    return true;
  }

  @override
  getWithPaging(String userId, int limit, [DateTime start]) async {
    var query = Firestore.instance
        .collection(orderCollection)
        .where("userId", isEqualTo: userId)
        .orderBy("createdAt", descending: true);
    if (start != null) {
      query.startAfter([start]);
    }
    var querySnapshot = await query.limit(limit).getDocuments();
    var orderPaging = OrderPaging()
      ..orders = <OrderEntity>[]
      ..start = querySnapshot.documents.last.data["createdAt"];
    for (var doc in querySnapshot.documents) {
      orderPaging.orders.add(OrderEntity.fromJson(doc.data));
    }
    return orderPaging;
  }

  @override
  getById({@required String orderId}) async {
    var documentSnapshot =
        await Firestore.instance.collection(orderCollection).document(orderId).get();
    return OrderEntity.fromJson(documentSnapshot.data);
  }
}
