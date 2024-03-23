import 'package:currency_converter/exchange_rate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage
    extends State<CurrencyConverterMaterialPage> {
  //! variables
  final TextEditingController amountController = TextEditingController();
  late double result;
  //! functions
  void getTotalAmount() {
    double? isValidAmount = double.tryParse(amountController.text);
    if (isValidAmount == null) {
      context.read<ExchangeRateProvider>().value = '0';
      amountController.clear();
      return;
    }
    context.read<ExchangeRateProvider>().value = amountController.text;
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    // returning Scaffold
    result = context.watch<ExchangeRateProvider>().totalAmount();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BDT: $result  Taka',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // padding
              // container
              TextField(
                controller: amountController,
                onSubmitted: (value) => getTotalAmount(),
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD ',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              // button
              const SizedBox(height: 10),
              TextButton(
                onPressed: getTotalAmount,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
