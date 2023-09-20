import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController faturamentoController = TextEditingController();
  String? nomeUsuario;
  double? faturamento;
  bool isPushNotification = false;
  bool isDark = false;
  final CHAVE_NOME_USUARIO = "chave_nome_usuario";
  final CHAVE_FATURAMENTO = "chave_faturamento";
  final CHAVE_PUSH_NOTIFICATION = "chave_push_notification";
  final CHAVE_DARK_THEME = "chave_dark_theme";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      faturamentoController.text = (storage.getDouble(CHAVE_FATURAMENTO) ?? 0).toString();
      isPushNotification = storage.getBool(CHAVE_PUSH_NOTIFICATION) ?? false;
      isDark = storage.getBool(CHAVE_DARK_THEME) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Configurações"),
          ),
          body: Container(
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
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Faturamento",
                      border: OutlineInputBorder(),
                      label: Text("Faturamento"),
                    ),
                    controller: faturamentoController,
                  ),
                ),
                SwitchListTile(
                  value: isPushNotification,
                  title: Text("Receber Notificações"),
                  onChanged: (bool value) {
                    setState(
                          () {
                        isPushNotification = !isPushNotification;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  value: isDark,
                  title: Text("Tema Escuro"),
                  onChanged: (bool value) {
                    setState(
                          () {
                        isDark = value;
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: () async {
                        await storage.setString(CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                        try {
                          await storage.setDouble(CHAVE_FATURAMENTO,
                            double.parse(faturamentoController.text) );
                        } catch(erro){
                          showDialog(context: context, builder: (_){
                            return  AlertDialog(
                              title: Text("Meu App"),
                              content: Text("Favor informar um faturamento váliso"),
                              actions: [
                                TextButton(onPressed: (){
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Navigator.pop(context);
                                }, child: Text("OK"),),
                              ],
                            );
                          }
                          ); return;
                        }


                        await storage.setBool(CHAVE_PUSH_NOTIFICATION, isPushNotification);
                        await storage.setBool(CHAVE_DARK_THEME, isDark);
                        Navigator.pop(context);
                      }, child: Text("Salvar"),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
