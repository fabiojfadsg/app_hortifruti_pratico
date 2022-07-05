import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreStatus extends StatelessWidget {

  bool online;

  StoreStatus(this.online);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: online ? Colors.green : Colors.red,
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        online ? 'Online' : 'Offline',
        style: Get.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
