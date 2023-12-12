import 'package:flutter/material.dart';

import 'pages/HomePage.dart';
import 'pages/testeWidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSkin Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(36, 38, 47, 1),
        cardColor: Color.fromRGBO(56, 58, 71, 1.0),
        highlightColor: Color.fromRGBO(245, 132, 1, 1),
        colorScheme: const ColorScheme(
          primary: Color.fromRGBO(36, 38, 47, 1),
          secondary: Color.fromRGBO(245, 132, 1, 1), // Cor secundária
          surface: Color.fromRGBO(56, 58, 71, 1.0),
          background: Color.fromRGBO(56, 58, 71, 1.0),
          error: Colors.red,
          onPrimary: Color.fromRGBO(153, 153, 153, 1),
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        )
        //useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
