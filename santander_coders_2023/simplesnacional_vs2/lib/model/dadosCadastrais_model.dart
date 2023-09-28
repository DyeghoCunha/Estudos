import 'package:hive/hive.dart';

part "dadosCadastrais_model.g.dart";

@HiveType(typeId: 0)
class DadosCadastraisModel extends HiveObject{

  @HiveField(0)
  String? nomeFantasia;
  @HiveField(1)
  String? cnpj;
  @HiveField(2)
  String? inscricaoEstadual;
  @HiveField(3)
  String? inscricaoMunicipal;
  @HiveField(4)
  DateTime? dataAbertura;

  @HiveField(5)
  String? cep;
  @HiveField(6)
  String? rua;
  @HiveField(7)
  String? numero;
  @HiveField(8)
  String? ramoAtividade;
  @HiveField(9)
  List<String> segmentoAtividade=[];

  @HiveField(10)
  String? anexoPrincipal;
  @HiveField(11)
  String? anexoSecundario;

  DadosCadastraisModel();

  DadosCadastraisModel.vazio(){
    nomeFantasia ="";
    cnpj = "";
    inscricaoEstadual = "";
    inscricaoMunicipal = "";
    dataAbertura = null;
    cep = "";
    rua = "";
    numero = "";
    ramoAtividade = "";
    segmentoAtividade = [];
    anexoPrincipal = "";
    anexoSecundario = "";
  }

}
