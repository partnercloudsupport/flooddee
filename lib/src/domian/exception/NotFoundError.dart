import 'package:flutter_foodonline/src/domian/exception/Exceptions.dart';

class NotFoundError {
  static const USER_NOT_FOUND = NotFoundException("40401", "User not found");
  static const PRODUCT_NOT_FOUND =
      NotFoundException("40402", "Product not found");
  static const PRODUCT_STOCK_NOT_FOUND =
      NotFoundException("40403", "Product stock not found");
  static const ORDER_NOT_FOUND = NotFoundException("40404", "Order not found");
}
