import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightController extends GetxController {
  bool isKg;
  QuantityAndWeightController({required this.isKg});

  num quantity = 1;
  double get weight => quantity.toDouble();
  late double min;
  late double max;

  String get label {
    String unit = 'kg';
    String pattern = '0.000';
    var number = weight;

    if (number < 1) {
      number *= 1000;
      unit = 'g';
      pattern = '';
    } else if (number % number.toInt() == 0) {
      pattern = '';
    }
    return NumberFormat(pattern).format(number) + unit;
  }

  @override
  void onInit() {
    _updateMinMax();
    super.onInit();
  }

  void changeQuantity(num value) {
    quantity = value;
    _updateMinMax();
    update();
  }

  void changeWeight(double value) {
    quantity = value;
    update();
  }

  _updateMinMax() {
    min = weight - 1 + 0.05;
    max = weight;
    if (min < 0) {
      min = 0.5;
      max = 1;
    }
  }
}
