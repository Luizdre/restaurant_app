import 'package:restaurant/app/modules/product/product_Page.dart';
import 'package:restaurant/app/modules/product/product_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductStore(i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProductPage()),
  ];
}
