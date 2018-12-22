import 'package:flutter_foodonline/domian/data/input/GetProductInput.dart';
import 'package:flutter_foodonline/domian/data/input/GetProductsInput.dart';

abstract class ProductService {
  get(GetProductInput input) {}

  gets(GetProductsInput input) {}
}
