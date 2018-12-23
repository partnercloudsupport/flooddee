import 'package:flutter_foodonline/src/domian/contract/repo/ProductRepository.dart';
import 'package:flutter_foodonline/src/domian/contract/service/ProductService.dart';
import 'package:flutter_foodonline/src/domian/data/input/product/GetProductInput.dart';
import 'package:flutter_foodonline/src/domian/data/input/product/GetProductsInput.dart';

class ProductServiceImpl extends ProductService {
  ProductRepository productRepository;

  ProductServiceImpl({this.productRepository});

  @override
  get(GetProductInput input){
    return productRepository.getById(productId: input.id);
  }

  @override
  gets(GetProductsInput input){
    return productRepository.getWithPaging(input.limit, input.start);
  }
}
