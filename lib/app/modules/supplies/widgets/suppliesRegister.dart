// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant/app/modules/supplies/supplies_store.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/textField.dart';

// ignore: use_key_in_widget_constructors
class SuppliesRegister extends StatefulWidget {
  @override
  _SuppliesRegisterState createState() => _SuppliesRegisterState();
}

class _SuppliesRegisterState
    extends ModularState<SuppliesRegister, SuppliesStore> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RestaurantTextField(
                  labelText: 'Nome do insumo',
                  onChange: (String value) => store.supplieName = value,
                ),
                RestaurantButton(
                    value: 'Gravar',
                    onPressed: () =>
                        store.postSupplie(store.supplieName, context))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
