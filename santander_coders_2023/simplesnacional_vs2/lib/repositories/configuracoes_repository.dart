import 'package:hive/hive.dart';
import 'package:simplesnacional_vs2/model/configuracoes_model.dart';

class ConfiguracoesRepository {
  static late Box _box;

  ConfiguracoesRepository._criar();

  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen("configuracoes")) {
      _box = Hive.box("configuracoes");
    } else {
      _box = await Hive.openBox("configuracoes");
    }
    return ConfiguracoesRepository._criar();
  }

  void salvar(ConfiguracoesModel configuracoesModel) {
    _box.put("configuracoesModel", {
      "nomeUsuario": configuracoesModel.nomeUsuario,
      "nomeEscritorio": configuracoesModel.nomeEscritorio,
      "isNotificacao": configuracoesModel.isNotificacao,
      "isTemaEscuro": configuracoesModel.isTemaEscuro
    });
  }

  ConfiguracoesModel obterDados() {
    var configuracoes = _box.get("configuracoesModel");
    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    }
    return ConfiguracoesModel(
      configuracoes["isNotificacao"],
      configuracoes["isTemaEscuro"],
      configuracoes["nomeEscritorio"],
      configuracoes["nomeUsuario"],
    );
  }
}
