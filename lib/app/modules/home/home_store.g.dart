// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$controllerAtom = Atom(name: 'HomeStoreBase.controller');

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

  final _$ordersAtom = Atom(name: 'HomeStoreBase.orders');

  @override
  List<OrderModel> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(List<OrderModel> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  @override
  String toString() {
    return '''
controller: ${controller},
orders: ${orders}
    ''';
  }
}
