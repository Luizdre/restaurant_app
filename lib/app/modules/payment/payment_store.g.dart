// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentStore on _PaymentStoreBase, Store {
  final _$menuSelectedAtom = Atom(name: '_PaymentStoreBase.menuSelected');

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

  final _$paymentNameAtom = Atom(name: '_PaymentStoreBase.paymentName');

  @override
  String get paymentName {
    _$paymentNameAtom.reportRead();
    return super.paymentName;
  }

  @override
  set paymentName(String value) {
    _$paymentNameAtom.reportWrite(value, super.paymentName, () {
      super.paymentName = value;
    });
  }

  final _$paymentsAtom = Atom(name: '_PaymentStoreBase.payments');

  @override
  List<PaymentModel>? get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(List<PaymentModel>? value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  final _$_PaymentStoreBaseActionController =
      ActionController(name: '_PaymentStoreBase');

  @override
  dynamic toggleMenu(String menu) {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.toggleMenu');
    try {
      return super.toggleMenu(menu);
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menuSelected: ${menuSelected},
paymentName: ${paymentName},
payments: ${payments}
    ''';
  }
}
