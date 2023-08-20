import 'package:poo_estudo/classes/Pessoa.dart';
import 'package:poo_estudo/service/enviarNotificacao.dart';

abstract class NotificacaoInterface{
  void EnviarNotificacao(Pessoa pessoa);
}