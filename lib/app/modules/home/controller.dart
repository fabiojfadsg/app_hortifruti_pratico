import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:get/get.dart';

import 'package:app_hortifruti_pratico/app/modules/home/repository.dart';

class HomeController extends GetxController with StateMixin<List<StoreModel>> {
  final HomeRepository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    _repository.getStores().then(
      (data) {
        change(data, status: RxStatus.success());
      }, onError: (error) {
        change(state, status: RxStatus.error(error.toString()));
      });
    super.onInit();
  }
}
