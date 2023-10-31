import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class HomeController {
  List<CurrencyModel> currencies = CurrencyModel.getCurrencies();

  final TextEditingController fromText;
  final TextEditingController toText;

  CurrencyModel fromCurrency = CurrencyModel.getCurrencies().first;
  CurrencyModel toCurrency = CurrencyModel.getCurrencies().first;

  HomeController(this.fromText, this.toText) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1;
    double returnValue = 0;

    if (toCurrency.name == 'Real') {
      returnValue = value * fromCurrency.real;
    } else if (toCurrency.name == 'Dolar') {
      returnValue = value * fromCurrency.dolar;
    } else if (toCurrency.name == 'Euro') {
      returnValue = value * fromCurrency.euro;
    } else if (toCurrency.name == 'Bitcoin') {
      returnValue = value * fromCurrency.bitcoin;
    }

    toText.text = returnValue.toStringAsFixed(2);
  }
}
