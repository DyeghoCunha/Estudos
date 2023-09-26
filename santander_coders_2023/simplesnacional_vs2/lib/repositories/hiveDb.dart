import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDb extends StatefulWidget {
   HiveDb({super.key});

  @override
  State<HiveDb> createState() => _HiveDbState();
}

class _HiveDbState extends State<HiveDb> {
 late Box boxFaturamentoDoze;
 var faturamentoAnual;
 var faturamentoMes;

   @override
   void initState() {
     super.initState();
     _carregarHive();
   }

  void _carregarHive()async{
    if(Hive.isBoxOpen("box_faturamentoDoze")){
      boxFaturamentoDoze = Hive.box("box_faturamentoDoze");
    }else {
      boxFaturamentoDoze = await Hive.openBox("box_faturamentoDoze");
    }
     faturamentoAnual =  boxFaturamentoDoze.get("faturamentoAnual");
    faturamentoMes =  boxFaturamentoDoze.get("faturamentoMes");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(faturamentoAnual[2022]!["Novembro"].toString()),
          Text(faturamentoMes.toString()),
        ],
      ),
    );
  }
}
