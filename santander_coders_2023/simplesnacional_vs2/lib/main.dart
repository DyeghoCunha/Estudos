import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/themes/my_theme.dart';
import 'model/dadosCadastrais_model.dart';
import 'pages/login_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';



void main() async {
  //Hive
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  // - - - -
  //SQFlite
  Intl.defaultLocale = 'en_US';

  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:MyTheme,
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
