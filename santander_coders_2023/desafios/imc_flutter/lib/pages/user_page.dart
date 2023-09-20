import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoInicialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Colors.cyan,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 70,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: alturaController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.cyanAccent),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyanAccent,
                  ),
                ),
                hintText: "Qual a sua Altura em centimetros ?",
                label: Text(
                  "Altura",
                  style: TextStyle(
                    // color: Colors.teal,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: pesoInicialController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.cyanAccent),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyanAccent,
                  ),
                ),
                hintText: "Qual foi seu peso Inicial ?",
                label: Text(
                  "Peso Inicial",
                  style: TextStyle(
                    // color: Colors.teal,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  style: ListTileStyle.drawer,
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: Icon(Icons.list),
                  title: Text("Lista de Desejos"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent), borderRadius: BorderRadius.circular(8)),
                  subtitle: Text("Sua lista de metas !!"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
