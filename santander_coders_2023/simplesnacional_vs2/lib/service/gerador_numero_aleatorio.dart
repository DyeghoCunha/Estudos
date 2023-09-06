import 'dart:math';

class GeradorNumeroAleatorioService {


  static int gerarNumeroAleatorio(int numero) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numero);
  }
}