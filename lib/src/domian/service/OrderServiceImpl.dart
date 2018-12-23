import 'package:flutter_foodonline/src/domian/contract/repo/OrderRepository.dart';
import 'package:flutter_foodonline/src/domian/contract/service/OrderService.dart';
import 'package:flutter_foodonline/src/domian/data/entity/OrderEntity.dart';
import 'package:flutter_foodonline/src/domian/data/input/order/CreateOrderInput.dart';
import 'package:flutter_foodonline/src/domian/data/input/order/GetOrderInput.dart';
import 'package:flutter_foodonline/src/domian/data/input/order/GetOrdersInput.dart';
import 'dart:math';

class OrderServiceImpl extends OrderService {
  OrderRepository orderRepository;

  OrderServiceImpl({this.orderRepository});

  @override
  create(CreateOrderInput input) {
    var order = OrderEntity()
      ..orderId = Random().nextInt(10).toString()
      ..userId = input.userId
      ..totalPrice = input.totalPrice
      ..status = OrderStatus.PENDING
      ..createdAt = DateTime.now();
    return orderRepository.upsert(order);
  }

  @override
  get(GetOrderInput input) {
    return orderRepository.getById(orderId: input.orderId);
  }

  @override
  gets(GetOrdersInput input) {
    return orderRepository.getWithPaging(input.userId, input.limit, input.start);
  }
}
