import 'package:flutter_foodonline/src/domian/data/input/order/CreateOrderInput.dart';
import 'package:flutter_foodonline/src/domian/data/input/order/GetOrderInput.dart';
import 'package:flutter_foodonline/src/domian/data/input/order/GetOrdersInput.dart';

abstract class OrderService {
  create(CreateOrderInput input);

  get(GetOrderInput input);

  gets(GetOrdersInput input);
}
