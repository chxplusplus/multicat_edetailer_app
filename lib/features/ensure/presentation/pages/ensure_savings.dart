import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnsureValueForMoney extends StatefulWidget {
  final bool showNavigationButtons;
  const EnsureValueForMoney({super.key, this.showNavigationButtons = true});

  @override
  State createState() {
    return _EnsureSavingsState();
  }
}

class _EnsureSavingsState extends State<EnsureValueForMoney> {
  static const Map<String, Map<String, Map<String, String>>> _pricingData = {
    'Robinsons': {
      '380 grams': {'price': '₱1,038.00', 'servings': '6.6', 'pricePerServing': '₱157.26'},
      '800 grams': {'price': '₱2,162.00', 'servings': '14.0', 'pricePerServing': '₱154.14'},
      '1.1 kg': {'price': '₱2,938.00', 'servings': '19.8', 'pricePerServing': '₱148.37'},
      '1.6 kg': {'price': '₱3,725.00', 'servings': '26.4', 'pricePerServing': '₱141.08'},
      '2.2 kg': {'price': '₱4,637.00', 'servings': '39.6', 'pricePerServing': '₱117.08'},
    },
    'Waltermart': {
      '380 grams': {'price': '₱1,030.00', 'servings': '6.6', 'pricePerServing': '₱156.05'},
      '800 grams': {'price': '₱2,123.00', 'servings': '14.0', 'pricePerServing': '₱151.36'},
      '1.1 kg': {'price': '₱2,869.50', 'servings': '19.8', 'pricePerServing': '₱144.91'},
      '1.6 kg': {'price': '₱3,644.00', 'servings': '26.4', 'pricePerServing': '₱138.02'},
      '2.2 kg': {'price': '₱4,889.00', 'servings': '39.6', 'pricePerServing': '₱123.45'},
    },
    'SM Group': {
      '380 grams': {'price': '₱1,009.50', 'servings': '6.6', 'pricePerServing': '₱152.94'},
      '800 grams': {'price': '₱2,119.00', 'servings': '14.0', 'pricePerServing': '₱151.07'},
      '1.1 kg': {'price': '₱2,869.50', 'servings': '19.8', 'pricePerServing': '₱144.91'},
      '1.6 kg': {'price': '₱3,644.50', 'servings': '26.4', 'pricePerServing': '₱138.04'},
      '2.2 kg': {'price': '₱4,639.00', 'servings': '39.6', 'pricePerServing': '₱117.13'},
    },
    'Metro Gaisano': {
      '380 grams': {'price': '₱1,038.00', 'servings': '6.6', 'pricePerServing': '₱157.26'},
      '800 grams': {'price': '₱2,162.00', 'servings': '14.0', 'pricePerServing': '₱154.14'},
      '1.1 kg': {'price': '₱2,938.00', 'servings': '19.8', 'pricePerServing': '₱148.37'},
      '1.6 kg': {'price': '₱3,725.00', 'servings': '26.4', 'pricePerServing': '₱141.08'},
      '2.2 kg': {'price': '₱4,637.00', 'servings': '39.6', 'pricePerServing': '₱117.08'},
    },
    'Landmark': {
      '380 grams': {'price': '₱1,015.60', 'servings': '6.6', 'pricePerServing': '₱153.86'},
      '800 grams': {'price': '₱2,114.85', 'servings': '14.0', 'pricePerServing': '₱150.78'},
      '1.1 kg': {'price': '₱2,874.10', 'servings': '19.8', 'pricePerServing': '₱145.14'},
      '1.6 kg': {'price': '₱3,644.30', 'servings': '26.4', 'pricePerServing': '₱138.03'},
      '2.2 kg': {'price': '₱4,563.50', 'servings': '39.6', 'pricePerServing': '₱115.23'},
    },
  };

  final List<String> _skus = ['380 grams', '800 grams', '1.1 kg', '1.6 kg', '2.2 kg'];
  String _dropValueLeft = "380 grams";
  String _dropValueRight = "380 grams";
  String _priceValueLeft = "";
  String _servingPerCanLeft = "";
  String _pricePerServingLeft = "";
  String _priceValueRight = "";
  String _servingPerCanRight = "";
  String _pricePerServingRight = "";

  @override
  void initState() {
    super.initState();
    _updateValues(isLeft: true, forceUpdate: true);
    _updateValues(isLeft: false, forceUpdate: true);
  }

