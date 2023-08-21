import 'dart:io';

import 'package:desafio_imc/models/pessoa.dart';

void main(List<String> arguments) {
  var nome = "";
  var peso = 0.1;
  var altura = 0.1;
  var pessoa = Pessoa(nome, peso, altura);
  print("Bem vindo ao Desafio 1 do Santander BootCamp 2023 da Dio!!\n");
  print("Como posso te chamar?");
  pessoa.nome = stdin.readLineSync() ?? "Anonimo";
  print("Muito bem ${pessoa.nome}, agora me diga, qual é o seu peso ?");
  pessoa.peso = double.parse(stdin.readLineSync().toString());
  print("Legal, estamos quase lá... agora falta me falar a sua altura");
  pessoa.altura = double.parse(stdin.readLineSync().toString());
  print("Muito bem ${pessoa.nome}, você tem ${pessoa.peso} kilos e mede ${pessoa.altura} ");
  print("O seu IMC é ${pessoa.calculaImc()}");
}
