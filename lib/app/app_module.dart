import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant/app/modules/home/home_store.dart';
import 'package:restaurant/app/modules/payment/payment_store.dart';
import 'package:restaurant/app/modules/product/product_store.dart';
import 'package:restaurant/app/modules/supplies/supplies_store.dart';
import 'package:restaurant/helpers/payment/service/paymentService.dart';
import 'package:restaurant/helpers/product/service/productService.dart';
import 'package:restaurant/helpers/supplies/services/supplieService.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProductStore(i.get(), i.get(), i.get())),
    Bind((i) => SuppliesStore(i.get(), i.get())),
    Bind((i) => SupplieService()),
    Bind((i) => HomeStore()),
    Bind((i) => ProductService()),
    Bind((i) => PaymentService()),
    Bind((i) => PaymentStore(i.get(), i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
