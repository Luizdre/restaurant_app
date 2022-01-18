// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant/app/modules/payment/payment_store.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/textField.dart';

// ignore: use_key_in_widget_constructors
class PaymentRegister extends StatefulWidget {
  @override
  _PaymentRegisterState createState() => _PaymentRegisterState();
}

class _PaymentRegisterState
    extends ModularState<PaymentRegister, PaymentStore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RestaurantTextField(
            labelText: 'Nome do insumo',
            onChange: (String value) => store.paymentName = value,
          ),
          RestaurantButton(
              value: 'Gravar',
              onPressed: () => store.postPayment(store.paymentName, context))
        ],
      ),
    );
  }
}
