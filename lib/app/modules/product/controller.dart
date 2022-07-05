import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final produto = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observacaoController = TextEditingController();
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    produto.value = Get.arguments['produto'];
    store.value = Get.arguments['store'];

    super.onInit();
  }

  void addToCart() async {
    var quantity = Get.find<QuantityAndWeightController>().quantity;

    if (_cartService.isANewStore(store.value!)) {
      var startNewCart = await showDialogNewCart();

      if (startNewCart == true) {
        _cartService.clearCart();
      }else{
        return;
      }

    }

    if (_cartService.products.isEmpty) {
      _cartService.newCart(store.value!);
    }

    _cartService.aadProductTpCart(CartProductModel(
      product: produto.value!,
      quantity: quantity,
      observacao: observacaoController.text,
    ));

    // Get.rawSnackbar(message: '${'O item' + produto.value!.nome} foi adicionado ao carrinho.',
    //   snackStyle: SnackStyle.GROUNDED,
    // );

    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content: Text(
            '${'O item${produto.value!.nome}'} foi adicionado ao carrinho.'),
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(microseconds: 300), () => Get.back());
  }

  Future showDialogNewCart() {
    return Get.dialog(
      AlertDialog(
        content: const Text(
            'Seu carrinho atual sera perdido. Deseja criar um novo carrinho?'),
        actions: [
          TextButton(
            child: const Text('Voltar'),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text('Continuar'),
            onPressed: () => Get.back(result: true),
          ),
        ],
      ),
    );
  }
}