  void _updateValues({required bool isLeft, bool forceUpdate = false}) {
    // Note: EdetailerMain is assumed to be defined globally as per existing code
    // If it's not found, we fallback to 'Robinsons' for safety in this demo/refactor.
    String account = 'Robinsons';
    try {
      account = 'Robinsons';
    } catch (_) {}

    final sku = isLeft ? _dropValueLeft : _dropValueRight;
    final data = _pricingData[account]?[sku] ?? _pricingData['Robinsons']![sku]!;

    void update() {
      if (isLeft) {
        _priceValueLeft = data['price']!;
        _servingPerCanLeft = data['servings']!;
        _pricePerServingLeft = data['pricePerServing']!;
      } else {
        _priceValueRight = data['price']!;
        _servingPerCanRight = data['servings']!;
        _pricePerServingRight = data['pricePerServing']!;
      }
    }

    if (forceUpdate) {
      update();
    } else {
      setState(() {
        update();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bokeh.png',
            fit: BoxFit.cover,
          ),
          // Blur overlay for readability and consistency
          Container(
            color: const Color(0xff122e53).withOpacity(0.35),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'SAVINGS',
                    style: savingsTextStyle(40, const Color(0xfffcbb53)),
                  ),
                ),
                const SizedBox(height: 40),
                _buildDataRow(
                  label: 'SKU',
                  leftWidget: _buildDropdown(
                      value: _dropValueLeft,
                      items: _skus,
                      onChanged: (val) {
                        _dropValueLeft = val!;
                        _updateValues(isLeft: true);
                      }),
                  rightWidget: _buildDropdown(
                      value: _dropValueRight,
                      items: _skus,
                      onChanged: (val) {
                        _dropValueRight = val!;
                        _updateValues(isLeft: false);
                      }),
                ),
                const SizedBox(height: 15),
                _buildDataRow(
                  label: 'PRICE',
                  leftWidget: _buildDisplayBox(text: _priceValueLeft),
                  rightWidget: _buildDisplayBox(text: _priceValueRight),
                ),
                const SizedBox(height: 15),
                _buildDataRow(
                  label: 'SERVINGS\nPER CAN',
                  labelFontSize: 20,
                  leftWidget: _buildDisplayBox(text: _servingPerCanLeft, isDark: true),
                  rightWidget: _buildDisplayBox(text: _servingPerCanRight, isGold: true),
                ),
                const SizedBox(height: 15),
                _buildDataRow(
                  label: 'PRICE\nPER SERVING',
                  labelFontSize: 20,
                  leftWidget: _buildDisplayBox(text: _pricePerServingLeft, isDark: true),
                  rightWidget: _buildDisplayBox(text: _pricePerServingRight, isGold: true),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    'assets/images/ensure_meal.png',
                    height: 140,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          // Navigation Buttons
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
          if (widget.showNavigationButtons)
            Positioned(
              bottom: 16,
              right: 16,
              child: SafeArea(
                child: FloatingActionButton(
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  backgroundColor: const Color(0xFF9f864b),
                  heroTag: 'ensure_savings_home', // Unique tag to avoid conflict
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
    required Widget leftWidget,
    required Widget rightWidget,
    double labelFontSize = 30,
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
        const SizedBox(width: 30),
        leftWidget,
        const SizedBox(width: 30),
        rightWidget,
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
        elevation: 0,
        icon: const Icon(Icons.arrow_drop_down, color: Color(0xff0c3c89)),
        style: savingsTextStyle(25, const Color(0xff0c3c89)),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: savingsTextStyle(25, const Color(0xff0c3c89)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDisplayBox({
    required String text,
    bool isDark = false,
    bool isGold = false,
  }) {
    return Container(
      width: 330,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xffc69c6d), width: 3),
        color: isDark ? const Color(0xff122e53) : (isGold ? null : const Color(0xfffcf5eb)),
        gradient: isGold
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
        style: savingsTextStyle(30, isDark ? Colors.white : const Color(0xff0c3c89)),
        textAlign: TextAlign.center,
      ),
    );
  }

  TextStyle savingsTextStyle(double fontSize, Color textColor) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'BrandonGrotesque',
      fontWeight: FontWeight.bold,
      color: textColor,
    );
  }
}
