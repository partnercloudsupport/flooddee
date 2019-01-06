import 'package:flutter_foodonline/src/domian/data/entity/OrderEntity.dart';
import 'package:flutter_foodonline/src/domian/data/aggregate/ProductStock.dart';
import 'package:flutter_foodonline/src/domian/data/entity/TransactionEntity.dart';

abstract class PaymentRepository {
  savePayment(OrderEntity order, TransactionEntity transaction,
      ProductStockEntity productStock);
}
