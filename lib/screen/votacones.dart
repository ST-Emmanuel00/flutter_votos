import 'package:flutter/material.dart';

class Votaciones extends StatefulWidget {
  const Votaciones({super.key});

  @override
  State<Votaciones> createState() => _VotacionesState();
}

class _VotacionesState extends State<Votaciones> {
  int izquierda = 0;
  int derecha = 0;
  int centro = 0;

  int total = 0;
  String mensaje = "";

  String Ganador() {
    List<int> totales = [izquierda, derecha, centro];
    int maximo =
        totales.reduce((max, elemento) => max > elemento ? max : elemento);
    // if (centro == derecha || centro == izquierda || derecha == izquierda) mensaje = "segunda vuelta";
    if (maximo == izquierda)
      mensaje = "Izquierda";
    else if (maximo == centro)
      mensaje = "Centro";
    else if (maximo == derecha) mensaje = "Derecha";

    return mensaje;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Votaciones",
          style: TextStyle(color: Color.fromRGBO(0, 26, 78, 1)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              izquierda = 0;
              centro = 0;
              derecha = 0;
              total = 0;
              mensaje = "";
              setState(() {});
            },
          )
        ],
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '$izquierda',
                style: const TextStyle(
                    fontSize: 100,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w100),
              ),
              Text(
                '$centro',
                style: const TextStyle(
                    fontSize: 100,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w100),
              ),
              Text(
                '$derecha',
                style: const TextStyle(
                    fontSize: 100,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Izquierda",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(78, 26, 0, 1),
                ),
              ),
              Text(
                "Centro",
                style:
                    TextStyle(fontSize: 20, color: Color.fromRGBO(0, 78, 0, 1)),
              ),
              Text(
                "Derrecha",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(0, 26, 78, 1)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              vote_agregator(
                icono: Icons.add,
                colorcito: const Color.fromRGBO(255, 100, 100, 1),
                funcion: () {
                  print("Izquierda");
                  izquierda++;
                  total++;
                  mensaje = Ganador();

                  setState(() {});
                },
              ),
              vote_agregator(
                icono: Icons.add,
                colorcito: const Color.fromRGBO(100, 255, 100, 1),
                funcion: () {
                  print("Centro");
                  centro++;
                  total++;
                  mensaje = Ganador();

                  setState(() {});
                },
              ),
              vote_agregator(
                icono: Icons.add,
                colorcito: const Color.fromRGBO(100, 100, 255, 1),
                funcion: () {
                  print("Derecha");
                  derecha++;
                  total++;
                  mensaje = Ganador();

                  setState(() {});
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Votos totales: $total',
                style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 20,
                ),
              ),
              Text(
                'Ganador: $mensaje ',
                style: const TextStyle(
                  color: Color.fromRGBO(166, 156, 156, 0.498),
                  fontSize: 20,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

// ignore: camel_case_types
class vote_agregator extends StatelessWidget {
  final IconData icono;
  final Color colorcito;
  final VoidCallback? funcion;

  const vote_agregator({
    super.key,
    required this.icono,
    required this.colorcito,
    this.funcion,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: colorcito,
        child: Icon(icono),
        onPressed: funcion );
  }
}
