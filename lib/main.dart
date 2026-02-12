import 'package:flutter/material.dart';
import 'package:material/core/colores.dart';
import 'package:material/screens/pagina_principal.dart';

void main() {
  runApp(const Decategoria(title: 'deCategoria'));
}

/// Widget raíz de la aplicación.
///
/// Gestiona el tema global ([ThemeMode]) y el color semilla de la aplicación.
/// Mantiene el estado del modo (claro/oscuro) y el color seleccionado.
class Decategoria extends StatefulWidget {
  /// Título de la aplicación.
  const Decategoria({super.key, this.title = 'deCategoria'});

  /// El título que se mostrará (aunque no se usa directamente en AppBar aquí).
  final String title;

  @override
  State<Decategoria> createState() => _DecategoriaState();
}

class _DecategoriaState extends State<Decategoria> {
  // Modo del tema actual (claro/oscuro)
  ThemeMode _modoTema = ThemeMode.light;
  Colores _colorElegido = Colores.rojoClaro;

  void cambiarModo(bool esDeDia) {
    setState(() {
      _modoTema = esDeDia ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void cambiarColor(int indice) {
    setState(() {
      _colorElegido = Colores.values[indice];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'deCategoria',
      debugShowCheckedModeBanner: false,
      themeMode: _modoTema,
      theme: ThemeData(
        colorSchemeSeed: _colorElegido.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: _colorElegido.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: PaginaPrincipal(
        cambiarColor: cambiarColor,
        cambiarModo: cambiarModo,
        colorElegido: _colorElegido,
        esDeDia: _modoTema == ThemeMode.light,
      ),
    );
  }
}
