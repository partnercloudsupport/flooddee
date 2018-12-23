import 'package:flutter_foodonline/src/domian/data/entity/ProductEntity.dart';

class ProductPaging {
  List<ProductEntity> products;
  String start;

  ProductPaging({this.products, this.start});
}
