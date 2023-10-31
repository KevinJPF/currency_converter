import 'package:currency_converter/app/components/currency_box.dart';
import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController();

  final TextEditingController toText = TextEditingController();
  HomeController homeController =
      HomeController(TextEditingController(), TextEditingController());

  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText, toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 30, bottom: 20, top: 100),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 50),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(
                      () {
                        homeController.fromCurrency = model!;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(
                      () {
                        homeController.toCurrency = model!;
                      },
                    );
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    homeController.convert();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(19, 19, 19, 1)),
                  ),
                  child: const Text('Converter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
