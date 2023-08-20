import 'package:poo_estudo/classes/Pessoa.dart';
import 'package:poo_estudo/service/NotificacaoInterface.dart';

class NotificacaoEmail implements NotificacaoInterface{
  @override
  void EnviarNotificacao(Pessoa pessoa) {
    print("Enviando email para: ${pessoa.}");
  }

}