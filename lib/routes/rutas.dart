import 'package:flutter/material.dart';
import 'package:material/screens/pagina_principal.dart';

class Rutas {
  static const String paginaPrincipal = '/';

  static Route<dynamic> generarRuta(RouteSettings ajustes) {
    switch (ajustes.name) {
      // case paginaPrincipal:
      // return MaterialPageRoute(builder: (context) => const PaginaPrincipal());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Error: ruta no encontrada")),
          ),
        );
    }
  }
}
