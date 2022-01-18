import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:restaurant/app/modules/payment/payment_store.dart';
import 'package:restaurant/helpers/payment/model/paymentModel.dart';

// ignore: use_key_in_widget_constructors
class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends ModularState<Payments, PaymentStore> {
  @override
  void initState() {
    store.getPayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store.homeStore.socket.on('Payment Alterado', (data) {
      store.payments!.clear();
      for (var item in data) {
        PaymentModel payment = PaymentModel.fromJson(item);
        store.payments!.add(payment);
      }
      store.payments!.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      store.controller.add(store.payments!);
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
              default:
                return ListView.builder(
                    itemCount: store.payments!.length,
                    itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${index + 1} - ' +
                                    store.payments![index].name!),
                                IconButton(
                                    onPressed: () => store
                                        .deletePayment(store.payments![index]),
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
