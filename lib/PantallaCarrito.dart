//librerias
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoapps/carrito/Carrito.dart';

import 'package:proyectoapps/pantallacompraaprobada.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({Key? key}) : super(key: key);

  @override
  State<PantallaCarrito> createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        //seccion del carrito de compras
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Carrito de compras"),
          elevation: 0, //inicializar con cero
          backgroundColor: Colors.white,
        ),

        //contenedor del carrito de compras
        body: Container(
            child: carrito.items.isEmpty
                ? const Center(
                    child: Text("Carrito Vacio"),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (var item in carrito.items.values)
                        Card(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //contenido del producto
                              children: <Widget>[
                                Image.asset(
                                  "assets/img/${item.imagen}",
                                  width: 70,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      //precio del producto
                                      children: <Widget>[
                                        Text(item.nombre!),
                                        Text(
                                            " ${item.precio} x ${item.unidad}"),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            //btn -
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 13,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  // btn eliminar producto
                                                  setState(() {
                                                    carrito
                                                        .decrementarCantidadItem(
                                                            item.id!);
                                                  });
                                                },
                                              ),
                                              width: 50,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                            ),
                                            Container(
                                              width: 20,
                                              child: Center(
                                                child: Text(
                                                    item.cantidad.toString()),
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 13,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  //btn aumentar producto
                                                  setState(() {
                                                    carrito
                                                        .incrementarCantidadItem(
                                                            item.id!);
                                                  });
                                                },
                                              ),
                                              width: 50,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                //contenedor del precio del producto
                                Container(
                                  height: 100,
                                  width: 70,
                                  decoration:
                                      BoxDecoration(color: Color(0x99f0f0f0)),
                                  child: Center(
                                    child: Text(
                                        " ${item.precio! * item.cantidad!}"),
                                  ),
                                )
                              ],
                            )),

                      //seccion del subtototal
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                              child: Text("Subtotal:"),
                            ),
                            Text(" ${carrito.subTotal.toStringAsFixed(2)}"),
                          ],
                        ),
                      ),
                      //seccion del iva
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                              child: Text("Iva:"),
                            ),
                            Text(" ${carrito.impuesto.toStringAsFixed(2)}"),
                          ],
                        ),
                      ),

                      //seccion del precio total de los productos
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                              child: Text("Total:"),
                            ),
                            Text(" ${carrito.total.toStringAsFixed(2)}"),
                          ],
                        ),
                      ),

                      // Botón para redirigir a otra sección
                      TextButton(
                        onPressed: () {
                          // Evento al presionar el botón para navegar a otra sección
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext) =>
                                  Pantallacompraaprobada(),
                            ),
                          );
                        },
                        child: Text(
                          'Comprar',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors
                                .blue, // Cambia aquí el color de fondo del botón
                          ),
                        ),
                      ),
                    ],
                  )),
      );
    });
  }
}
