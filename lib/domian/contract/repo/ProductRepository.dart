import 'package:flutter/foundation.dart';

abstract class ProductRepository {
  getById({@required String productId}) {}

  getWithPaging(int limit, [String start]) {}
}
