import 'package:poo_estudo/classes/Pessoa.dart';
import 'package:poo_estudo/enum/tipo_notificacao.dart';
import 'package:poo_estudo/service/NotificacaoInterface.dart';
import 'package:poo_estudo/service/impl/NotificacaoEMAIL.dart';
import 'package:poo_estudo/service/impl/NotificacaoPushNotification.dart';
import 'package:poo_estudo/service/impl/NotificacaoSMS.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.SMS:
        notificacao = NotificacaoSMS();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao = NotificationPushNotification();
        break;
      case TipoNotificacao.EMAIL:
        notificacao = NotificacaoEmail();
        break;
      default:
        break;
    }
    if(notificacao !=null) {
      notificacao!.EnviarNotificacao(pessoa);
    }
  }
}
