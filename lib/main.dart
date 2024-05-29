//librerias usadas en el proyecto
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoapps/PantallaInicio.dart';
import 'package:proyectoapps/carrito/Carrito.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => Carrito(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto final Aplicaciones moviles',
      debugShowCheckedModeBanner: false, //remover la marca de agua
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PantallaInicio(), // nos redirige a la paginad de inicio
    );
  }
}

//Proyecto desarrollado por D aniel Garrido 