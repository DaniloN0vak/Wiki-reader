import 'dart:convert';
import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:http/http.dart';

import 'summary.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Wiki Flutt")),
        body: const Center(
          child: Text('Mogged....'),
        ),
      ),
    );
  }
}
