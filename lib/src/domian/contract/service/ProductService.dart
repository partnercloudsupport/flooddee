import 'package:flutter_foodonline/src/domian/data/input/product/GetProductInput.dart';
import 'package:flutter_foodonline/src/domian/data/input/product/GetProductsInput.dart';

abstract class ProductService {
  get(GetProductInput input);

  gets(GetProductsInput input);
}
