// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SuppliesStore on _SuppliesStoreBase, Store {
  final _$isSelectedAtom = Atom(name: '_SuppliesStoreBase.isSelected');

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  final _$menuSelectedAtom = Atom(name: '_SuppliesStoreBase.menuSelected');

  @override
  String get menuSelected {
    _$menuSelectedAtom.reportRead();
    return super.menuSelected;
  }

  @override
  set menuSelected(String value) {
    _$menuSelectedAtom.reportWrite(value, super.menuSelected, () {
      super.menuSelected = value;
    });
  }

  final _$supplieNameAtom = Atom(name: '_SuppliesStoreBase.supplieName');

  @override
  String get supplieName {
    _$supplieNameAtom.reportRead();
    return super.supplieName;
  }

  @override
  set supplieName(String value) {
    _$supplieNameAtom.reportWrite(value, super.supplieName, () {
      super.supplieName = value;
    });
  }

  final _$supplieListAtom = Atom(name: '_SuppliesStoreBase.supplieList');

  @override
  List<SupplieModel> get supplieList {
    _$supplieListAtom.reportRead();
    return super.supplieList;
  }

  @override
  set supplieList(List<SupplieModel> value) {
    _$supplieListAtom.reportWrite(value, super.supplieList, () {
      super.supplieList = value;
    });
  }

  final _$_SuppliesStoreBaseActionController =
      ActionController(name: '_SuppliesStoreBase');

  @override
  dynamic toggleMenu(String menu) {
    final _$actionInfo = _$_SuppliesStoreBaseActionController.startAction(
        name: '_SuppliesStoreBase.toggleMenu');
    try {
      return super.toggleMenu(menu);
    } finally {
      _$_SuppliesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected},
menuSelected: ${menuSelected},
supplieName: ${supplieName},
supplieList: ${supplieList}
    ''';
  }
}
