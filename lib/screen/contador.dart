import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {

  int contador = 0;
  String mensaje = 'Clicks' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text(
          'Contador',
          style: TextStyle(
              color: Color.fromRGBO(0, 26, 78, 1),
              fontSize: 30,
              fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(icon: const  Icon(  Icons.refresh_rounded ),
          onPressed: () {
            
            contador = 0;
            setState(() {
              
            });
          },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$contador', 
            style: const TextStyle(
              fontSize: 100)),
           Text(
            contador == 1? "Click": " Clicks" ,
            style: const TextStyle(
              color: Color.fromRGBO(0, 26, 78, 1), fontSize: 30),
          )
        ],
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              contador++;
              print("Si le diste");
              setState(() {});
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              // if (contador == 1) mensaje == "Click";
              if (contador > 0) {
                contador--;
                print("Si le diste");
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}
