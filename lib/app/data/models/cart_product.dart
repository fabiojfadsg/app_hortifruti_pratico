import 'package:app_hortifruti_pratico/app/data/models/product.dart';

class CartProductModel {

  ProductModel product;
  num quantity;
  String? observacao;

  CartProductModel({
    required this.product,
    required this.quantity,
    this.observacao,
  });

  num get total => product.preco * quantity;
  
}
