import 'package:restaurant/app/modules/supplies/supplies_Page.dart';
import 'package:restaurant/app/modules/supplies/supplies_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SuppliesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SuppliesStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SuppliesPage()),
  ];
}
