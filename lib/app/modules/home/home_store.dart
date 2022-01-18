// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurant/helpers/const/url.dart';
import 'package:restaurant/helpers/order/model/orderModel.dart';
import 'package:restaurant/helpers/order/service/orderService.dart';
import 'package:restaurant/helpers/users/model/userModel.dart';
import 'package:restaurant/helpers/users/service/userService.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

enum orderStatus { New, inProgress, Finished }

abstract class HomeStoreBase with Store {
  @observable
  StreamController controller = StreamController();
  @observable
  List<OrderModel> orders = [];
  UserService userService = UserService();
  OrderService orderService = OrderService();
  UserModel user = UserModel(email: 'andre', name: 'Andre', password: 'Teste');
  final Socket socket =
      io(BASE_URL, OptionBuilder().setTransports(['websocket']).build());

  MaterialColor turnStatus(String status) {
    switch (status) {
      case 'New':
        return Colors.purple;
      case 'inProgress':
        return Colors.indigo;
      case 'Finished':
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  String translateStatus(String status) {
    switch (status) {
      case 'New':
        return 'Novo';
      case 'inProgress':
        return 'Preparando';
      case 'Finished':
        return 'Finalizado';
      default:
        return '';
    }
  }

  //------------Serviços de usuário------------
  registerUser(UserModel user) async {
    await userService.registerUser(user);
  }

  authUser(UserModel user) async {
    await userService.authUser(user);
  }

  deleteUser() async {
    await userService.deleteUser(user);
  }

  //------------Serviços de pedidos------------
  getOrders() async {
    orders = await orderService.getOrders(DateTime.now());
    controller.add(orders);
  }

  patch(OrderModel order, String status) async {
    order.status = status;
    await orderService.toggleStatus(order);
  }

  sendOrder() async {
    // List<SupplieModel> supplies = [
    //   SupplieModel(name: 'Deu certo'),
    //   SupplieModel(name: 'Testando')
    // ];
    // List<ProductModel> product = [
    //   ProductModel(name: 'Teste 1', price: 25.7, supplies: supplies),
    //   ProductModel(name: 'Teste 1', price: 25.7, supplies: supplies)
    // ];
    // OrderModel order = OrderModel(
    //     clientName: '12a',
    //     obs: 'Teste',
    //     payment: 'Teste',
    //     status: 'Novo',
    //     totalPrice: 15,
    //     products: product);
    // await orderService.sendOrder(order);
  }
}
