import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  final _cartService = Get.find<CartService>();
  List<CartProductModel> get products => _cartService.products;
  final observacaoController = TextEditingController();
  StoreModel? get store => _cartService.store.value;

  @override
  void onInit() {

    observacaoController.text = _cartService.observation.value;

    observacaoController.addListener(() { 
      _cartService.observation.value = observacaoController.text;
    });

    super.onInit();
  }


  void removeProduct(CartProductModel cartProduct) {
    _cartService.removeProductFromCart(cartProduct);
  }
}