import 'package:flutter/material.dart';
import 'package:material/core/colores.dart';
import 'package:material/screens/pagina_principal.dart';

void main() {
  runApp(const Decategoria(title: 'deCategoria'));
}

class Decategoria extends StatefulWidget {
  const Decategoria({super.key, this.title = 'deCategoria'});
  final String title;

  @override
  State<Decategoria> createState() => _DecategoriaState();
}

class _DecategoriaState extends State<Decategoria> {
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
