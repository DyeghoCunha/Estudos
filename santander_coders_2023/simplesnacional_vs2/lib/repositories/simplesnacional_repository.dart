import 'package:simplesnacional_vs2/model/simplesNacional_model.dart';
import '../database/database.dart';

class SimplesNacionalRepository{

  Future<List<SimplesNacionalModel>> obterDados()async{
    List<SimplesNacionalModel> faturamentoDozeMeses = [];
    var db = await SQLiteDatabase().obterDataBase();
   var result = await db.rawQuery("SELECT id, Rbt12, concluido FROM FaturamentoDozeMeses");
   for(var element in result){

   }
    return faturamentoDozeMeses;
  }
}