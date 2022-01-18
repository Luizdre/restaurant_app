// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant/app/modules/home/home_store.dart';

// ignore: must_be_immutable
class DetailedOrders extends StatefulWidget {
  // ignore: prefer_final_fields
  List product;

  // ignore: use_key_in_widget_constructors
  DetailedOrders(this.product);

  @override
  _DetailedOrdersState createState() => _DetailedOrdersState();
}

class _DetailedOrdersState extends ModularState<DetailedOrders, HomeStore> {
  @override
  Widget build(BuildContext context) {
    print(widget.product);
    return ListView(
      children: widget.product.map((e) {
        print(e);
        List lista = e['supplies'];
        List<Widget> list = List.generate(
            lista.length,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (Row(
                    children: [
                      Text(lista[index]['qtt'].toString() + 'x - '),
                      Text(lista[index]['name'])
                    ],
                  )),
                ));
        return Card(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Detalhe do produto'),
              ),
              Text(e['name']),
              Column(
                children: list,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
