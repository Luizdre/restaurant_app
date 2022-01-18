import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant/app/modules/payment/payment_store.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/app/modules/payment/widgets/paymentRegister.dart';
import 'package:restaurant/app/modules/payment/widgets/payments.dart';
import 'package:restaurant/components/text.dart';

class PaymentPage extends StatefulWidget {
  final String title;
  const PaymentPage({Key? key, this.title = 'PaymentPage'}) : super(key: key);
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final PaymentStore store = Modular.get();

  @override
  void initState() {
    store.getPayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 1.5,
              height: size.height / 18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Observer(
                    builder: (context) => InkWell(
                      onTap: () => store.toggleMenu('Métodos'),
                      child: Container(
                          width: size.width / 4,
                          height: size.height / 18,
                          decoration: BoxDecoration(
                              color: store.menuSelected == 'Métodos'
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: RestaurantText(
                            value: 'Métodos',
                            fontColor: store.menuSelected == 'Métodos'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 15,
                          ))),
                    ),
                  ),
                  Observer(
                      builder: (context) => InkWell(
                            onTap: () => store.toggleMenu('Cadastro'),
                            child: Container(
                                width: size.width / 4,
                                height: size.height / 18,
                                decoration: BoxDecoration(
                                    color: store.menuSelected == 'Cadastro'
                                        ? Colors.blue
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)),
                                child: Center(
                                    child: RestaurantText(
                                  value: 'Cadastro',
                                  fontColor: store.menuSelected == 'Cadastro'
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 15,
                                ))),
                          ))
                ],
              ),
            )
          ],
        ),
        Observer(
            builder: (context) => store.menuSelected == 'Métodos'
                ? Payments()
                : PaymentRegister())
      ],
    );
  }
}
