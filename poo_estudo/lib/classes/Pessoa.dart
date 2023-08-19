import 'package:poo_estudo/enum/tipo_notificacao.dart';

class Pessoa {

  String nome;
  String endereco;
  TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;

  void setTipoNotificacao(TipoNotificacao tipoNotificacao){
    _tipoNotificacao = tipoNotificacao;
  }

  TipoNotificacao getTipoNotificacao(){
    return _tipoNotificacao;
  }


  Pessoa({required this.nome, required this.endereco, required TipoNotificacao tipoNotificacao}):
        _tipoNotificacao = tipoNotificacao;

  // Este override tira o INSTANCE OF OBJECT
  @override
  String toString(){
    return {
      "Nome": nome,
      "Endereço": endereco,
      "Notificação": _tipoNotificacao
    }.toString();
  }
}
// classe abstrata não pode ser instanciada - eu não tenho como fazer --> var pessoa = PessoaAbstrata();
abstract class PessoaAbstrata {
  PessoaAbstrata({required this.nome, required this.endereco});
  String nome;
  String endereco;

  // Este override tira o INSTANCE OF OBJECT
  @override
  String toString(){
    return {
      "Nome": nome,
      "Endereço": endereco
    }.toString();
  }
}

class PessoaSetGet{
  String _nome = "";
  String _endereco = "";

  void setNome(String nome){
    _nome = nome;
  }
  String getNome(){
    return _nome;
  }
  void setEndereco(String endereco){
    _endereco = endereco;
  }
  String getEndereco(){
    return _endereco;
  }

  @override
  String toString(){
    return {
      "Nome": _nome,
      "Endereço": _endereco
    }.toString();
  }
}