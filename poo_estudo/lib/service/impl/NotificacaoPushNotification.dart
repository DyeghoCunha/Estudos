import 'package:poo_estudo/classes/Pessoa.dart';
import 'package:poo_estudo/service/NotificacaoInterface.dart';

class NotificationPushNotification implements NotificacaoInterface{
  @override
  void EnviarNotificacao(Pessoa pessoa){
    print("Enviando Push para : ${pessoa.nome}");
  }

}
