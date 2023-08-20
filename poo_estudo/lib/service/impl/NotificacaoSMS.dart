import 'package:poo_estudo/classes/Pessoa.dart';
import 'package:poo_estudo/service/NotificacaoInterface.dart';

class NotificacaoSMS implements NotificacaoInterface{

  @override
  void EnviarNotificacao(Pessoa pessoa) {
    print("Enviando SMS para : ${pessoa.nome}");
  }
}