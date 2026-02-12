import 'package:flutter/material.dart';
import 'package:material/screens/pagina_principal.dart';

/// Clase utilitaria para la gestión de rutas de navegación.
class Rutas {
  /// Ruta principal de la aplicación.
  static const String paginaPrincipal = '/';

  /// Generador de rutas dinámicas basado en [ajustes].
  ///
  /// Retorna la página correspondiente o una página de error si la ruta no existe.
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
