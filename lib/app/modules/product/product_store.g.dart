// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStoreBase, Store {
  final _$menuSelectedAtom = Atom(name: '_ProductStoreBase.menuSelected');

  @override
  String get menuSelected {
    _$menuSelectedAtom.reportRead();
    return super.menuSelected;
  }

  @override
  set menuSelected(String value) {
    _$menuSelectedAtom.reportWrite(value, super.menuSelected, () {
      super.menuSelected = value;
    });
  }

  final _$productPriceAtom = Atom(name: '_ProductStoreBase.productPrice');

  @override
  double get productPrice {
    _$productPriceAtom.reportRead();
    return super.productPrice;
  }

  @override
  set productPrice(double value) {
    _$productPriceAtom.reportWrite(value, super.productPrice, () {
      super.productPrice = value;
    });
  }

  final _$productListAtom = Atom(name: '_ProductStoreBase.productList');

  @override
  List<ProductModel> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(List<ProductModel> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  final _$productNameAtom = Atom(name: '_ProductStoreBase.productName');

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  final _$suppliesAtom = Atom(name: '_ProductStoreBase.supplies');

  @override
  List<SupplieModel> get supplies {
    _$suppliesAtom.reportRead();
    return super.supplies;
  }

  @override
  set supplies(List<SupplieModel> value) {
    _$suppliesAtom.reportWrite(value, super.supplies, () {
      super.supplies = value;
    });
  }

  final _$registeresSuppliesAtom =
      Atom(name: '_ProductStoreBase.registeresSupplies');

  @override
  List<SupplieModel> get registeresSupplies {
    _$registeresSuppliesAtom.reportRead();
    return super.registeresSupplies;
  }

  @override
  set registeresSupplies(List<SupplieModel> value) {
    _$registeresSuppliesAtom.reportWrite(value, super.registeresSupplies, () {
      super.registeresSupplies = value;
    });
  }

  final _$controllerAtom = Atom(name: '_ProductStoreBase.controller');

  @override
  StreamController<dynamic> get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(StreamController<dynamic> value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$counterAtom = Atom(name: '_ProductStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$supplieValueAtom = Atom(name: '_ProductStoreBase.supplieValue');

  @override
  String get supplieValue {
    _$supplieValueAtom.reportRead();
    return super.supplieValue;
  }

  @override
  set supplieValue(String value) {
    _$supplieValueAtom.reportWrite(value, super.supplieValue, () {
      super.supplieValue = value;
    });
  }

  final _$_ProductStoreBaseActionController =
      ActionController(name: '_ProductStoreBase');

  @override
  dynamic toggleMenu(String menu) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.toggleMenu');
    try {
      return super.toggleMenu(menu);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menuSelected: ${menuSelected},
productPrice: ${productPrice},
productList: ${productList},
productName: ${productName},
supplies: ${supplies},
registeresSupplies: ${registeresSupplies},
controller: ${controller},
counter: ${counter},
supplieValue: ${supplieValue}
    ''';
  }
}
