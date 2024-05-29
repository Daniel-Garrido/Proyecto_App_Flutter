//importamos las librerias
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoapps/PantallaCarrito.dart';
import 'package:proyectoapps/PantallaInicio.dart';
import 'package:proyectoapps/carrito/Carrito.dart';
import 'carrito/Carta.dart'; // importar los datos de la clase

class PantallaCarta extends StatefulWidget {
  const PantallaCarta({Key? key}) : super(key: key);

  @override
  State<PantallaCarta> createState() => _PantallaCartaState();
}

class _PantallaCartaState extends State<PantallaCarta> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return DefaultTabController(
        length: 3, //divide en 3 secciones
        child: Scaffold(
          key: _globalKey,

          backgroundColor: Colors.white, //fondo de la seccion

          //seccion header

          appBar: AppBar(
            //titulo de la seccion de productos
            title: Text("Productos"),
            backgroundColor: Colors.white,
            elevation: 0,

            bottom: const TabBar(
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Dama"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Caballero"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("niño"),
                  ),
                )
              ],
            ),

            actions: <Widget>[
              Stack(
                children: <Widget>[
                  //btn carrito de compras
                  IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        carrito.numeroItems !=
                                0 // si en el carrito no hay nada manda mensaje
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext) => PantallaCarrito()))
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                content: Text(
                                    "Llenar el carrito"), // mensaje de error ,
                              ));
                      }),
                  //posision del btn carrito
                  Positioned(
                      top: 6,
                      right: 6,
                      //contenedor del icono de cantidad de productos
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4)),
                        constraints:
                            const BoxConstraints(minWidth: 14, minHeight: 14),
                        child: Text(
                          carrito.numeroItems.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ))
                ],
              )
            ],
          ),

          //diseño del navbar
          drawer: menuLateral(),
          body: TabBarView(
            //contenido de las secciones de la pantalla productos
            //- dama
            //caballero
            //niño

            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: damas.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.15),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/img/${damas[index].imagen}",
                              width:
                                  100, // Ajusta el ancho de la imagen según tus necesidades
                              height: 100,
                              fit: BoxFit
                                  .cover, // Ajusta la altura de la imagen según tus necesidades
                            ),
                            Text(
                              damas[index].nombre!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                " " + damas[index].precio.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  carrito.agregarItem(
                                      damas[index].id.toString(),
                                      damas[index].nombre!,
                                      damas[index].precio!,
                                      "1",
                                      damas[index].imagen!,
                                      1);
                                });
                              },
                              label: Text('Agregar'), //texto del icono
                              icon: Icon(
                                  Icons.add_shopping_cart), //icono de carrito
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: caballeros.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.15),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/img/${caballeros[index].imagen}",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              caballeros[index].nombre!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "S ${caballeros[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItem(
                                        caballeros[index].id.toString(),
                                        caballeros[index].nombre!,
                                        caballeros[index].precio!,
                                        "1",
                                        caballeros[index].imagen!,
                                        1);
                                  });
                                },
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text("Agregar"))
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: ninios.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.15),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/img/${ninios[index].imagen}",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              ninios[index].nombre!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                " ${ninios[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItem(
                                        ninios[index].id.toString(),
                                        ninios[index].nombre!,
                                        ninios[index].precio!,
                                        "1",
                                        ninios[index].imagen!,
                                        1);
                                  });
                                },
                                //btn agregar  al carrito
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text("Agregar"))
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}

//menu  de navegacion
class menuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Perfumería Merida"),
            decoration: BoxDecoration(color: Color.fromRGBO(17, 17, 17, 1)),
            accountEmail: null,
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "Inicio",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => PantallaInicio()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "Ver carrito",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
