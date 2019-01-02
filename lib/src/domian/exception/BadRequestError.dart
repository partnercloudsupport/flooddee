import 'package:flutter_foodonline/src/domian/exception/Exceptions.dart';

class BadRequestError {
  static const VALIDATE_ERROR =
      BadRequestException("40001", "Validation error");
  static const EMAIL_EXIST =
      BadRequestException("40002", "User email already exist");
  static const ORDER_STATUS_NOT_PENDING =
      BadRequestException("40003", "Can not paid, order status is not pending");
  static const ORDER_STATUS_NOT_PAID =
      BadRequestException("40004", "Can not refund, order status is not paid");
  static const TX_STATUS_NOT_CHARGED =
      BadRequestException("40005", "Transaction is not charged status");
  static const TX_STATUS_NOT_REFUNDED =
      BadRequestException("40006", "Transaction is not refunded status");
  static const INVALID_ORDER_TOTAL_PRICE =
      BadRequestException("40007", "Order total price less than 1");
  static const ORDER_AND_TX_NOT_MATCHED = BadRequestException(
      "40008", "Order id and transaction id are not matched");
  static const INVALID_TX_AMOUNT =
      BadRequestException("40009", "Amount in transaction less than 1");
  static const PRODUCT_NOT_MATCHED =
      BadRequestException("40010", "Products are not matched");
  static const PRODUCT_OUT_STOCK =
      BadRequestException("40011", "Product out of stock");
  static const PRODUCT_EXIST =
      BadRequestException("40012", "Product name already exist");
}
