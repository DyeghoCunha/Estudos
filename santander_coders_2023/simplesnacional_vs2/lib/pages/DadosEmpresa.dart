import 'package:br_api/br_api.dart';
import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/model/EmpresaModel.dart';

import '../themes/theme_colors.dart';

class DadosEmpresa extends StatefulWidget {
  const DadosEmpresa({super.key});

  @override
  State<DadosEmpresa> createState() => _DadosEmpresaState();
}

class _DadosEmpresaState extends State<DadosEmpresa> {

 final Empresa empresa = Empresa();


  List<Map<String,dynamic>> listaEmpresa= [];

  TextEditingController cepController = TextEditingController();


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
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Digite o CNPJ")
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
            // await Empresa.fromCNPJ(cepController.text);
          }, child: const Text("Aperta")),

          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () async {
                Empresa result = await Empresa.fromCNPJ(cepController.text);
                print('CNPJ: ${result.cnpj}');
                print('Razão Social: ${result.razaoSocial}');
                print('Nome Fantasia: ${result.nomeFantasia}');
                print('CEP: ${result.cep}');
                print('Cidade: ${result.cidade}');
                print('Estado: ${result.estado}');
                print('Bairro: ${result.bairro}');
                print('Rua: ${result.rua}');
                print('Número: ${result.numero}');
                print('Location: ${result.location}');
                print('CNAE Fiscal: ${result.cnaeFiscal}');
                print('Capital Social: ${result.capitalSocial}');
                print('CNAE Fiscal Desc: ${result.cnaeFiscalDesc}');
                print('CNAE Secundários: ${result.cnaeSecundarios}');
                print('Código Municipal: ${result.codigoMunicipal}');
                print('Código Natureza Jurídica: ${result.codNatJuridica}');
                print('Complemento: ${result.complemento}');
                print('Data de Exclusão do Simples: ${result.dataExclusaoSimples}');
                print('Data de Início das Atividades: ${result.dataInicioAtividades}');
                print('Data de Opção pelo Simples: ${result.dataOpcaoSimples}');
                print('Data da Situação Cadastral: ${result.dataSituacaoCadastral}');
                print('Data da Situação Especial: ${result.dataSituacaoEspecial}');
                print('DDD Telefone 1: ${result.dddPhone1}');
                print('DDD Telefone 2: ${result.dddPhone2}');
                print('Descrição Porte da Empresa: ${result.descPorte}');
                print('Descrição Situação Cadastral: ${result.descSituacaoCadastral}');
                print('Descrição Subsidiária: ${result.descSubsidiaria}');
                print('Descrição Tipo de Logradouro: ${result.descTipoLogadouro}');
                print('É MEI: ${result.isMei}');
                print('É Simples Nacional: ${result.isSimples}');
                print('Porte da Empresa: ${result.porteDaEmpresa}');
                print('Quadro Societário: ${result.quadSocietario}');
                print('Situação Cadastral: ${result.situacaoCadastral}');


              }, child:const  Text("teste CNPJ")),
        ],
      ),
    );
  }
}
