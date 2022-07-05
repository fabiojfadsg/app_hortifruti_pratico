class ProductModel {
  int id;
  String nome;
  String? descricao;
  String imagem;
  num preco;
  String unidade;

  bool get isKg => unidade == 'KG';

  ProductModel({
    required this.id,
    required this.nome,
    this.descricao,
    required this.imagem,
    required this.preco,
    required this.unidade,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    nome: json["nome"],
    descricao: json["descricao"],
    imagem: json["imagem"],
    preco: json["preco"],
    unidade: json["unidade"],
  );
}