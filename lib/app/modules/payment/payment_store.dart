import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurant/app/modules/home/home_store.dart';
import 'package:restaurant/helpers/payment/model/paymentModel.dart';
import 'package:restaurant/helpers/payment/service/paymentService.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

part 'payment_store.g.dart';

class PaymentStore = _PaymentStoreBase with _$PaymentStore;

abstract class _PaymentStoreBase with Store {
  PaymentService paymentService;
  HomeStore homeStore;

  _PaymentStoreBase(this.paymentService, this.homeStore);

  @observable
  String menuSelected = 'Métodos';

  @observable
  String paymentName = '';

  @observable
  List<PaymentModel>? payments;

  StreamController controller = StreamController();

  @action
  toggleMenu(String menu) {
    menuSelected = menu;
  }

  getPayments() async {
    payments = await paymentService.getPayments();
    controller.add(payments);
  }

  postPayment(String paymentName, BuildContext context) async {
    if (paymentName == '') {
      showTopSnackBar(
          context, const CustomSnackBar.error(message: 'Falha ao registrar'),
          displayDuration: const Duration(seconds: 1));
      return;
    }
    PaymentModel payment = PaymentModel(name: paymentName);
    await paymentService.postPayment(payment);
  }

  putPayment(PaymentModel payment) async {
    // PaymentModel payment =
    //     PaymentModel(id: '61946b304ac434a6ee56ff1b', name: 'Coisado');
    await paymentService.putPayment(payment);
  }

  deletePayment(PaymentModel payment) async {
    await paymentService.deletePayment(payment);
  }
}
