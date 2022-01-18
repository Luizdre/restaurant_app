// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/app/modules/home/home_store.dart';
import 'package:restaurant/app/modules/home/widgets/detailedOrder.dart';
import 'package:restaurant/app/modules/payment/payment_page.dart';
import 'package:restaurant/app/modules/product/product_page.dart';
import 'package:restaurant/app/modules/supplies/supplies_page.dart';
import 'package:restaurant/components/modalSheet.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:restaurant/helpers/order/model/orderModel.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomePage extends StatefulWidget {
  final String title;
  // ignore: use_key_in_widget_constructors
  const HomePage({this.title = "Home"});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    store.socket.on('Pedido alterado', (data) {
      store.orders.clear();
      for (var item in data) {
        OrderModel order = OrderModel.fromJson(item);
        store.orders.add(order);
      }
      store.orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      store.orders =
          store.orders.where((element) => element.payd == false).toList();
      store.controller.add(store.orders);
    });

    store.socket.on('Visitar Mesa', (data) {
      showTopSnackBar(
        context,
        CustomSnackBar.info(
          message: '$data encerrou o pedido',
          backgroundColor: Colors.indigo,
          borderRadius: BorderRadius.circular(50),
        ),
        displayDuration: Duration(seconds: 2),
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pedidos'),
      ),
      body: StreamBuilder(
          stream: store.controller.stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView.builder(
                    itemCount: store.orders.length,
                    itemBuilder: (c, i) => InkWell(
                          onTap: () => RestaurantBottomSheet(context,
                              DetailedOrders(store.orders[i].products!)),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width / 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Mesa: ' +
                                            store.orders[i].clientName!),
                                        Text('Observação: ' +
                                            store.orders[i].obs!),
                                        Text('Status: ' +
                                            store.translateStatus(
                                                store.orders[i].status!))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width / 3,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            child: CircleAvatar(
                                              backgroundColor: store.turnStatus(
                                                  store.orders[i].status!),
                                            ),
                                          ),
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                Visibility(
                                                  visible: (store.orders[i]
                                                              .status! ==
                                                          'inProgress' ||
                                                      store.orders[i].status! ==
                                                          'Finished'),
                                                  child: IconButton(
                                                      onPressed: () =>
                                                          store.patch(
                                                              store.orders[i],
                                                              'New'),
                                                      icon: Icon(
                                                        FontAwesomeIcons
                                                            .backward,
                                                        size: 20,
                                                        color: Colors.indigo,
                                                      )),
                                                ),
                                                Visibility(
                                                  visible:
                                                      (store.orders[i].status ==
                                                          'New'),
                                                  child: IconButton(
                                                      onPressed: () =>
                                                          store.patch(
                                                              store.orders[i],
                                                              'inProgress'),
                                                      icon: Icon(
                                                        FontAwesomeIcons
                                                            .forward,
                                                        size: 20,
                                                        color: Colors.indigo,
                                                      )),
                                                ),
                                                IconButton(
                                                    onPressed: () =>
                                                        store.patch(
                                                            store.orders[i],
                                                            'Finished'),
                                                    icon: Icon(
                                                        FontAwesomeIcons.stop,
                                                        size: 20,
                                                        color: Colors.red))
                                              ],
                                            ),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
            }
          }),
      floatingActionButton: CircularMenu(
          // radius: 100,
          toggleButtonSize: 30,
          alignment: Alignment.bottomRight,
          items: [
            CircularMenuItem(
              onTap: () => RestaurantBottomSheet(context, const ProductPage()),
              color: const Color.fromRGBO(255, 157, 10, 1),
              // boxShadow: [BoxShadow(blurRadius: 1)],
              icon: Icons.restaurant_menu,
              iconColor: Colors.white,
            ),
            // CircularMenuItem(
            //   onTap: () => RestaurantBottomSheet(context, const PaymentPage()),
            //   color: const Color.fromRGBO(50, 168, 82, 1),
            //   // boxShadow: [BoxShadow(blurRadius: 1)],
            //   icon: Icons.credit_card_outlined,
            //   iconColor: Colors.white,
            // ),
            CircularMenuItem(
              onTap: () => RestaurantBottomSheet(context, const SuppliesPage()),
              color: const Color.fromRGBO(18, 10, 255, 1),
              // boxShadow: [BoxShadow(blurRadius: 1)],
              icon: Icons.lunch_dining,
              iconColor: Colors.white,
            )
          ]),
    );
  }
}
