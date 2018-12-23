import 'package:flutter_foodonline/src/domian/data/entity/OrderEntity.dart';
import 'package:meta/meta.dart';

abstract class OrderRepository {
  upsert(OrderEntity orderEntity);

  getById({@required String orderId});

  getWithPaging(String userId, int limit, [DateTime start]);
}
