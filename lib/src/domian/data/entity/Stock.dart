import 'package:flutter_foodonline/src/domian/exception/BadRequestError.dart';

class StockEntity {
  String productId;
  int qty;
  int price;

  withdraw(int qty) {
    if ((this.qty - qty) < 0) throw BadRequestError.PRODUCT_OUT_STOCK;
    this.qty -= qty;
  }

  deposit(int qty) {
    this.qty += qty;
  }

  isStockEnough(int qty) {
    return this.qty >= qty;
  }
}
