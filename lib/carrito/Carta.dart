//clase carta
//se agregan los datos los productos de la pantalla carta

class Carta {
  final int? id;
  final String? nombre;
  final double? precio;
  final String? imagen;
  final String? descripcion;
  const Carta(
      {this.id, this.nombre, this.precio, this.imagen, this.descripcion});
}

//productos damas
final damas = [
  const Carta(
      id: 1,
      nombre: "perfume dama ",
      precio: 100.00,
      imagen: "perfume8.jpg",
      descripcion: " "),
  const Carta(
      id: 2,
      nombre: "perfume dama ",
      precio: 100.00,
      imagen: "perfume7.jpg",
      descripcion: " "),
  const Carta(
      id: 3,
      nombre: "perfume dama",
      precio: 100.00,
      imagen: "perfume6.jpg",
      descripcion: ""),
  const Carta(
      id: 4,
      nombre: "perfume dama",
      precio: 100.00,
      imagen: "perfume5.jpg",
      descripcion: ""),
];

//productos caballeros
final caballeros = [
  const Carta(
      id: 5,
      nombre: "perfume caballero",
      precio: 100.00,
      imagen: "perfume4.jpg",
      descripcion: ""),
  const Carta(
      id: 6,
      nombre: "perfume caballero",
      precio: 100.00,
      imagen: "perfume2.jpg",
      descripcion: ""),
  const Carta(
      id: 7,
      nombre: "perfume caballero",
      precio: 100.00,
      imagen: "perfume3.jpg",
      descripcion: ""),
];

final ninios = [
  const Carta(
      id: 8,
      nombre: "perfume niños",
      precio: 100.00,
      imagen: "perfume4.jpg",
      descripcion: ""),
  const Carta(
      id: 9,
      nombre: "perfume niños",
      precio: 100.00,
      imagen: "perfume3.jpg",
      descripcion: ""),
  const Carta(
      id: 10,
      nombre: "perfume niños ",
      precio: 100.00,
      imagen: "perfume5.jpg",
      descripcion: "")
];
