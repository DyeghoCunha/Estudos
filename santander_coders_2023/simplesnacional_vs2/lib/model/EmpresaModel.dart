import 'dart:convert';

import 'package:br_api/br_api.dart';

class Empresa {
  String? cnpj = "";
  String? razaoSocial= "";
  String? nomeFantasia = "";
  String? cep= "";
  String? cidade = "";
  String? estado = "";
  String? bairro = "";
  String? rua = "";
  String? numero = "";
  Map<String, dynamic>? location = {"":""};
  int? situacaoCadastral = 0;
  int? capitalSocial = 0;
  int? codigoMunicipal = 0;
  int? cnaeFiscal = 0;
  String? cnaeFiscalDesc = "";
  List? cnaeSecundarios = [];
  String? porteDaEmpresa= "";
  String? complemento = "";
  String? dataSituacaoCadastral="";
  String? dataExclusaoSimples="";
  String? dataSituacaoEspecial="";
  String? dataInicioAtividades="";
  String? dddPhone1 = "";
  String? dddPhone2 = "";
  String? descPorte = "";
  String? descSituacaoCadastral="";
  String? descSubsidiaria ="";
  String? descTipoLogadouro = "";
  int? codNatJuridica = 0;
  bool? isMei = false;
  bool? isSimples = false;
  String? dataOpcaoSimples="";
  List? quadSocietario=[];

  Empresa({
    this.cnpj,
    this.razaoSocial,
    this.nomeFantasia,
    this.cep,
    this.cidade,
    this.estado,
    this.bairro,
    this.rua,
    this.numero,
    this.location,
    this.cnaeFiscal,
    this.capitalSocial,
    this.cnaeFiscalDesc,
    this.cnaeSecundarios,
    this.codigoMunicipal,
    this.codNatJuridica,
    this.complemento,
    this.dataExclusaoSimples,
    this.dataInicioAtividades,
    this.dataOpcaoSimples,
    this.dataSituacaoCadastral,
    this.dataSituacaoEspecial,
    this.dddPhone1,
    this.dddPhone2,
    this.descPorte,
    this.descSituacaoCadastral,
    this.descSubsidiaria,
    this.descTipoLogadouro,
    this.isMei,
    this.isSimples,
    this.porteDaEmpresa,
    this.quadSocietario,
    this.situacaoCadastral,
  });

   Empresa.completa({
    required this.cnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cep,
    required this.cidade,
    required this.estado,
    required this.bairro,
    required this.rua,
    required this.numero,
    required this.location,
    required this.cnaeFiscal,
    required this.capitalSocial,
    required this.cnaeFiscalDesc,
    required this.cnaeSecundarios,
    required this.codigoMunicipal,
    required this.codNatJuridica,
    required this.complemento,
    required this.dataExclusaoSimples,
    required this.dataInicioAtividades,
    required this.dataOpcaoSimples,
    required this.dataSituacaoCadastral,
    required this.dataSituacaoEspecial,
    required this.dddPhone1,
    required this.dddPhone2,
    required this.descPorte,
    required this.descSituacaoCadastral,
    required this.descSubsidiaria,
    required this.descTipoLogadouro,
    required this.isMei,
    required this.isSimples,
    required this.porteDaEmpresa,
    required this.quadSocietario,
    required this.situacaoCadastral,
  });


  static consultaCep(int cep, Empresa empresa) async {
    final cepAdd = await CepV2.searchCepV2(cep: cep);
    empresa.cep = cep.toString();
    empresa.cidade = cepAdd.city;
    empresa.estado = cepAdd.state;
    empresa.bairro = cepAdd.neighborhood;
    empresa.rua = cepAdd.street;
    empresa.location = cepAdd.location;
    return empresa;
  }

  static locationCep(String cep)async{
    final location = await CepV2.searchCepV2(cep: int.parse(cep));
    return location.location;
  }

  static Future<Map<String, dynamic>> fromCNPJ(String cnpj) async {
    final cnpjAdd = await Company.searchCnpj(cnpj: cnpj);

    if (cnpjAdd != null) {
      return {
        'cnpj': cnpj ?? "",
        'razaoSocial': cnpjAdd.socialReason,
        'nomeFantasia': cnpjAdd.tradingName,
        'cep': cnpjAdd.cep,
        'cidade': cnpjAdd.city,
        'estado': cnpjAdd.uf,
        'bairro': cnpjAdd.neighborhood,
        'rua': cnpjAdd.street,
        'numero': cnpjAdd.complement,
        'location': await locationCep(cnpjAdd.cep!),
        'cnaeFiscal': cnpjAdd.cnaeFiscal,
        'capitalSocial': cnpjAdd.capitalSocial,
        'cnaeFiscalDesc': cnpjAdd.cnaeFiscalDesc,
        'cnaeSecundarios': cnpjAdd.secondaryCnaes,
        'codigoMunicipal': cnpjAdd.cityCode,
        'codNatJuridica': cnpjAdd.juridicalNatureCode,
        'complemento': cnpjAdd.complement,
        'dataExclusaoSimples': cnpjAdd.dateExclusionSimples,
        'dataInicioAtividades': cnpjAdd.dateStartActivity,
        'dataOpcaoSimples': cnpjAdd.simpleOptionDate,
        'dataSituacaoCadastral': cnpjAdd.dateCadastralSituation,
        'dataSituacaoEspecial': cnpjAdd.dateSpecialSituation,
        'dddPhone1': cnpjAdd.dddPhone1,
        'dddPhone2': cnpjAdd.dddPhone2,
        'descPorte': cnpjAdd.descCompanySize,
        'descSituacaoCadastral': cnpjAdd.descriptionCadastralSituation,
        'descSubsidiaria': cnpjAdd.descriptionSubsidiary,
        'descTipoLogadouro': cnpjAdd.descStreetType,
        'isMei': cnpjAdd.optionMei,
        'isSimples': cnpjAdd.simpleOption,
        'porteDaEmpresa': cnpjAdd.companySize,
        'quadSocietario': cnpjAdd.qsa,
        'situacaoCadastral': cnpjAdd.cadastralSituation,
      };
    } else {
      return {}; // Retorna um mapa vazio em caso de erro
    }
  }

  static verificaPorte(String cnpj) async{
    String porte = "MICRO EMPRESA";
    final empresa = await Company.searchCnpj(cnpj: cnpj);
    if(empresa.companySize == "MICRO EMPRESA"){
      return porte = "ME";
    } else if(empresa.companySize == "EMPRESA DE PEQUENO PORTE"){
      return porte = "EPP";
    } else{
      return porte = "N";
    }
  }
}
