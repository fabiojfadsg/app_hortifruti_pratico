import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/modules/cart/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Carrinho')),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: TextField(
                    controller: controller.observacaoController,
                    decoration: InputDecoration(
                      labelText: 'Observação',
                      labelStyle: Get.textTheme.titleMedium,
                    ),
                    maxLength: 50,
                  ),
                ),
                if (controller.store != null)
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(controller.store!.nome),
                    ),
                  ),
                for (var cartProduct in controller.products)
                  ListTile(
                    title: Text(cartProduct.product.nome),
                    subtitle: Text(
                        '${NumberFormat.simpleCurrency().format(cartProduct.total)} (${NumberFormat.simpleCurrency().format(cartProduct.product.preco)})'),
                    leading: _buildProductQuantity(cartProduct),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.removeProduct(cartProduct),
                    ),
                  ),
                if (controller.products.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Nenhum item no carrinho.'),
                    ),
                  )
                else ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.checkout),
                  child: const Text('Avançar'),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildProductQuantity(CartProductModel cartProduct) {
    return Text(
      NumberFormat.decimalPattern().format(cartProduct.quantity) +
          (cartProduct.product.isKg ? 'kg' : 'un'),
    );
  }
}
