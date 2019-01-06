import 'package:flutter_foodonline/src/domian/data/aggregate/ProductStock.dart';
import 'package:meta/meta.dart';

abstract class ProductStockRepository {
  getById({@required String productId});

  upsert(ProductStockEntity productStock);

  getByIds(List<String> productIds);
}
