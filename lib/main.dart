import 'package:flutter/material.dart';
import 'package:votacion/screen/contador.dart';
import 'package:votacion/screen/votacones.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        useMaterial3: true,
        colorSchemeSeed: Colors.blue ),
      home: const Votaciones(),
    );
  }
}
