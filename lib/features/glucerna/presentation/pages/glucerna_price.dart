import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math' as math;

class GlucernaValueForMoney extends StatefulWidget {
  final bool showNavigationButtons;
  const GlucernaValueForMoney({super.key, this.showNavigationButtons = true});

  @override
  State createState() {
    return _GlucernaValueForMoneyState();
  }
}

class _GlucernaValueForMoneyState extends State<GlucernaValueForMoney> {
  final List<Map<String, dynamic>> _glucernaTableData = [
    {
      'sku': '400 grams',
      'grams': '400',
      'gramsPerServing': '52.1',
      'price': '1210.00',
      'discount': '100',
      'servings': '7.7',
      'pricePerServing': '144.58',
    },
    {
      'sku': '900 grams',
      'grams': '900',
      'gramsPerServing': '52.1',
      'price': '2577.00',
      'discount': '200',
      'servings': '17.3',
      'pricePerServing': '137.60',
    },
  ];

  final List<String> _glucernaSKUs = <String>[
    '400 grams',
    '900 grams',
  ];

  String _glucernaSKUValue = "400 grams";
  String _glucernaServings = "7.7";
  String _glucernaPricePerServing = "144.58";

  final TextEditingController _glucernaPriceController =
      TextEditingController(text: "1210.00");
  final TextEditingController _glucernaDiscountController =
      TextEditingController(text: "100");

  final List<Map<String, dynamic>> _brandXTableData = [
    {
      'sku': 'Brand A 600 grams',
      'price': '1084.5',
      'discount': '0',
      'servings': '10.0',
      'pricePerServing': '108.45',
    },
    {
      'sku': 'Brand A 800 grams',
      'price': '1764.5',
      'discount': '0',
      'servings': '13.3',
      'pricePerServing': '132.34',
    },
    {
      'sku': 'Brand B 400 grams',
      'price': '0',
      'discount': '0',
      'servings': '7.7',
      'pricePerServing': '0',
    },
    {
      'sku': 'Brand B 800 grams',
      'price': '0',
      'discount': '0',
      'servings': '15.4',
      'pricePerServing': '0',
    },
    {
      'sku': 'Brand C 800 grams',
      'price': '2369.5',
      'discount': '0',
      'servings': '14.5',
      'pricePerServing': '162.90',
    },
  ];

  final List<String> _brandXSkus = <String>[
    'Brand A 600 grams',
    'Brand A 800 grams',
    'Brand B 400 grams',
    'Brand B 800 grams',
    'Brand C 800 grams',
  ];

  String _brandXSKUValue = "Brand A 600 grams";
  String _brandXServings = "10.0";
  String _brandXPricePerServing = "108.45";

  final TextEditingController _brandXPriceController =
      TextEditingController(text: "1084.5");
  final TextEditingController _brandXDiscountController =
      TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    _glucernaSKUValue = _glucernaSKUs.first;
    _brandXSKUValue = _brandXSkus.first;

    _glucernaPricePerServing = _glucernaTableData.first['pricePerServing'];
    _glucernaServings = _glucernaTableData.first['servings'];

    _brandXPricePerServing = _brandXTableData.first['pricePerServing'];
    _brandXServings = _brandXTableData.first['servings'];

