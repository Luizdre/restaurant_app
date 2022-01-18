import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/app/modules/product/product_store.dart';
import 'package:restaurant/helpers/product/model/productModel.dart';

// ignore: use_key_in_widget_constructors
class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends ModularState<Product, ProductStore> {
  @override
  void initState() {
    store.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store.homeStore.socket.on('Product Alterado', (data) {
      store.productList.clear();
      for (var item in data) {
        ProductModel product = ProductModel.fromJson(item);
        store.productList.add(product);
      }
      store.productList.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      store.controller.add(store.productList);
    });
    return Expanded(
      child: StreamBuilder(
          stream: store.controller.stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                return ListView.builder(
                    itemCount: store.productList.length,
                    itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${index + 1} - ' +
                                    store.productList[index].name!),
                                IconButton(
                                    onPressed: () => store.deleteProduct(
                                        store.productList[index]),
                                    icon: const Icon(
                                      FontAwesomeIcons.trash,
                                      size: 20,
                                      color: Colors.redAccent,
                                    ))
                              ],
                            ),
                          ),
                        ));
              default:
                return ListView.builder(
                    itemCount: store.productList.length,
                    itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${index + 1} - ' +
                                    store.productList[index].name!),
                                IconButton(
                                    onPressed: () => store.deleteProduct(
                                        store.productList[index]),
                                    icon: const Icon(
                                      FontAwesomeIcons.trash,
                                      size: 20,
                                      color: Colors.redAccent,
                                    ))
                              ],
                            ),
                          ),
                        ));
            }
          }),
    );
  }
}
