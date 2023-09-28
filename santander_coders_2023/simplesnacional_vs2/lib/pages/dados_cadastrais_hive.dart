import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/model/dadosCadastrais_model.dart';
import 'package:simplesnacional_vs2/repositories/dadosCadastrais_repository.dart';
import '../repositories/segmentoAtividade_repository.dart';
import '../repositories/ramoAtividade_repository.dart';

class DadosCadastraisHive extends StatefulWidget {
  const DadosCadastraisHive({super.key});

  @override
  State<DadosCadastraisHive> createState() => _DadosCadastraisStateHive();
}

class _DadosCadastraisStateHive extends State<DadosCadastraisHive> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController inscricaoEstadualController = TextEditingController();
  TextEditingController dataAberturaController = TextEditingController();

  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();

  DateTime? dataAbertura;

  var ramoAtividadeRepository = RamoAtividadeRepository();
  var segmentoAtividadeRepository = SegmentoAtividadeRepository();

  List<String>? ramoAtividade = [];
  List<String> segmentoAtividade = [];

  var ramoSelecionado = "";

  List<String> atividades = [];
  double salarioEscolhido = 0;
  int anexoPrincipal = 1;

  @override
  void initState() {
    ramoAtividade = ramoAtividadeRepository.retornaAtividades();
    segmentoAtividade = segmentoAtividadeRepository.retornaSegmentoAtividade();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nomeFantasia ?? "";
    cnpjController.text = dadosCadastraisModel.cnpj ?? "";
    cepController.text = dadosCadastraisModel.cep ?? "";
    inscricaoEstadualController.text = dadosCadastraisModel.inscricaoEstadual ?? "";
    dataAberturaController.text =
        dadosCadastraisModel.dataAbertura == null ? "" : dadosCadastraisModel.dataAbertura.toString();
    if (dataAberturaController.text.isNotEmpty) {
      dataAbertura = DateTime.parse(dataAberturaController.text);
    }

    ramoSelecionado = dadosCadastraisModel.ramoAtividade??"";
    segmentoAtividade = dadosCadastraisModel.segmentoAtividade??[];
    //anexoPrincipal = dadosCadastraisModel.anexoPrincipal??"Anexo I";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Dados Cadastrais")),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/fundo3.png"),
            fit: BoxFit.cover,
          )),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: nomeController,
                        decoration: InputDecoration(
                            labelText: "Nome Fantasia",
                            border: const OutlineInputBorder(),
                            hintText: "Digite o Nome da Empresa",
                            hintStyle:
                                TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.4))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: cnpjController,
                        decoration: InputDecoration(
                          labelText: "Cnpj",
                          border: const OutlineInputBorder(),
                          hintText: "Digite o Cnpj da Empresa ",
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: inscricaoEstadualController,
                        decoration: InputDecoration(
                          labelText: "Inscrição",
                          border: const OutlineInputBorder(),
                          hintText: "Digite o numero",
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        readOnly: true,
                        controller: dataAberturaController,
                        onTap: () async {
                          var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2023, 1, 1),
                            firstDate: DateTime(1980, 5, 20),
                            lastDate: DateTime(2024, 10, 23),
                          );
                          if (data != null) {
                            dataAberturaController.text = data.toString();
                            dataAbertura = data;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Data de Abertura",
                          border: const OutlineInputBorder(),
                          hintText: "Digite o numero",
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Ramo de Atividade"),
                            ),
                            Column(
                              children: ramoAtividade!
                                  .map(
                                    (ramo) => RadioListTile(
                                      title: Text(ramo.toString()),
                                      selected: ramoSelecionado == ramo,
                                      value: ramo,
                                      groupValue: ramoSelecionado,
                                      onChanged: (value) {
                                        setState(() {
                                          ramoSelecionado = value.toString();
                                        });
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("Segmento de Atividade"),
                            ),
                            Column(
                              children: segmentoAtividade
                                  .map(
                                    (atividade) => CheckboxListTile(
                                      title: Text(atividade),
                                      value: atividades.contains(atividade),
                                      onChanged: (value) {
                                        if (value!) {
                                          setState(() {
                                            atividades.add(atividade);
                                          });
                                        } else {
                                          setState(() {
                                            atividades.remove(atividade);
                                          });
                                        }
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("Anexo do Simples Nacional"),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButton(
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                value: anexoPrincipal,
                                icon: const Icon(
                                  Icons.select_all,
                                  color: Colors.green,
                                ),
                                isExpanded: true,
                                items: const [
                                  DropdownMenuItem(
                                    child: Text("Anexo I"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: const Text("Anexo II"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: const Text("Anexo III"),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: const Text("Anexo IV"),
                                    value: 4,
                                  ),
                                  DropdownMenuItem(
                                    child: const Text("Anexo V"),
                                    value: 5,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    anexoPrincipal = value! ;
                                  });
                                },
                              )

                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                  "Faturamento Mensal Médio: R\$ ${salarioEscolhido.round().toString()}"),
                            ),
                            Slider(
                              thumbColor: Colors.blue,
                              activeColor: Colors.green,
                              inactiveColor: Colors.yellow,
                              label: "Pretenção Salarial",
                              min: 0,
                              divisions: 10000,
                              max: 10000000,
                              value: salarioEscolhido,
                              onChanged: (value) {
                                setState(() {
                                  salarioEscolhido = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                           dadosCadastraisRepository.salvar(dadosCadastraisModel);
                        },
                        child: const Text("Salvar"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
