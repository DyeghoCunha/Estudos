import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  String get id => _id;

  String get descricao => _descricao;

  bool get concluido => _concluido;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }

  Tarefa(this._descricao, this._concluido);
}
