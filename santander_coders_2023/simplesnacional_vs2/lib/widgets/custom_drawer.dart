import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simplesnacional_vs2/components/cartaoDrawer.dart';
import 'package:simplesnacional_vs2/pages/DadosEmpresa.dart';
import 'package:simplesnacional_vs2/pages/PaginaTeste.dart';
import 'package:simplesnacional_vs2/pages/alubank.dart';
import 'package:simplesnacional_vs2/pages/configuracoes_page.dart';
import 'package:simplesnacional_vs2/pages/digiteCnpjModal.dart';
import 'package:simplesnacional_vs2/pages/faturamentoMes.dart';
import 'package:simplesnacional_vs2/pages/numeros_aleatorios.dart';
import 'package:simplesnacional_vs2/widgets/LinkTestDrawer.dart';
import 'package:simplesnacional_vs2/widgets/circularProgressIndicatorCustom.dart';
import '../pages/dados_cadastrais.dart';
import '../pages/login_page.dart';
import '../repositories/hiveDb.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: Theme.of(context).brightness == Brightness.light
                ? const AssetImage("assets/images/fundo3.png")
                : const AssetImage("assets/images/fundo3d.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    barrierColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    barrierLabel: "Teste",
                    showDragHandle: true,
                    context: context,
                    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    builder: (BuildContext bc) {
                      return Wrap(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: Theme.of(context).brightness == Brightness.light
                                            ? const AssetImage("assets/images/fundo0.png")
                                            : const AssetImage("assets/images/fundo0d.png"), fit: BoxFit.cover)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text("Camera"),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(Icons.camera_alt),
                                    ),
                                    ListTile(
                                      title: Text("Galeria"),
                                      leading: Icon(Icons.photo),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CartaoDrawer(),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const DadosCadastrais(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Dados Cadastrais",
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ))),
                    DividerTheme(
                        data: DividerThemeData(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 1,
                        ),
                        child: const Divider()),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          barrierColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          barrierLabel: "Teste",
                          showDragHandle: true,
                          context: context,
                          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                          builder: (BuildContext bc) {
                            return Wrap(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                          image: DecorationImage(
                                              image: Theme.of(context).brightness == Brightness.light
                                                  ? const AssetImage("assets/images/fundo4.png")
                                                  : const AssetImage("assets/images/fundo4d.png"),
                                              fit: BoxFit.cover)),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text("Camera"),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            leading: Icon(Icons.camera_alt),
                                          ),
                                          ListTile(
                                            title: Text("Galeria"),
                                            leading: Icon(Icons.photo),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            barrierColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                            barrierLabel: "Teste",
                            showDragHandle: true,
                            context: context,
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                            builder: (BuildContext bc) {
                              return Wrap(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration:  BoxDecoration(
                                            image: DecorationImage(
                                                image: Theme.of(context).brightness == Brightness.light
                                                    ? const AssetImage("assets/images/fundo4.png")
                                                    : const AssetImage("assets/images/fundo4d.png"),
                                                fit: BoxFit.cover)),
                                        child: const SingleChildScrollView(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(8, 16, 8, 50),
                                            child: Text("""Termos de Uso e Privacidade

Bem-vindo ao nosso aplicativo de cálculos do Simples Nacional. Ao utilizar este aplicativo, você concorda com os seguintes termos e condições:

1. Uso Responsável: Este aplicativo destina-se apenas a fins informativos e não oferece aconselhamento financeiro ou jurídico. Os cálculos fornecidos são baseados em informações públicas e podem não refletir sua situação específica.

2. Coleta de Dados: Para melhorar sua experiência, podemos coletar informações anônimas sobre o uso do aplicativo. Isso nos ajuda a identificar áreas de melhoria e aprimorar nossos serviços.

3. Privacidade: Respeitamos sua privacidade. As informações coletadas são usadas apenas para fins internos e não serão compartilhadas com terceiros sem o seu consentimento.

4. Atualizações: Periodicamente, podemos atualizar o aplicativo para corrigir erros e adicionar recursos. Certifique-se de manter o aplicativo atualizado para obter o melhor desempenho.

5. Isenção de Responsabilidade: Não nos responsabilizamos por qualquer perda ou dano decorrente do uso deste aplicativo. Recomendamos que você verifique todas as informações antes de tomar decisões comerciais.

6. Alterações nos Termos: Reservamos o direito de modificar estes termos a qualquer momento. As alterações entrarão em vigor assim que forem publicadas no aplicativo.

7. Contato: Se você tiver alguma dúvida ou preocupação sobre estes termos, entre em contato conosco através do e-mail de suporte fornecido no aplicativo.

Agradecemos por escolher nosso aplicativo. Esperamos que ele seja útil em seus cálculos relacionados ao Simples Nacional.
 """),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),

                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.file_copy,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Termo de uso e privacidade",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DividerTheme(
                        data: DividerThemeData(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 1,
                        ),
                        child: const Divider()),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ConfiguracoesPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Configurações",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DividerTheme(
                        data: DividerThemeData(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 1,
                        ),
                        child: const Divider()),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     Navigator.push(context, MaterialPageRoute(builder: (ctx) => NumerosAleatorios()));
                    //   },
                    //   child: Row(
                    //     children: [
                    //      FaIcon(FontAwesomeIcons.squareRootVariable,color: Theme.of(context).colorScheme
                    //          .primary,),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text(
                    //         "Shared_Preference",
                    //         style: TextStyle(
                    //           color: Theme.of(context).colorScheme.primary,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // DividerTheme(
                    //     data: DividerThemeData(
                    //       color: Theme.of(context).colorScheme.primary,
                    //       thickness: 1,
                    //     ),
                    //     child: const Divider()),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     Navigator.push(context, MaterialPageRoute(builder: (ctx) => HiveDb()));
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.line_style_outlined,
                    //         color: Theme.of(context).colorScheme.onBackground,
                    //       ),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text(
                    //         "Hive",
                    //         style: TextStyle(
                    //           color: Theme.of(context).colorScheme.onBackground,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // DividerTheme(
                    //     data: DividerThemeData(
                    //       color: Theme.of(context).colorScheme.onBackground,
                    //       thickness: 1,
                    //     ),
                    //     child: const Divider()),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => PaginaTeste()));
                      },
                      child: Row(
                        children: [
                         FaIcon(FontAwesomeIcons.percent, color: Colors.green,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Alíquota",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    DividerTheme(
                        data: DividerThemeData(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 1,
                        ),
                        child: const Divider()),
                    LinkTestDrawer(titulo: "Teste Faturamento", pagina: const FaturamentoMes()),
                    LinkTestDrawer(titulo: "Teste Dados", pagina:  DadosEmpresa(cnpj: "43778721000130",)),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        _showModal(context) ;
                      },
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.percent, color: Colors.green,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Consulta CNPJ",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.exit_to_app),
                label: const Text("Sair"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text(
                            "Simples Nacional",
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                          content: const Wrap(
                            children: [
                              Column(
                                children: [
                                  Text("Deseja Realmente sair do Aplicativo?"),
                                ],
                              ),
                            ],
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.not_interested,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                          actionsPadding: EdgeInsets.only(right: 20),
                          actionsOverflowButtonSpacing: 50,
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

_showModalTeste(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(40, 200, 40, 200),
        child: Card(
          child: Container(
            width: double.infinity,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Digite o CNPJ',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'CNPJ já esta Gerado para Teste',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DadosEmpresa(cnpj: "48354621000108")));
                  },
                  child: const Text('Simples'),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DadosEmpresa(cnpj: "41808853000131")));
                }, child: const Text("ME - Fora Sp")),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DadosEmpresa(cnpj: "33961528000186")));
                }, child: const Text("MEI")),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DadosEmpresa(cnpj: "51902342000138")));
                }, child: const Text("EPP")),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DadosEmpresa(cnpj: "14745136000135")));
                }, child: const Text("Normal"))
              ],
            ),
          ),
        ),
      );
    },
  );

}

_showModal(BuildContext context) {
  TextEditingController _cnpjController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Wrap(
          children: [
            Card(
              child: Container(
                width: double.infinity,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller:_cnpjController ,
                        decoration: const InputDecoration(
                          label: Text("Digite o CNPJF"),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green))
                        ),
                      ),
                    ) ,
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DadosEmpresa(cnpj: _cnpjController.text)));
                      },
                      child: const Text('Consultar'),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}