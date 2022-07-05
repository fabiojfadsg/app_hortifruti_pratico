import 'package:app_hortifruti_pratico/app/modules/store/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:app_hortifruti_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.cart),
        tooltip: 'Ver carrinho',
        child: const Icon(Icons.shopping_cart),
      ),
      body: controller.obx(
        (store) => CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 96.0,
                      height: 96.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: store!.logo,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 26.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store.nome,
                              style: Get.textTheme.headline5,
                            ),
                            const SizedBox(height: 8.0),
                            StoreStatus(store.online)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var categorias = store.categorias[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey[200],
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                categorias.nome,
                                style: Get.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (var produtos in categorias.produtos)
                        ListTile(
                          title: Text(produtos.nome),
                          subtitle: Text(NumberFormat.simpleCurrency().format(produtos.preco) +
                  (produtos.isKg ? ' Kg' : '')),
                          leading: produtos.imagem.isNotEmpty
                              ? SizedBox(
                                  width: 56.0,
                                  height: 56.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: produtos.imagem,
                                    ),
                                  ),
                                )
                              : null,
                          onTap: () => Get.toNamed(
                            Routes.product,
                            arguments: {
                              'produto': produtos,
                              'store': store,
                            },
                          ),
                        )
                    ],
                  );
                },
                childCount: store.categorias.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
