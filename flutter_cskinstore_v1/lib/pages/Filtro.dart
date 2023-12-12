import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/FiltroCor.dart';
import 'package:flutter_cskinstore_v1/widget/filtroAdesivadas.dart';
import 'package:flutter_cskinstore_v1/widget/filtroCategoria.dart';
import 'package:flutter_cskinstore_v1/widget/filtroCustom.dart';
import 'package:flutter_cskinstore_v1/widget/filtroDesgaste.dart';
import 'package:flutter_cskinstore_v1/widget/filtroEntrega.dart';
import 'package:flutter_cskinstore_v1/widget/filtroPreco.dart';

class Filtro extends StatefulWidget {
  const Filtro({Key? key}) : super(key: key);

  @override
  State<Filtro> createState() => _FiltroState();
}

class _FiltroState extends State<Filtro> {
  bool isPreco = false;
  bool isEntrega = false;
  bool isCor = false;
  bool isDesgaste = false;
  bool isCategoria = false;
  bool isAdesivada = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Filtro'),
              ),
            ];
          },
          body: ListView(
            children: [
              FiltroCustom(widget: FiltroPreco(), parametro: isPreco, titulo: "Preço"),
              FiltroCustom(widget: FiltroEntrega(), parametro: isEntrega, titulo: "TradeLock"),
              FiltroCustom(widget: FiltroCor(), parametro: isCor, titulo: "Cores"),
              FiltroCustom(widget: FiltroDesgaste(), parametro: isDesgaste, titulo: "Desgaste"),
              FiltroCustom(widget: FiltroCategoria(), parametro: isCategoria, titulo: "Categoria"),
              FiltroCustom(widget: FiltroAdesivadas(), parametro: isAdesivada, titulo: "Extras"),
              SizedBox(
                width: 30,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Image.asset("assets/images/CSkin_Ok.png") ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        );
      },
    );
  }
}