import 'package:flutter_foodonline/src/domian/data/aggregate/ProductQTY.dart';

class CreateOrderInput {
  String userId;
  List<ProductQTY> productQTYs;
  int totalPrice;

  CreateOrderInput({this.userId, this.productQTYs, this.totalPrice});
}
