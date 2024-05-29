import 'package:flutter/material.dart';
import 'package:proyectoapps/PantallaCarta.dart';

//clase panta de inicio
class PantallaInicio extends StatefulWidget {
  const PantallaInicio({Key? key}) : super(key: key);

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

//clase de la pantalla incio
class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 17, 17, 17), //color de fondo de la pantalla de inicio
      body: Stack(
        //estilo al cuerpo del la pantalla de inicio
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/img/fondo1.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                //evento al boton para mandar a la pantalla compra realizada
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext) => PantallaCarta()));
              },

              //revisar
              child: Text(
                'Acceder',
                style: TextStyle(color: Colors.white),
              ),

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(
                      17, 17, 17, 1), // Cambia aquí el color de fondo
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
