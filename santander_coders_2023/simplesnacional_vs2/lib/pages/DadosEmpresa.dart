import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/model/EmpresaModel.dart';
import 'package:simplesnacional_vs2/service/simplesNacionalAnexo.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';

import '../themes/theme_colors.dart';

class DadosEmpresa extends StatefulWidget {
   DadosEmpresa({super.key,required this.cnpj});
 String cnpj;
  @override
  State<DadosEmpresa> createState() => _DadosEmpresaState();
}

class _DadosEmpresaState extends State<DadosEmpresa> {
  List<Map<String, dynamic>> listaEmpresa = [];
  final SimplesNacionalAnexo _simplesNacionalAnexo = SimplesNacionalAnexo();

  TextEditingController cepController = TextEditingController();
  late Empresa empresa;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _testeEmpresa();
  }

  _testeEmpresa() async {
    String cnpj = widget.cnpj;
    Map<String, dynamic> empresaData = await Empresa.fromCNPJ(cnpj);
    if (empresaData != null) {
      // Verifique se os dados foram obtidos com sucesso
      empresa = Empresa(
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: ThemeColors.appBarGradient, // Cores do gradiente
            begin: Alignment.topLeft, // Início do gradiente
            end: Alignment.bottomRight,
          )),
        ),
        title: const Text("Dados Empresa"),
      ),
      body: ListView(
        children: [
          _listTile(
            titulo: "Razão Social",
            subtitulo: empresa.razaoSocial!,
          ),
          _listTile(
            titulo: "Nome Fantasia",
            subtitulo: empresa.nomeFantasia!,
          ),
          _listTile(
            titulo: "CNPJ",
            subtitulo: empresa.cnpj!,
            isCaps: true,
          ),
          _CnaeAnexoPrincipal(
            subtitulo: empresa.cnaeFiscal!,
            descricao: empresa.cnaeFiscalDesc!,
            anexo: _simplesNacionalAnexo.retornaAnexo(empresa.cnaeFiscal),
            fatorR: _simplesNacionalAnexo.retornaFatorR(
              empresa.cnaeFiscal!,
            ),
          ),
        ],
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

class _CnaeAnexoPrincipal extends StatelessWidget {
  _CnaeAnexoPrincipal(
      {super.key,
      required this.subtitulo,
      required this.descricao,
      required this.anexo,
      required this.fatorR});

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
          title: Text("CNAE Principal",
              style: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.6))),
          subtitle: Text.rich(TextSpan(
              text: subtitulo.toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              children: [
                TextSpan(
                    text: "\n$descricao",
                    style: TextStyle(
                        fontSize: 12, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)))
              ])),
          trailing: !fator ?
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 80,
                  child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Anexo III",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                        Divider(height: 5,),
                        Text(
                          "Anexo V",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    )

                ),
              ),
            ),
          )
          :
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 80,
                  child:
                  Text(
                    anexo!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
