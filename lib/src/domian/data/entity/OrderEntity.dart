import 'package:flutter_foodonline/src/domian/data/aggregate/ProductQTY.dart';
import 'package:flutter_foodonline/src/domian/data/entity/TransactionEntity.dart';
import 'package:flutter_foodonline/src/domian/exception/BadRequestError.dart';
import 'package:flutter_foodonline/src/domian/exception/NotFoundError.dart';
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
    this.orderId = data["orderId"];
    this.userId = data["userId"];
    this._products = data["products"];
    this.totalPrice = data["totalPrice"];
    this.status = data["status"];
    this.createdAt = data["createdAt"];
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
    _validateToChangeStatus(transaction);
    if (transaction.status != TransactionStatus.CHARGED)
      throw BadRequestError.TX_STATUS_NOT_CHARGED;
    if (this.status != OrderStatus.PENDING)
      throw BadRequestError.ORDER_STATUS_NOT_PENDING;
    this.status = OrderStatus.PAID;
  }

  refund({@required TransactionEntity transaction}) {
    _validateToChangeStatus(transaction);
    if (transaction.status != TransactionStatus.REFUNDED)
      throw BadRequestError.TX_STATUS_NOT_REFUNDED;
    if (this.status != OrderStatus.PAID)
      throw BadRequestError.ORDER_STATUS_NOT_PAID;
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

  _validateToChangeStatus(TransactionEntity tx) {
    if (this._products.length < 1) throw NotFoundError.PRODUCT_NOT_FOUND;
    if (this.totalPrice < 1) throw BadRequestError.INVALID_ORDER_TOTAL_PRICE;
    if (this.orderId != tx.orderId)
      throw BadRequestError.ORDER_AND_TX_NOT_MATCHED;
    if (tx.amount < 1) throw BadRequestError.INVALID_TX_AMOUNT;
  }
}
