import 'dart:io';
import 'dart:math';

class Pessoa {
  String _nome;
  double _peso;
  double _altura;

  Pessoa(this._nome, this._peso, this._altura);

  String get nome => _nome;

  double get peso => _peso;

  double get altura => _altura;

  double? _resultadoImc;

  bool contemCaractereEspecial(String nome) {
    RegExp parametro = RegExp(r'[!@#$%*1234567890]');
    return parametro.hasMatch(nome);
  }

  set nome(String novoNome) {
    int? verificaEntrada = int.tryParse(novoNome);
    if (verificaEntrada != null) {
      print("Você digitou um número, $novoNome não é um nome válido\n");
      _nome = "Retorna";
      return;
    } else if (contemCaractereEspecial(novoNome)) {
      print("Humm, seu nome contem caracteres especiais, digite novamente, por favor\n ");
      _nome = "Retorna";
      return;
    }
    _nome = novoNome.isNotEmpty ? novoNome : "Anonimo";
  }

  set peso(double novoPeso) {
    if (novoPeso > 0) _peso = novoPeso;
  }

  set altura(dynamic novaAltura) {

    if (novaAltura > 0) _altura = novaAltura;
  }

  double? calculaImc() {
    if (_peso == null || altura == null) {
      return 0;
    }
    var imc = _peso / pow(altura, 2);
    if (imc > 0) {
      _resultadoImc = imc;
      return _resultadoImc;
    }
  }

  void verificaObesidade() {
    if (_resultadoImc! < 18.5) {
      print("Como o seu IMC é $_resultadoImc vejo que você está abaixo do peso.");
    } else if (_resultadoImc! >= 18.5 && _resultadoImc! < 25) {
      print("Olha...como seu IMC é $_resultadoImc digo que você esta com o peso normal.");
    } else if (_resultadoImc! >= 25 && _resultadoImc! < 30) {
      print("Hey!! Cuidado o seu IMC é $_resultadoImc e você está com sobrepeso.");
    } else {
      print("Cuidado $_nome, o seu IMC é $_resultadoImc e você está com obesidade, toma cuidado Ok??");
    }
  }
}
