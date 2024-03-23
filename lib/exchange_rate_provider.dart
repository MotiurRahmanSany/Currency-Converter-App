import 'package:flutter/material.dart';

class ExchangeRateProvider extends ChangeNotifier {
  ExchangeRateProvider();

  final double _exchangeRate = 112;

  double _enteredAmount = 0;

  set value(String d) {
    _enteredAmount = double.parse(d);
    notifyListeners();
  }

  double totalAmount() {
    double enteredAmount = _enteredAmount * _exchangeRate;
    enteredAmount != 0
        ? enteredAmount.toStringAsFixed(2)
        : enteredAmount.toStringAsFixed(0);
    return enteredAmount;
  }
}
