class Skin {
  String nome;
  String cor;
  String categoria;
  String tipo;
  int tradeLock;
  String imagem;
  bool statTrak;
  double float;
  int pattern;
  String rarity;
  double defaultPrice;
  double userMarkup;
  double rareFloat;

  Skin(
      {required this.nome,
      required this.cor,
        required this.categoria,
      required this.tipo,
        required this.tradeLock,
      required this.imagem,
      required this.statTrak,
      required this.float,
      required this.pattern,
      required this.rarity,
      required this.defaultPrice,
      required this.userMarkup,
      required this.rareFloat});

  void valorTotal() {
    var valortotal = defaultPrice + userMarkup + rareFloat;
  }
}
