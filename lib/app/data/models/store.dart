import 'package:app_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_hortifruti_pratico/app/data/models/shipping_by_city.dart';

class StoreModel {
  int id;
  String nome;
  String logo;
  bool online;
  List <CategoryModel> categorias;
  List <ShippingByCityModel> shippingByCity;

  StoreModel({
    required this.id,
    required this.nome,
    required this.logo,
    required this.online,
    required this.categorias,
    required this.shippingByCity,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    id: json["id"],
    nome: json["nome"],
    logo: json["logo"],
    online: json["online"] == 1,
    categorias: json["categorias"] == null
        ? []
        : List<CategoryModel>.from(
            json["categorias"].map(
              (categoria) => CategoryModel.fromJson(categoria),
            ),
          ),
    shippingByCity: json["cidades"] == null
        ? []
        : List<ShippingByCityModel>.from(
            json["cidades"].map(
              (city) => ShippingByCityModel.fromJson(city),
            ),
          ),
  );
}
