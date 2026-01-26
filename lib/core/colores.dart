import 'package:flutter/material.dart';

enum Colores {
  purpuraOscuro('Púpura oscuro', Colors.deepPurple),
  purpuraClaro('Púpura claro', Colors.purple),
  azulOscuro('Azul oscuro', Colors.indigo),
  azulClaro('Azul claro', Colors.blue),
  verdeOscuro('Verde oscuro', Colors.green),
  verdeClaro('Verde claro', Colors.lightGreen),
  amarilloOscuro('Amarillo oscuro', Colors.amber),
  amarilloClaro('Amarillo claro', Colors.yellow),
  naranjaOscuro('Naranja oscuro', Colors.orange),
  naranjaClaro('Naranja claro', Colors.deepOrange),
  rojoOscuro('Rojo oscuro', Colors.red),
  rojoClaro('Rojo claro', Colors.pink),
  grisOscuro('Gris oscuro', Colors.grey),
  grisClaro('Gris claro', Colors.white);

  const Colores(this.nombre, this.color);
  final String nombre;
  final Color color;
}
