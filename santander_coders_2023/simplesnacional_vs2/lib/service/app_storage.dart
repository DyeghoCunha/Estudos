import 'package:shared_preferences/shared_preferences.dart';

enum Storage_Chaves { CHAVES_DADOS_CADASTRIAS_NOME }

class AppStorage {
  void setDadosCadastraisNome(String nome) async {
    _setString(Storage_Chaves.CHAVES_DADOS_CADASTRIAS_NOME.toString(), nome);
  }

  Future<String?> getDadosCadastraisNome() async {
    _getString(Storage_Chaves.CHAVES_DADOS_CADASTRIAS_NOME.toString());
  }


  _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }
  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }
}
