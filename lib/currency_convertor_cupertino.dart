import 'package:flutter/cupertino.dart';

class CurrencyConvertorCupertinoPage extends StatefulWidget {
  const CurrencyConvertorCupertinoPage({super.key});

  @override
  State<CurrencyConvertorCupertinoPage> createState() =>
      _CurrencyConvertorCupertinoPageState();
}

class _CurrencyConvertorCupertinoPageState
    extends State<CurrencyConvertorCupertinoPage> {
  dynamic result = 0;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey,
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Currency Converter App"),
        backgroundColor: CupertinoColors.systemGrey,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            debugPrint('Move to home successfully');
          },
          child: const Icon(CupertinoIcons.home),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            debugPrint("button pressed");
          },
          child: const Icon(CupertinoIcons.chart_bar),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 20),

              /// First Input (USD)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CupertinoColors.black),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CupertinoTextField(
                    controller: textEditingController,
                    placeholder: 'Enter the amount in USD',
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: CupertinoColors.black),
                    prefix: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(CupertinoIcons.money_dollar),
                    ),
                  ),
                ),
              ),

              /// Second Input (Optional)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CupertinoColors.black),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CupertinoTextField(
                    controller: textEditingController1,
                    placeholder: 'Extra field (optional)',
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: CupertinoColors.black),
                    prefix: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(CupertinoIcons.money_dollar_circle),
                    ),
                  ),
                ),
              ),

              /// Convert Button
              Padding(
                padding: const EdgeInsets.all(20),
                child: CupertinoButton(
                  color: CupertinoColors.activeBlue,
                  onPressed: () {
                    final input = double.tryParse(textEditingController.text);
                    if (input != null) {
                      setState(() {
                        result = input * 83; // Example conversion
                      });
                    } else {
                      setState(() {
                        result = 0;
                      });
                    }
                  },
                  child: const Text(
                    "Convert",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
