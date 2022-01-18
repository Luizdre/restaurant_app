import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant/app/modules/product/product_store.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/app/modules/product/widgets/productRegister.dart';
import 'package:restaurant/app/modules/product/widgets/products.dart';
import 'package:restaurant/components/text.dart';

class ProductPage extends StatefulWidget {
  final String title;
  const ProductPage({Key? key, this.title = 'ProductPage'}) : super(key: key);
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends ModularState<ProductPage, ProductStore> {
  // final ProductStore store = Modular.get();

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
                      onTap: () => store.toggleMenu('Produtos'),
                      child: Container(
                          width: size.width / 4,
                          height: size.height / 18,
                          decoration: BoxDecoration(
                              color: store.menuSelected == 'Produtos'
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: RestaurantText(
                            value: 'Produtos',
                            fontColor: store.menuSelected == 'Produtos'
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
            builder: (context) => store.menuSelected == 'Produtos'
                ? Product()
                : ProductRegister())
      ],
    );
  }
}
