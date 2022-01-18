import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurant/app/modules/home/home_store.dart';
import 'package:restaurant/helpers/product/model/productModel.dart';
import 'package:restaurant/helpers/product/service/productService.dart';
import 'package:restaurant/helpers/supplies/model/supplieModel.dart';
import 'package:restaurant/helpers/supplies/services/supplieService.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  HomeStore homeStore;
  ProductService productService;
  SupplieService supplieService;

  _ProductStoreBase(this.homeStore, this.productService, this.supplieService);

  // TextEditingController priceController = TextEditingController();

  // TextEditingController nameController = TextEditingController();

  @observable
  String menuSelected = 'Produtos';

  @observable
  double productPrice = 0.0;

  @observable
  List<ProductModel> productList = [];

  @observable
  String productName = '';

  @observable
  List<SupplieModel> supplies = [];

  @observable
  List<SupplieModel> registeresSupplies = [];

  @observable
  StreamController controller = StreamController();

  @observable
  int counter = 0;

  @observable
  late String supplieValue = '';

  @action
  toggleMenu(String menu) {
    menuSelected = menu;
  }

  getSupplies() async {
    registeresSupplies = await supplieService.getSupplie();
    supplieValue = registeresSupplies[0].name!;
  }

  getProduct() async {
    productList =
        await productService.getProducts().then((value) => productList = value);
    controller.add(productList);
  }

  postProduct(BuildContext context) async {
    ProductModel product = ProductModel(
        name: productName, price: productPrice, supplies: supplies);
    await productService.postProduct(product);
  }

  putProduct(ProductModel product) async {
    await productService.putProduct(product);
  }

  deleteProduct(ProductModel product) async {
    await productService.deleteProduct(product);
  }
}
