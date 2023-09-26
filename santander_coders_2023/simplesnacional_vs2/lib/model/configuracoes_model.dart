class ConfiguracoesModel {
  String _nomeUsuario = "";
  String _nomeEscritorio = "";
  bool _isNotificacao = false;
  bool _isTemaEscuro = false;


  ConfiguracoesModel.vazio(){
    _nomeUsuario = "";
    _nomeEscritorio = "";
    _isNotificacao = false;
    _isTemaEscuro = false;
  }

  ConfiguracoesModel(
    this._isNotificacao ,
    this._isTemaEscuro,
    this._nomeEscritorio,
    this._nomeUsuario,
  );


  String get nomeUsuario => _nomeUsuario;
  set nomeUsuario(String value){
    _nomeUsuario = value;
  }
  String get nomeEscritorio => _nomeEscritorio;
  set nomeEscritorio(String value){
    _nomeEscritorio = value;
  }
  bool get isNotificacao => _isNotificacao;
  set isNotificacao(bool value){
    _isNotificacao = value;
  }
  bool get isTemaEscuro => _isTemaEscuro;
  set isTemaEscuro(bool value){
    _isTemaEscuro = value;
  }

}