    _calculateGlucerna();
    _calculateBrandX();
  }

  void _calculateGlucerna() {
    double price = double.tryParse(_glucernaPriceController.text) ?? 0;
    double discount = double.tryParse(_glucernaDiscountController.text) ?? 0;
    double servings = double.tryParse(_glucernaServings) ?? 1;
    if (servings == 0) servings = 1;
    setState(() {
      _glucernaPricePerServing = ((price - discount) / servings).toStringAsFixed(2);
    });
  }

  void _calculateBrandX() {
    double price = double.tryParse(_brandXPriceController.text) ?? 0;
    double discount = double.tryParse(_brandXDiscountController.text) ?? 0;
    double servings = double.tryParse(_brandXServings) ?? 1;
    if (servings == 0) servings = 1;
    setState(() {
      _brandXPricePerServing = ((price - discount) / servings).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bokeh.png', // Using feature-specific asset
            fit: BoxFit.cover,
          ),
          // Blur overlay consistent with other pages
          Container(
            color: const Color(0xff122e53).withOpacity(0.4),
          ),
          ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'PRICE COMPARISON',
                      style: savingsTextStyle(40, Color(0xfffcbb53)),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 180),
                        const SizedBox(width: 25),
                        SizedBox(
                          width: 330,
                          child: Text(
                            'GLUCERNA',
                            style: savingsTextStyle(25, Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                          width: 330,
                          child: Text(
                            'Other Brands',
                            style: savingsTextStyle(25, Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // SKU
                    _buildDataRow(
                      label: 'SKU',
                      glucernaChild: _buildDropdown(
                        value: _glucernaSKUValue,
                        items: _glucernaSKUs,
                        onChanged: (value) {
                          setState(() {
                            _glucernaSKUValue = value!;
                            int index = _glucernaSKUs.indexOf(value);
                            _glucernaPriceController.text = _glucernaTableData[index]['price'];
                            _glucernaDiscountController.text = _glucernaTableData[index]['discount'];
                            _glucernaServings = _glucernaTableData[index]['servings'];
                            _calculateGlucerna();
                          });
                        },
                      ),
                      brandXChild: _buildDropdown(
                        value: _brandXSKUValue,
                        items: _brandXSkus,
                        onChanged: (value) {
                          setState(() {
                            _brandXSKUValue = value!;
                            int index = _brandXSkus.indexOf(value);
                            _brandXPriceController.text = _brandXTableData[index]['price'];
                            _brandXDiscountController.text = _brandXTableData[index]['discount'];
                            _brandXServings = _brandXTableData[index]['servings'];
                            _calculateBrandX();
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    // PRICE
                    _buildDataRow(
                      label: 'PRICE',
                      glucernaChild: _buildTextField(
                        controller: _glucernaPriceController,
                        onChanged: (_) => _calculateGlucerna(),
                      ),
                      brandXChild: _buildTextField(
                        controller: _brandXPriceController,
                        onChanged: (_) => _calculateBrandX(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // DISCOUNT
                    _buildDataRow(
                      label: 'DISCOUNT',
                      glucernaChild: _buildTextField(
                        controller: _glucernaDiscountController,
                        onChanged: (_) => _calculateGlucerna(),
                      ),
                      brandXChild: _buildTextField(
                        controller: _brandXDiscountController,
                        onChanged: (_) => _calculateBrandX(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // SERVINGS PER CAN
                    _buildDataRow(
                      label: 'SERVINGS\nPER CAN',
                      labelFontSize: 18,
                      glucernaChild: _buildDisplayBox(
                        text: _glucernaServings,
                        isGlucerna: true,
                      ),
                      brandXChild: _buildDisplayBox(
                        text: _brandXServings,
                        isGlucerna: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // PRICE PER SERVING
                    _buildDataRow(
                      label: 'PRICE\nPER SERVING',
                      labelFontSize: 18,
                      glucernaChild: _buildDisplayBox(
                        text: '₱ $_glucernaPricePerServing',
                        isGlucerna: true,
                      ),
                      brandXChild: _buildDisplayBox(
                        text: '₱ $_brandXPricePerServing',
                        isGlucerna: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // PRICE DIFFERENCE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            'PRICE\nDIFFERENCE',
                            style: savingsTextStyle(18, Colors.white),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(width: 25),
                        Container(
                          width: 690,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(color: const Color(0xffc69c6d), width: 3),
                            color: const Color(0xff122e53),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(70),
                                blurRadius: 5.0,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            '₱ ${(double.parse(_glucernaPricePerServing) - double.parse(_brandXPricePerServing)).toStringAsFixed(2)}',
                            textAlign: TextAlign.center,
                            style: savingsTextStyle(30, Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
          // Back Button
          if (widget.showNavigationButtons)
            Positioned(
              top: 16,
              left: 16,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          // Home Button
          if (widget.showNavigationButtons)
            Positioned(
              bottom: 16,
              right: 16,
              child: SafeArea(
                child: FloatingActionButton(
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  backgroundColor: const Color(0xFF9f864b),
                  child: const Icon(Icons.home, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDataRow({
    required String label,
    required Widget glucernaChild,
    required Widget brandXChild,
    double labelFontSize = 25,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 180,
          child: Text(
            label,
            style: savingsTextStyle(labelFontSize, Colors.white),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 25),
        glucernaChild,
        const SizedBox(width: 25),
        brandXChild,
      ],
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xffc69c6d), width: 3),
        color: const Color(0xfffcf5eb),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 5.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButton<String>(
        underline: Container(),
        value: value,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down, color: Color(0xff0c3c89)),
        style: savingsTextStyle(25, const Color(0xff0c3c89)),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: savingsTextStyle(20, const Color(0xff0c3c89)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xffc69c6d), width: 3),
        color: const Color(0xfffcf5eb),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 5.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: savingsTextStyle(25, const Color(0xff0c3c89)),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  Widget _buildDisplayBox({
    required String text,
    required bool isGlucerna,
  }) {
    return Container(
      width: 330,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xffc69c6d), width: 3),
        color: isGlucerna ? const Color(0xff122e53) : null,
        gradient: !isGlucerna
            ? const LinearGradient(
                colors: [Color(0xffffe7ba), Color(0xffd7a666), Color(0xffffe7ba)],
                stops: [0.3, 0.72, 0.97],
                transform: GradientRotation(-100),
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 5.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        text,
        style: savingsTextStyle(25, isGlucerna ? Colors.white : const Color(0xff0c3c89)),
        textAlign: TextAlign.center,
      ),
    );
  }

  TextStyle savingsTextStyle(double fontSize, Color textColor) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'BrandonGrotesque', // Normalized font family
      fontWeight: FontWeight.bold,
      color: textColor,
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange = 2})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
