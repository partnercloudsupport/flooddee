import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_foodonline/src/domian/contract/repo/PaymentRepository.dart';
import 'package:flutter_foodonline/src/domian/data/aggregate/ProductStock.dart';
import 'package:flutter_foodonline/src/domian/data/entity/OrderEntity.dart';
import 'package:flutter_foodonline/src/domian/data/entity/TransactionEntity.dart';

class FirestorePaymentRepository extends PaymentRepository {
  final _paymentCollection = "paymants";

  @override
  savePayment(OrderEntity order, TransactionEntity transaction,
      ProductStockEntity productStock) async {
    await Firestore.instance
        .collection(_paymentCollection)
        .document(order.orderId)
        .setData(<String, dynamic>{
      "order": order.toMap(),
      "transaction": transaction.toMap(),
      "productStock": productStock.toMap()
    });
    return true;
  }
}
