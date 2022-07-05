class ShippingByCityModel {
  int id;
  String nome;
  num custo;

  ShippingByCityModel({
    required this.id,
    required this.nome,
    required this.custo,

  });

  factory ShippingByCityModel.fromJson(Map<String, dynamic> json) => ShippingByCityModel(
    id: json["id"],
    nome: json["nome"],
    custo: json["custo_entrega"],
  );
}