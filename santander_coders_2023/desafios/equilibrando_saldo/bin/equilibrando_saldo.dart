import 'dart:io';

void main() {
  double saldo = 0.0;
  bool encerrarPrograma = false;

  while (!encerrarPrograma) {
    double valor = double.parse(stdin.readLineSync()!);

    if (valor > 0) {
      saldo += valor;
      print("Deposito realizado com sucesso!");
      print("Saldo atual: R\$ ${saldo.toStringAsFixed(2)}");
    } else if (valor < 0) {
      print("Valor invalido! Digite um valor maior que zero.");

    } else {
      print("Encerrando o programa...");
      encerrarPrograma = true;
    }
  }
}