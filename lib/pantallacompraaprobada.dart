import 'package:flutter/material.dart';
import 'package:proyectoapps/PantallaCarta.dart';

//clase panta de inicio
class Pantallacompraaprobada extends StatefulWidget {
  const Pantallacompraaprobada({Key? key}) : super(key: key);

  @override
  State<Pantallacompraaprobada> createState() => _PantallaAprodaState();
}

//clase de la pantalla incio
class _PantallaAprodaState extends State<Pantallacompraaprobada> {
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
              "assets/img/gracias.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   '¡Muchas gracias por tu compra!',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize:
                //         24, // ajusta el tamaño del texto según sea necesario
                //     fontWeight:
                //         FontWeight.bold, // opcional, según tus preferencias
                //   ),
                // ),
                SizedBox(
                    height:
                        180), // ajusta la separación entre el texto y el botón según sea necesario
                TextButton(
                  onPressed: () {
                    // evento al botón para volver a la pantalla de compras
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext) => PantallaCarta()));
                  },
                  child: Text(
                    'Seguir comprando',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(
                          17, 17, 17, 1), // Cambia aquí el color de fondo
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
