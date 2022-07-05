import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {

  @override
  void onInit(){
    httpClient.baseUrl = 'http://127.0.0.1:3333/';

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    super.onInit();
  }

  Future<List<StoreModel>> getStores() async {
    var response = _errorHandler(await get('cidades/1/estabelecimentos'));

    List<StoreModel> data = [];
    for (var store in response.body) {
      data.add(StoreModel.fromJson(store));
    }
  
   return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = _errorHandler(await get('estabelecimentos/$id'));

    return StoreModel.fromJson(response.body);
  }

  Response _errorHandler(Response response) {
    if (kDebugMode) {
      print(response.bodyString);
    }
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        return response;
     default:
      throw 'Erro ao fazer requisição';  
    }
  }
}