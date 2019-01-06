import 'package:flutter_foodonline/src/domian/exception/BadRequestError.dart';

class ProductStockEntity {
  String productId;
  int qty;
  int price;

  ProductStockEntity.fromJson(Map<String, dynamic> data) {
    this.productId = data["productId"];
    this.qty = data["qty"];
    this.price = data["price"];
  }

  toMap() {
    return <String, dynamic>{
      "productId": productId,
      "qty": qty,
      "price": price
    };
  }

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
