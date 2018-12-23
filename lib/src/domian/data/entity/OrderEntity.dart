import 'package:flutter_foodonline/src/domian/data/aggregate/ProductQTY.dart';
import 'package:flutter_foodonline/src/domian/data/entity/TransactionEntity.dart';
import 'package:meta/meta.dart';

enum OrderStatus { PAID, REFUNDED, PENDING }

class OrderEntity {
  String orderId;
  String userId;
  List<ProductQTY> _products;
  int totalPrice;
  OrderStatus status;
  DateTime createdAt;

  OrderEntity();

  OrderEntity.fromJson(Map<String, dynamic> data) {
    orderId = data["orderId"];
    userId = data["userId"];
    _products = data["products"];
    totalPrice = data["totalPrice"];
    status = data["status"];
    createdAt = data["createdAt"];
  }

  toMap() {
    return <String, dynamic>{
      "orderId": orderId,
      "userId": userId,
      "products": _products,
      "totalPrice": totalPrice,
      "status": status,
      "createdAt": createdAt
    };
  }

  paid({@required TransactionEntity transaction}) {
    this.status = OrderStatus.PAID;
  }

  refund({@required TransactionEntity transaction}) {
    this.status = OrderStatus.REFUNDED;
  }

  addProduct(ProductQTY productQTY) {
    var index = this._products.indexWhere((ProductQTY p) {
      p.product.id = productQTY.product.id;
    });
    if (index != -1) {
      _products[index].qty += productQTY.qty;
    } else {
      _products.add(productQTY);
    }
    this.totalPrice += (_products[index].product.price * productQTY.qty);
  }

  getProduct({@required String productId}) {
    this._products.firstWhere((ProductQTY productQTY) {
      productQTY.product.id = productId;
    });
  }

  getProductIDs() {
    List<String> ids = [];
    this._products.forEach((ProductQTY productQTY) {
      ids.add(productQTY.product.id);
    });
    return ids;
  }
}
