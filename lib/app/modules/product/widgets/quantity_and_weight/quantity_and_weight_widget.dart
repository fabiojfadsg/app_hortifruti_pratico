import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_weight.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/weight_weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantyAndWeightWidget extends StatelessWidget {
  bool isKg;

  QuantyAndWeightWidget({this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) => Column(
        children: [
          QuantityWidget(),
          if (isKg) WeightWidget(),
        ],
      ),
    );
  }
}




