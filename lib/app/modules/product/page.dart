import 'package:app_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = controller.produto.value!;

    return Scaffold(
      appBar: AppBar(title: Text(product.nome)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            if (product.imagem.isNotEmpty)
              Align(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.imagem,
                    ),
                  ),
                ),
              ),
            if (product.descricao != null)
              Text(
                product.descricao!,
                style: Get.textTheme.titleMedium,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                NumberFormat.simpleCurrency().format(product.preco) +
                    (product.isKg ? ' Kg' : ''),
                style: Get.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: controller.observacaoController,
                decoration: InputDecoration(
                  labelText: 'Observação',
                  labelStyle: Get.textTheme.titleMedium,
                  border: const OutlineInputBorder(),
                ),
                maxLength: 50,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.black12, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Altere ${product.isKg ? 'peso' : 'quantidade'}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  QuantyAndWeightWidget(
                    isKg: product.isKg,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ElevatedButton(
                  onPressed: () => controller.addToCart(),
                  child: const Text('Adicionar ao carrinho')),
            )
          ],
        ),
      ),
    );
  }
}
