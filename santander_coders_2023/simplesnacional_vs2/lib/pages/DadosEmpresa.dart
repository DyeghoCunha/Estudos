import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/model/EmpresaModel.dart';
import 'package:simplesnacional_vs2/service/simplesNacionalAnexo.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';
import 'package:simplesnacional_vs2/widgets/circularProgressIndicatorCustom.dart';

import '../themes/theme_colors.dart';

class DadosEmpresa extends StatefulWidget {
  DadosEmpresa({super.key, required this.cnpj});

  String cnpj;

  @override
  State<DadosEmpresa> createState() => _DadosEmpresaState();
}

class _DadosEmpresaState extends State<DadosEmpresa> {
  final SimplesNacionalAnexo _simplesNacionalAnexo = SimplesNacionalAnexo();
  Empresa empresa = Empresa();
  late Future<Empresa?> _empresaFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _empresaFuture = Future.delayed(Duration(seconds: 1), () {
      return _testeEmpresa();
    });
  }

  Future<Empresa?> _testeEmpresa() async {
    String cnpj = widget.cnpj;
    Map<String, dynamic> empresaData = await Empresa.fromCNPJ(cnpj);
    if (empresaData != null) {
      // Verifique se os dados foram obtidos com sucesso
      Empresa empresa = Empresa(
        cnpj: empresaData['cnpj'],
        razaoSocial: empresaData['razaoSocial'],
        nomeFantasia: empresaData['nomeFantasia'],
        cep: empresaData['cep'],
        cidade: empresaData['cidade'],
        estado: empresaData['estado'],
        bairro: empresaData['bairro'],
        rua: empresaData['rua'],
        numero: empresaData['numero'],
        location: empresaData['location'],
        cnaeFiscal: empresaData['cnaeFiscal'],
        capitalSocial: empresaData['capitalSocial'],
        cnaeFiscalDesc: empresaData['cnaeFiscalDesc'],
        cnaeSecundarios: empresaData['cnaeSecundarios'],
        codigoMunicipal: empresaData['codigoMunicipal'],
        codNatJuridica: empresaData['codNatJuridica'],
        complemento: empresaData['complemento'],
        dataExclusaoSimples: empresaData['dataExclusaoSimples'],
        dataInicioAtividades: empresaData['dataInicioAtividades'],
        dataOpcaoSimples: empresaData['dataOpcaoSimples'],
        dataSituacaoCadastral: empresaData['dataSituacaoCadastral'],
        dataSituacaoEspecial: empresaData['dataSituacaoEspecial'],
        dddPhone1: empresaData['dddPhone1'],
        dddPhone2: empresaData['dddPhone2'],
        descPorte: empresaData['descPorte'],
        descSituacaoCadastral: empresaData['descSituacaoCadastral'],
        descSubsidiaria: empresaData['descSubsidiaria'],
        descTipoLogadouro: empresaData['descTipoLogadouro'],
        isMei: empresaData['isMei'],
        isSimples: empresaData['isSimples'],
        porteDaEmpresa: empresaData['porteDaEmpresa'],
        quadSocietario: empresaData['quadSocietario'],
        situacaoCadastral: empresaData['situacaoCadastral'],
      );
      return empresa;
    } else {
      // Trate o caso em que os dados não foram obtidos com sucesso
      print('Não foi possível obter os dados da empresa.');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: ThemeColors.appBarGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text("Dados Empresa"),
      ),
      body: FutureBuilder<Empresa?>(
        future: _empresaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicatorCustom());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            Empresa empresa = snapshot.data!;

            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    _listTile(
                      titulo: "Razão Social",
                      subtitulo: empresa.razaoSocial ?? "",
                    ),
                    _listTile(
                      titulo: "Nome Fantasia",
                      subtitulo: empresa.nomeFantasia ?? "",
                    ),
                    _listTile(
                      titulo: "CNPJ",
                      subtitulo: empresa.cnpj ?? "",
                      isCaps: true,
                    ),
                    _CnaeAnexo(
                      subtitulo: empresa.cnaeFiscal ?? 0,
                      descricao: empresa.cnaeFiscalDesc ?? "",
                      anexo: _simplesNacionalAnexo.retornaAnexo(empresa.cnaeFiscal ?? 0),
                      fatorR: _simplesNacionalAnexo.retornaFatorR(empresa.cnaeFiscal ?? 0),
                      titulo: "CNAE Principal",
                    ),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, top: 8),
                    child: Text("CNAE Secundário",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.6), fontSize: 16)),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var item = empresa.cnaeSecundarios![index];
                      return _CnaeSecundario(
                        cnae: item["codigo"],
                        descricao: item["descricao"],
                        anexo: _simplesNacionalAnexo.retornaAnexo(item["codigo"] ?? 0),
                        fatorR: _simplesNacionalAnexo.retornaFatorR(8720499 ?? 0),
                      );
                    },
                    childCount: empresa.cnaeSecundarios?.length ?? 0,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    height: 0,
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: Column(
                //     children: [
                //       Text(empresa.porteDaEmpresa!),
                //       Text(empresa.descSituacaoCadastral!),
                //       Text(empresa.isSimples.toString()),
                //       Text(empresa.isMei.toString()),
                //       Text(empresa.dataInicioAtividades!),
                //       Text(empresa.dataOpcaoSimples!),
                //       Text(empresa.dataExclusaoSimples!),
                //       Text(empresa.codNatJuridica.toString()!),
                //     ],
                //   ),
                //
                // )
                SliverToBoxAdapter(
                  child: _quadroEnquadramento(),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class _quadroEnquadramento extends StatelessWidget {
  _quadroEnquadramento({super.key, this.porteEmpresa = "ME"});

  String porteEmpresa;
  String? dataSimples = "20/10/2023";
  String? dataAbertura;
  String? dataExclusao;
  bool? isSimples = true;
  bool? isMei = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: Card(
        child: ListTile(
          leading: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Ink(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[2],
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text(
                porteEmpresa,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )),
            ),
          ),
          title: Text("Opetante pelo Simples Nacional",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          subtitle: Text(
            "dês de $dataSimples",
            style: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}

class _listTile extends StatelessWidget {
  _listTile({super.key, required this.titulo, required this.subtitulo, this.isCaps = false});

  String? titulo = "";
  String? subtitulo = "";
  bool isCaps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: isCaps
              ? Text(
                  titulo!,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
                )
              : Text(
                  Utilidades.primeiraMaiuscula(titulo!),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
                ),
          subtitle: titulo == "CNPJ"
              ? Text(
                  Utilidades.formatarCNPJ(subtitulo!),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                )
              : Text(
                  Utilidades.primeiraMaiuscula(subtitulo!),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}

class _CnaeAnexo extends StatelessWidget {
  _CnaeAnexo(
      {super.key,
      required this.subtitulo,
      required this.descricao,
      required this.anexo,
      required this.fatorR,
      required this.titulo});

  String titulo;
  int subtitulo;
  String descricao;
  String? anexo;
  bool? fatorR = true;

  @override
  Widget build(BuildContext context) {
    bool fator = fatorR != null ? fatorR! : true;

    return Column(
      children: [
        ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            isThreeLine: true,
            title:
                Text(titulo, style: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.6))),
            subtitle: Text.rich(TextSpan(
                text: subtitulo.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                children: [
                  TextSpan(
                      text: "\n$descricao",
                      style: TextStyle(
                          fontSize: 12, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)))
                ])),
            trailing: _anexoConcomitante(
              anexo: anexo!,
              fatorR: fator,
            )),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}

class _CnaeSecundario extends StatelessWidget {
  _CnaeSecundario(
      {super.key, required this.descricao, required this.anexo, required this.fatorR, required this.cnae});

  int cnae;
  String descricao;
  String? anexo;
  bool? fatorR = true;

  @override
  Widget build(BuildContext context) {
    bool fator = fatorR != null ? fatorR! : true;
    return Column(
      children: [
        ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(cnae.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
            subtitle: Text(
              descricao,
              style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            ),
            trailing: _anexoConcomitante(
              anexo: anexo!,
              fatorR: fator,
            )),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}

class _anexoConcomitante extends StatelessWidget {
  _anexoConcomitante({super.key, required this.fatorR, required this.anexo});

  bool fatorR;
  String anexo;

  @override
  Widget build(BuildContext context) {
    return fatorR
        ? InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  boxShadow: kElevationToShadow[2],
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Anexo III",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      Text(
                        "Anexo V",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[2],
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 60,
                  child: Text(
                    anexo,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12),
                  ),
                ),
              ),
            ),
          );
  }
}
