import 'package:flutter_foodonline/src/domian/data/entity/OrderEntity.dart';

class OrderPaging {
  List<OrderEntity> orders;
  String start;

  OrderPaging({this.orders, this.start});
}
