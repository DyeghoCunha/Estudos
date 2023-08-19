import 'package:poo_estudo/classes/Pessoa.dart';
import 'package:poo_estudo/classes/PessoaFisica.dart';
import 'package:poo_estudo/classes/PessoaJuridica.dart';
import 'package:poo_estudo/enum/tipo_notificacao.dart';
import 'package:poo_estudo/poo_estudo.dart' as poo_estudo;

void main(List<String> arguments) {
  var p1 = Pessoa(nome: "Dyegho", endereco: "Rua 1",tipoNotificacao: TipoNotificacao.PUSH_NOTIFICATION);
  print(p1);

  var pessoaFisica = PessoaFisica(
    cpf: "050.439.559-96",
    nome: "Dyegho",
    endereco: "Rua 1",
    tipoNotificacao: TipoNotificacao.SMS,
  );
  print(pessoaFisica);

  var pessoaJuridica = PessoaJuridica(
      cnpj: "03.123.123/0001-03",
      nome: "Top Eletros",
      endereco: "Av "
          "Quarta",
      tipoNotificacao: TipoNotificacao.EMAIL);
  print(pessoaJuridica);
}
