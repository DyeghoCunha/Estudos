import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplesnacional_vs2/model/configuracoes_model.dart';
import 'package:simplesnacional_vs2/repositories/configuracoes_repository.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  //late SharedPreferences storage;
  // final CHAVE_NOME_USUARIO = "chave_nome_usuario";
  // final CHAVE_FATURAMENTO = "chave_faturamento";
  // final CHAVE_PUSH_NOTIFICATION = "chave_push_notification";
  // final CHAVE_DARK_THEME = "chave_dark_theme";

  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController nomeEscritorioController = TextEditingController();

  // String? nomeUsuario;
  // String? nomeEscritorio;
  // double? faturamento;
  // bool isPushNotification = false;
  // bool isDark = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // carregarDadosSharedPreferences();
    carregarDadosHive();
  }

  carregarDadosHive() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    nomeEscritorioController.text = configuracoesModel.nomeEscritorio;
  }

  // carregarDadosSharedPreferences() async {
  //   storage = await SharedPreferences.getInstance();
  //   setState(() {
  //     nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
  //     faturamentoController.text = (storage.getDouble(CHAVE_FATURAMENTO) ?? 0).toString();
  //     isPushNotification = storage.getBool(CHAVE_PUSH_NOTIFICATION) ?? false;
  //     isDark = storage.getBool(CHAVE_DARK_THEME) ?? false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: Theme.of(context).brightness == Brightness.light
              ? const AssetImage("assets/images/fundo0.png")
              : const AssetImage("assets/images/fundo0d.png"),
          fit: BoxFit.cover)
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Nome usuário",
                  border: OutlineInputBorder(),
                  label: Text("Nome Usuário"),
                ),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Nome do Escritorio",
                  border: OutlineInputBorder(),
                  label: Text("Nome do Escritório"),
                ),
                controller: nomeEscritorioController,
              ),
            ),
            SwitchListTile(
              title: const Text("Receber Notificações"),
              onChanged: (bool value) {
                setState(() {
                  configuracoesModel.isNotificacao = value;
                });
              },
              value: configuracoesModel.isNotificacao,
            ),
            SwitchListTile(
              value: configuracoesModel.isTemaEscuro,
              title: const Text("Tema Escuro"),
              onChanged: (bool value) {
                setState(() {
                  configuracoesModel.isTemaEscuro = value;
                });
              },
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {} catch (erro) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("Meu App"),
                                content: const Text("Favor informar um faturamento válido"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            });
                        return;
                      }
                      configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                      configuracoesModel.nomeEscritorio = nomeEscritorioController.text;
                      setState(() {
                        configuracoesRepository.salvar(configuracoesModel);
                      });
                      // await storage.setBool(CHAVE_PUSH_NOTIFICATION, isPushNotification);
                      // await storage.setBool(CHAVE_DARK_THEME, isDark);
                      Navigator.pop(context);
                    },
                    child: const Text("Salvar"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
