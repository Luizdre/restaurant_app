import 'package:restaurant/app/modules/payment/payment_Page.dart';
import 'package:restaurant/app/modules/payment/payment_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PaymentStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentPage()),
  ];
}
