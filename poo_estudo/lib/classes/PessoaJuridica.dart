import 'package:poo_estudo/classes/Pessoa.dart';
import 'package:poo_estudo/enum/tipo_notificacao.dart';

class PessoaJuridica extends Pessoa {
  PessoaJuridica({required this.cnpj, required String nome, required String endereco, required
  TipoNotificacao tipoNotificacao}): super
(endereco:
  endereco, nome:
  nome, tipoNotificacao: tipoNotificacao);

  String cnpj;

  @override
  String toString(){
    return {
      "Nome":nome,
      "Endereco": endereco,
      "Cnpj": cnpj,
      "Notificação": getTipoNotificacao()
    }.toString();
  }
}