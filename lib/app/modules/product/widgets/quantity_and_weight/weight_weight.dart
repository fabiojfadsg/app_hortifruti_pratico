import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeightWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${NumberFormat.decimalPattern().format(controller.min)} Kg') ,
        Expanded(
          child: Slider(
            min: controller.min,
            max: controller.max,
            label: controller.label,
            divisions: 19,
            value: controller.weight,
            onChanged: controller.changeWeight,
          ),
        ),
        Text('${NumberFormat.decimalPattern().format(controller.max)} Kg') ,
      ],
    );
  }
}