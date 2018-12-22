import 'package:flutter_foodonline/domian/contract/repo/ProductRepository.dart';
import 'package:flutter_foodonline/domian/contract/service/ProductService.dart';
import 'package:flutter_foodonline/domian/data/input/GetProductInput.dart';
import 'package:flutter_foodonline/domian/data/input/GetProductsInput.dart';

class ProductServiceImpl extends ProductService {
  ProductRepository productRepository;

  ProductServiceImpl({ProductRepository productRepository}) {
    this.productRepository = productRepository;
  }

  @override
  get(GetProductInput input) {
    return productRepository.getById(productId: input.id);
  }

  @override
  gets(GetProductsInput input) {
    return productRepository.getWithPaging(input.limit, input.start);
  }
}
