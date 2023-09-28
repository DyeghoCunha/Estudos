import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int,String> scripts = {
  1 : ''' CREATE TABLE faturamentoDozeMeses (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          Rbt12 TEXT,
          concluido INTEGER
          );'''
};

class SQLiteDatabase{

  static Database? db;

  Future<Database> obterDataBase() async{
    if(db == null){
      return await iniciarBancoDeDados();
    }else{
      return db!;
    }
  }

  Future <Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), "database.db"),
      version: scripts.length,
      onCreate: (Database db, int version) async{
        for(var i = 1; i<= scripts.length; i++){
          print(scripts[i]!);
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async{
        for(var i = oldVersion + 1; i <= scripts.length; i++){
          print(scripts[i]!);
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }
}