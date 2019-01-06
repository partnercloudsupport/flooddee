import 'package:flutter_foodonline/src/domian/data/entity/TransactionEntity.dart';
import 'package:meta/meta.dart';

abstract class TransactionRepository {
  getByOrderId({@required String orderId});
}
