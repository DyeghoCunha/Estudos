import 'package:poo_estudo/enum/tipo_notificacao.dart';

import 'Pessoa.dart';

class PessoaFisica extends Pessoa {
  PessoaFisica({required this.cpf, required String nome, required String endereco, required TipoNotificacao
  tipoNotificacao})
      : super(nome: nome, endereco: endereco,tipoNotificacao: tipoNotificacao);
  String cpf;

  @override
  String toString(){
    return {
      "Nome": nome,
      "Endereço": endereco,
      "Cpf": cpf,
      "Notificação":getTipoNotificacao()
    }.toString();
    }
  }

