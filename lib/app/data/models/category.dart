import 'package:app_hortifruti_pratico/app/data/models/product.dart';

class CategoryModel {
  int id;
  String nome;
  List<ProductModel> produtos;

  CategoryModel({
    required this.id,
    required this.nome,
    required this.produtos,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nome: json["nome"],
        produtos: json["produtos"] == null
            ? []
            : List<ProductModel>.from(
                json["produtos"].map(
                  (produto) => ProductModel.fromJson(produto),
                ),
              ),
      );
}
