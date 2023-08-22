import 'dart:io';

import 'package:desafio_imc/models/pessoa.dart';

void main(List<String> arguments) {
  var nome = "";
  var peso = 0.1;
  var altura = 0.1;
  double? verificaAltura;
  double? verificaPeso;
  bool validaPeso = false;
  bool validaAltura = false;

  var pessoa = Pessoa(nome, peso, altura);
  int contador = 0;
  print("Bem vindo ao Desafio 1 do Santander BootCamp 2023 da Dio!!\n");
  do {
    if (contador == 0) {
      contador++;
      print("Como posso te chamar?");
      pessoa.nome = stdin.readLineSync() ?? "Anonimo";
    } else if (contador == 1) {
      contador++;
      print("Digite novamente, um nome válido desta vez Ok ??");
      pessoa.nome = stdin.readLineSync() ?? "Anonimo";
    } else {
      contador++;
      print("Hey!! Eu pedi um nome válido e você já digitou um nome inválido $contador vezes\no seu nome "
          "não pode conter !@#\$%* nem numeros, vamos tentar mais uma vez, ok ?");
      pessoa.nome = stdin.readLineSync() ?? "Anonimo";
    }
  } while (pessoa.nome == "Retorna");
  print("Muito bem ${pessoa.nome}, agora me diga, qual é o seu peso ?");

  do {
    try {
      var pesoEntrada = stdin.readLineSync();
      verificaPeso = double.tryParse(pesoEntrada!);
      if (verificaPeso == null) {
        print("Peso inválido, digite outra vez:");
      } else {
        if (verificaPeso <= 0) {
          print("Peso negativo não vale, digite de novo !!");
        } else if (verificaPeso > 300) {
          print("Não quero te julgar, mas eu acho que o peso não esta correto, digite novamente");
        } else if (verificaPeso > 0 && verificaPeso < 30) {
          print("Eu acho que você está leve demais, digite novamente");
        } else {
          validaPeso = true;
        }
      }
    } catch (e) {
      print("Ocorreu um erro: $e");
    }
  } while (validaPeso == false);

  pessoa.peso = verificaPeso!;
  print("Legal, estamos quase lá... agora falta me falar a sua altura");
  do {
    try {
      var alturaEntrada = stdin.readLineSync();
      verificaAltura = double.tryParse(alturaEntrada!);
      if (verificaAltura == null) {
        print("Altura inválida, digite outra vez:");
      } else {
        if (verificaAltura <= 0) {
          print("Altura negativa não vale, digite de novo !!");
        } else if (verificaAltura > 2.50) {
          print("Eu acho que você não é uma girafa né, digite novamente");
        } else if (verificaAltura > 0 && verificaAltura < 0.9) {
          print(
              "Eu não quero te excluir, mas eu acho que você não deve ser tão baixo assim, digita de novo:");
        } else {
          validaAltura = true;
        }
      }
    } catch (e) {
      print("Ocorreu um erro: $e");
    }
  } while (validaAltura == false);

  pessoa.altura = verificaAltura;

  print("_______________________________________________________________________________");
  print("Muito bem ${pessoa.nome}, você tem ${pessoa.peso}kg e mede ${pessoa.altura}m ");
  print("O seu IMC é ${pessoa.calculaImc()}");
  pessoa.verificaObesidade();
}
