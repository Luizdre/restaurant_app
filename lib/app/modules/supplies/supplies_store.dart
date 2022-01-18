import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurant/app/modules/home/home_store.dart';
import 'package:restaurant/helpers/supplies/model/supplieModel.dart';
import 'package:restaurant/helpers/supplies/services/supplieService.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

part 'supplies_store.g.dart';

class SuppliesStore = _SuppliesStoreBase with _$SuppliesStore;

abstract class _SuppliesStoreBase with Store {
  // ignore: non_constant_identifier_names
  SupplieService service;
  HomeStore homeStore;

  _SuppliesStoreBase(this.service, this.homeStore);

  @observable
  bool isSelected = false;

  @observable
  String menuSelected = 'Insumos';

  @observable
  String supplieName = '';

  @observable
  List<SupplieModel> supplieList = [];

  StreamController controller = StreamController();

  @action
  toggleMenu(String menu) {
    menuSelected = menu;
  }

  getSupplie() async {
    await service.getSupplie().then((value) => supplieList = value);
    controller.add(supplieList);
  }

  postSupplie(String name, BuildContext context) async {
    // ignore: deprecated_member_use
    (name == '' || name.isEmpty)
        // ignore: deprecated_member_use
        ? showTopSnackBar(
            context, const CustomSnackBar.error(message: 'Falha ao registrar'),
            displayDuration: const Duration(seconds: 1))
        : {await service.postSupplie(name), menuSelected = 'Insumos'};
  }

  putSupplie(SupplieModel supplie) async {
    await service.putSupplie(supplie);
  }

  deleteSupplie(SupplieModel supplie) async {
    await service.deleteSupplie(supplie);
  }
}
