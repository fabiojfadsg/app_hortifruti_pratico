import 'package:app_hortifruti_pratico/app/modules/home/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hortifruti Prático'),
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var store in state!)
              ListTile(
                title: Text(store.nome),
                leading: SizedBox(
                  width: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: store.logo,
                    ),
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: store.online ? Colors.green : Colors.red,
                    border: Border.all(
                      color: Colors.black12,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(store.online ? 'Online' : 'Offline',
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                onTap: () => Get.toNamed(Routes.store.replaceFirst(':id', store.id.toString())),
              ),
          ],
        ),
        onEmpty: const Center(
          child: Text('Nenhum estabelecimento encontrado'),
        ),
      ),
    );
  }
}
