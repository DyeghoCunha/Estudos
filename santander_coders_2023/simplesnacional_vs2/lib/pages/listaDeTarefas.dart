import 'package:flutter/material.dart';

import '../model/tarefa.dart';
import '../repositories/tarefa_repository.dart';

class ListaDeTarefas extends StatefulWidget {
  const ListaDeTarefas({super.key});

  @override
  State<ListaDeTarefas> createState() => _ListaDeTarefasState();
}

class _ListaDeTarefasState extends State<ListaDeTarefas> {
  var tarefaRepository = TarefaRepository();
 var _tarefas = const <Tarefa>[];
  TextEditingController descricaoContoller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }
void obterTarefas()async{
    _tarefas = await tarefaRepository.listarTarefas();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoContoller.text = "";
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: descricaoContoller,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar")),
                    TextButton(
                        onPressed: ()async {
                         await tarefaRepository.adicionarTarefa(Tarefa(descricaoContoller.text, false));
                          Navigator.pop(context);
                          setState(() {
                          });
                        },
                        child: Text("Salvar"))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
       itemCount: _tarefas.length,
        itemBuilder: (BuildContext context,int index) {
         var tarefa = _tarefas[index];
         return ListTile(title: Text(tarefa.descricao),);
      },)
    );
  }
}
