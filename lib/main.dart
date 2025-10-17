import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange[600]),
      home: Scaffold(
        appBar: AppBar(title: Text("Filmes para o Halloween <3")),
        body: Center(child: Text("Filmes que combinam com o Dia das Bruxas!"))
      ),
    );
  }
}
