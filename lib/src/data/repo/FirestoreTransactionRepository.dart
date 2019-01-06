import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_foodonline/src/domian/contract/repo/TransactionRepository.dart';
import 'package:flutter_foodonline/src/domian/data/entity/TransactionEntity.dart';

class FirestoreTransactionRepository extends TransactionRepository {
  var paymentsCollection = "payments";

  @override
  getByOrderId({String orderId}) async {
    var querySnapshot = await Firestore.instance
        .collection(paymentsCollection)
        .where("order.orderId", isEqualTo: orderId)
        .getDocuments();
    var transactions = <TransactionEntity>[];
    querySnapshot.documents.forEach((documentSnapshot) {
      transactions.add(TransactionEntity.fromJson(documentSnapshot.data));
    });
    return transactions;
  }
}
