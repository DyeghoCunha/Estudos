import '../model/tarefa.dart';

class TarefaRepository{
 final List<Tarefa> _tarefas =[];
  
  Future  adicionarTarefa(Tarefa tarefa)async{
    await Future.delayed(const Duration(seconds: 1));
   _tarefas.add(tarefa); 
  }
  
  void alterar(String id, bool concluido)async{
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.where((element)=> element.id==id).first.setConcluido(concluido);
  }

  Future <List<Tarefa>> listarTarefas()async{
   await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }
}