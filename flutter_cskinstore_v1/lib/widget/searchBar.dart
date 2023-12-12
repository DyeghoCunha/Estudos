import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({super.key});

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.background,
          labelText: 'Encontre sua Skin',
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)),
          focusColor: Theme.of(context).colorScheme.secondary,
          floatingLabelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          hintText: 'Digite o nome da sua Skin',
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          border: OutlineInputBorder(),
        ),
        onChanged: (text) {},
      ),
    );
  }

  @override
  void dispose() {
    // Certifique-se de descartar o controlador quando não for mais necessário para evitar vazamentos de memória.
    _searchController.dispose();
    super.dispose();
  }
}
