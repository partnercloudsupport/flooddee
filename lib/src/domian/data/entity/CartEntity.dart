import 'package:flutter_foodonline/src/domian/data/aggregate/ProductQTY.dart';
import 'package:flutter_foodonline/src/domian/data/aggregate/ProductStock.dart';
import 'package:flutter_foodonline/src/domian/exception/BadRequestError.dart';
import 'package:flutter_foodonline/src/domian/exception/Exceptions.dart';
import 'package:flutter_foodonline/src/domian/exception/NotFoundError.dart';

class CartEntity {
  String userId;
  List<String> productIds;
  List<ProductQTY> products;

  CartEntity();

  CartEntity.fromJson(Map<String, dynamic> data) {
    this.userId = data["userId"];
    this.productIds = data["productIds"];
    this.products = data["products"];
  }

  toMap() {
    return <String, dynamic>{
      "userId": userId,
      "productIds": productIds,
      "products": products
    };
  }

  checkStock(ProductQTY productQTY, ProductStockEntity productStock) {
    if (productQTY.product.id != productStock.productId)
      throw BadRequestError.PRODUCT_NOT_MATCHED;

    var indexInCart = this.productIds.indexOf(productQTY.product.id);
    var qty = productQTY.qty;

    if (indexInCart != -1) {
      qty += products[indexInCart].qty;
    }

    if (!productStock.isStockEnough(qty)) throw BadRequestError.PRODUCT_OUT_STOCK;
  }

  add(ProductQTY productQTY, ProductStockEntity productStock) {
    try {
      this.checkStock(productQTY, productStock);

      var indexInCart = this.productIds.indexOf(productQTY.product.id);

      if (indexInCart != -1) this.products[indexInCart].qty += productQTY.qty;
    } on BadRequestException catch (e) {
      if (e.code == BadRequestError.PRODUCT_OUT_STOCK.code) {
        if (productQTY.product.id != null) {
          this.productIds.add(productQTY.product.id);
        }
        this.products.add(productQTY);
      }
    }
  }

  remove(String productId) {
    var indexInCart = this.productIds.indexOf(productId);
    if (indexInCart != -1) {
      this.productIds.removeAt(indexInCart);
      this.products.removeAt(indexInCart);
    } else {
      throw NotFoundError.PRODUCT_NOT_FOUND;
    }
  }

  updateQTY(ProductQTY productQTY, ProductStockEntity productStock) {
    if (productQTY.product.id != productStock.productId)
      throw BadRequestError.PRODUCT_NOT_MATCHED;
    if (!productStock.isStockEnough(productQTY.qty))
      throw BadRequestError.PRODUCT_OUT_STOCK;

    if (productQTY.qty < 1) {
      this.remove(productQTY.product.id);
    } else {
      var indexInCart = this.productIds.indexOf(productQTY.product.id);
      if (indexInCart != -1) {
        this.products[indexInCart] = productQTY;
      } else {
        throw NotFoundError.PRODUCT_NOT_FOUND;
      }
    }
  }

  updatePrice(String productId, int price) {
    var indexInCart = this.productIds.indexOf(productId);
    if (indexInCart != -1) {
      this.products[indexInCart].product.price = price;
    } else {
      throw NotFoundError.PRODUCT_NOT_FOUND;
    }
  }

  get(String productId) {
    var indexInCart = this.productIds.indexOf(productId);
    return indexInCart != 1 ? this.products[indexInCart] : null;
  }

  clear() {
    this.productIds.clear();
    this.products.clear();
  }

  getTotalPrice() {
    var totalPrice = 0;
    products.forEach((productQTY) {
      var summary = productQTY.product.price * productQTY.qty;
      if (summary != null) totalPrice += summary;
    });
    return totalPrice;
  }
}
