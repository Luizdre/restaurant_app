// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:number_selection/number_selection.dart';
import 'package:restaurant/app/modules/product/product_store.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/textField.dart';
import 'package:restaurant/helpers/supplies/model/supplieModel.dart';

// ignore: use_key_in_widget_constructors
class ProductRegister extends StatefulWidget {
  @override
  _ProductRegisterState createState() => _ProductRegisterState();
}

class _ProductRegisterState
    extends ModularState<ProductRegister, ProductStore> {
  @override
  void initState() {
    store.getSupplies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            RestaurantTextField(
              labelText: 'Nome do produto',
              onChange: (String value) => store.productName = value,
            ),
            RestaurantTextField(
              labelText: 'Valor do produto',
              textInputType: TextInputType.number,
              onChange: (String value) {
                value.replaceAll(',', '.');
                store.productPrice = double.tryParse(value)!;
              },
            ),
            Observer(builder: (context) {
              List<Widget> supplies = List.generate(
                  store.supplies.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width / 5,
                                child: NumberSelection(
                                  initialValue: 1,
                                  maxValue: 50,
                                  minValue: 1,
                                  onChanged: (value) =>
                                      store.supplies[index].qtt = value,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              DropdownButton(
                                  onChanged: (v) {
                                    setState(() {
                                      store.supplies[index].name = v.toString();
                                    });
                                  },
                                  value: store.supplies[index]
                                      .name, //store.supplieValue,
                                  items: store.registeresSupplies
                                      .map((e) => DropdownMenuItem(
                                            enabled: true,
                                            child: Text(e.name!),
                                            value: e.name!,
                                          ))
                                      .toList()),
                              IconButton(
                                  onPressed: () => setState(() {
                                        store.supplies.removeAt(index);
                                      }),
                                  icon: const Icon(FontAwesomeIcons.trash,
                                      color: Colors.redAccent))
                            ],
                          ),
                        ),
                      ));

              return Column(children: supplies);
            }),
            RestaurantButton(
              onPressed: () => store.postProduct(context),
              value: 'Gravar',
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () => setState(() {
                        store.supplies.add(
                            SupplieModel(name: store.supplieValue, qtt: 1));
                      }),
                  icon: const Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}
