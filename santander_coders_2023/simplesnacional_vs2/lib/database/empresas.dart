import '../model/EmpresaModel.dart';

class EmpresaDb {

  List<Empresa> empresaListDb = [
    Empresa.completa(
      cnpj: "12345678901234",
      razaoSocial: "Minha Empresa Razão Social",
      nomeFantasia: "Fantasia da Minha Empresa",
      cep: "12345-678",
      cidade: "Minha Cidade",
      estado: "ME",
      bairro: "Meu Bairro",
      rua: "Minha Rua",
      numero: "123",
      location: {"latitude": 123.456, "longitude": 789.012},
      situacaoCadastral: 1,
      capitalSocial: 1000000,
      codigoMunicipal: 123456,
      cnaeFiscal: 987654,
      cnaeFiscalDesc: "Descrição do CNAE Fiscal",
      cnaeSecundarios: ["Secundário 1", "Secundário 2"],
      porteDaEmpresa: "MICRO EMPRESA",
      complemento: "Complemento do Endereço",
      dataSituacaoCadastral: "2023-10-23",
      dataExclusaoSimples: "2023-10-24",
      dataSituacaoEspecial: "2023-10-25",
      dataInicioAtividades: "2023-01-01",
      dddPhone1: "11",
      dddPhone2: "22",
      descPorte: "Descrição do Porte da Empresa",
      descSituacaoCadastral: "Descrição da Situação Cadastral",
      descSubsidiaria: "Descrição da Subsidiária",
      descTipoLogadouro: "Descrição do Tipo de Logradouro",
      codNatJuridica: 123,
      isMei: true,
      isSimples: true,
      dataOpcaoSimples: "2023-10-26",
      quadSocietario: ["Sócio 1", "Sócio 2"],
    ),
    Empresa(
      cnpj: "55555555555555",
      razaoSocial: "Empresa 5 Razão Social",
      nomeFantasia: "Tucanos Sa LTDA",
      cep: "55555-555",
      cidade: "Cidade 5",
      estado: "BA",
      bairro: "Bairro 5",
      rua: "Rua 5",
      numero: "505",
      location: {"latitude": 56.789, "longitude": 90.123},
      situacaoCadastral: 5,
      capitalSocial: 500000,
      codigoMunicipal: 56789,
      cnaeFiscal: 54321,
      cnaeFiscalDesc: "Descrição do CNAE 5",
      cnaeSecundarios: ["Secundário 5.1", "Secundário 5.2"],
      porteDaEmpresa: "EMPRESA DE PEQUENO PORTE",
      complemento: "Complemento 5",
      dataSituacaoCadastral: "2023-10-27",
      dataExclusaoSimples: "2023-10-28",
      dataSituacaoEspecial: "2023-10-29",
      dataInicioAtividades: "2023-05-01",
      dddPhone1: "15",
      dddPhone2: "56",
      descPorte: "Descrição do Porte 5",
      descSituacaoCadastral: "Descrição da Situação Cadastral 5",
      descSubsidiaria: "Descrição da Subsidiária 5",
      descTipoLogadouro: "Descrição do Tipo de Logradouro 5",
      codNatJuridica: 567,
      isMei: false,
      isSimples: true,
      dataOpcaoSimples: "2023-10-30",
      quadSocietario: ["Sócio 5.1", "Sócio 5.2"],
    ),
    Empresa(
      cnpj: "44444444444444",
      razaoSocial: "Empresa 4 Razão Social",
      nomeFantasia: "Cutucando até a Glória Church",
      cep: "44444-444",
      cidade: "Cidade 4",
      estado: "MG",
      bairro: "Bairro 4",
      rua: "Rua 4",
      numero: "404",
      location: {"latitude": 45.678, "longitude": 90.123},
      situacaoCadastral: 4,
      capitalSocial: 400000,
      codigoMunicipal: 45678,
      cnaeFiscal: 65432,
      cnaeFiscalDesc: "Descrição do CNAE 4",
      cnaeSecundarios: ["Secundário 4.1", "Secundário 4.2"],
      porteDaEmpresa: "MICRO EMPREENDEDOR INDIVIDUAL",
      complemento: "Complemento 4",
      dataSituacaoCadastral: "2023-10-26",
      dataExclusaoSimples: "2023-10-27",
      dataSituacaoEspecial: "2023-10-28",
      dataInicioAtividades: "2023-04-01",
      dddPhone1: "14",
      dddPhone2: "45",
      descPorte: "Descrição do Porte 4",
      descSituacaoCadastral: "Descrição da Situação Cadastral 4",
      descSubsidiaria: "Descrição da Subsidiária 4",
      descTipoLogadouro: "Descrição do Tipo de Logradouro 4",
      codNatJuridica: 456,
      isMei: true,
      isSimples: true,
      dataOpcaoSimples: "2023-10-29",
      quadSocietario: ["Sócio 4.1", "Sócio 4.2"],
    ),
    Empresa(
      cnpj: "33333333333333",
      razaoSocial: "Empresa 3 Razão Social",
      nomeFantasia: "Empresa 3 Nome Fantasia",
      cep: "33333-333",
      cidade: "Cidade 3",
      estado: "RJ",
      bairro: "Bairro 3",
      rua: "Rua 3",
      numero: "303",
      location: {"latitude": 34.567, "longitude": 89.012},
      situacaoCadastral: 3,
      capitalSocial: 300000,
      codigoMunicipal: 34567,
      cnaeFiscal: 76543,
      cnaeFiscalDesc: "Descrição do CNAE 3",
      cnaeSecundarios: ["Secundário 3.1", "Secundário 3.2"],
      porteDaEmpresa: "NORMAL",
      complemento: "Complemento 3",
      dataSituacaoCadastral: "2023-10-25",
      dataExclusaoSimples: "2023-10-26",
      dataSituacaoEspecial: "2023-10-27",
      dataInicioAtividades: "2023-03-01",
      dddPhone1: "13",
      dddPhone2: "34",
      descPorte: "Descrição do Porte 3",
      descSituacaoCadastral: "Descrição da Situação Cadastral 3",
      descSubsidiaria: "Descrição da Subsidiária 3",
      descTipoLogadouro: "Descrição do Tipo de Logradouro 3",
      codNatJuridica: 345,
      isMei: true,
      isSimples: false,
      dataOpcaoSimples: "2023-10-28",
      quadSocietario: ["Sócio 3.1", "Sócio 3.2"],
    ),
    Empresa(
      cnpj: "22222222222222",
      razaoSocial: "Empresa 2 Razão Social",
      nomeFantasia: "Empresa 2 Nome Fantasia",
      cep: "22222-222",
      cidade: "Cidade 2",
      estado: "SP",
      bairro: "Bairro 2",
      rua: "Rua 2",
      numero: "202",
      location: {"latitude": 23.456, "longitude": 78.901},
      situacaoCadastral: 2,
      capitalSocial: 200000,
      codigoMunicipal: 23456,
      cnaeFiscal: 87654,
      cnaeFiscalDesc: "Descrição do CNAE 2",
      cnaeSecundarios: ["Secundário 2.1", "Secundário 2.2"],
      porteDaEmpresa: "Média",
      complemento: "Complemento 2",
      dataSituacaoCadastral: "2023-10-24",
      dataExclusaoSimples: "2023-10-25",
      dataSituacaoEspecial: "2023-10-26",
      dataInicioAtividades: "2023-02-01",
      dddPhone1: "12",
      dddPhone2: "23",
      descPorte: "Descrição do Porte 2",
      descSituacaoCadastral: "Descrição da Situação Cadastral 2",
      descSubsidiaria: "Descrição da Subsidiária 2",
      descTipoLogadouro: "Descrição do Tipo de Logradouro 2",
      codNatJuridica: 234,
      isMei: false,
      isSimples: false,
      dataOpcaoSimples: "2023-10-27",
      quadSocietario: ["Sócio 2.1", "Sócio 2.2"],
    ),
    Empresa(
      cnpj: "11111111111111",
      razaoSocial: "Empresa 1 Razão Social",
      nomeFantasia: "Empresa 1 Nome Fantasia",
      cep: "11111-111",
      cidade: "Cidade 1",
      estado: "ES",
      bairro: "Bairro 1",
      rua: "Rua 1",
      numero: "101",
      location: {"latitude": 12.345, "longitude": 67.890},
      situacaoCadastral: 1,
      capitalSocial: 100000,
      codigoMunicipal: 12345,
      cnaeFiscal: 98765,
      cnaeFiscalDesc: "Descrição do CNAE 1",
      cnaeSecundarios: ["Secundário 1.1", "Secundário 1.2"],
      porteDaEmpresa: "MICRO EMPRESA",
      complemento: "Complemento 1",
      dataSituacaoCadastral: "2023-10-23",
      dataExclusaoSimples: "2023-10-24",
      dataSituacaoEspecial: "2023-10-25",
      dataInicioAtividades: "2023-01-01",
      dddPhone1: "11",
      dddPhone2: "22",
      descPorte: "Descrição do Porte 1",
      descSituacaoCadastral: "Descrição da Situação Cadastral 1",
      descSubsidiaria: "Descrição da Subsidiária 1",
      descTipoLogadouro: "Descrição do Tipo de Logradouro 1",
      codNatJuridica: 123,
      isMei: true,
      isSimples: true,
      dataOpcaoSimples: "2023-10-26",
      quadSocietario: ["Sócio 1.1", "Sócio 1.2"],
    )
  ];

  void addEmpresa (Empresa novaEmpresa){
    empresaListDb.add(novaEmpresa);
  }

  getEmpresaPorCNPJ(String cnpj){
   for(Empresa empresa in empresaListDb){
     if(empresa.cnpj==cnpj){
           return empresa;
     }
     return null;
   }
  }

}