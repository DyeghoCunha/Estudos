import 'dart:math';

class Pessoa {
  String _nome;
  double _peso;
  double _altura;

  Pessoa(this._nome, this._peso, this._altura);

  String get nome => _nome;

  double get peso => _peso;

  double get altura => _altura;

  set nome(String novoNome) {
    _nome = novoNome.isNotEmpty ? novoNome : "Anonimo";
  }

  set peso(double novoPeso) {
    if (novoPeso > 0) _peso = novoPeso;
  }

  set altura(double novaAltura) {
    if (novaAltura > 0) _altura = novaAltura;
  }

  double? calculaImc() {
    if(_peso == null || altura ==null){return 0;};
    var imc = _peso / pow(altura, 2);
    if (imc > 0) {
      return imc;
    }
  }
}
