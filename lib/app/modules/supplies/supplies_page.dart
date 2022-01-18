import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant/app/modules/supplies/supplies_store.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/app/modules/supplies/widgets/supplies.dart';
import 'package:restaurant/app/modules/supplies/widgets/suppliesRegister.dart';
import 'package:restaurant/components/text.dart';

class SuppliesPage extends StatefulWidget {
  final String title;
  const SuppliesPage({Key? key, this.title = 'SuppliesPage'}) : super(key: key);
  @override
  SuppliesPageState createState() => SuppliesPageState();
}

class SuppliesPageState extends ModularState<SuppliesPage, SuppliesStore> {
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
                      onTap: () => store.toggleMenu('Insumos'),
                      child: Container(
                          width: size.width / 4,
                          height: size.height / 18,
                          decoration: BoxDecoration(
                              color: store.menuSelected == 'Insumos'
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: RestaurantText(
                            value: 'Insumos',
                            fontColor: store.menuSelected == 'Insumos'
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
            builder: (context) => store.menuSelected == 'Insumos'
                ? Supplies()
                : SuppliesRegister())
      ],
    );
  }
}
