import 'package:flutter/material.dart';

/// Widget que muestra un botón para alternar entre modo claro y oscuro.
class BotonModo extends StatelessWidget {
  const BotonModo({
    super.key,
    required this.cambiarModo,
    required this.esDeDia,
  });

  final void Function(bool) cambiarModo;
  final bool esDeDia;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(esDeDia ? Icons.dark_mode : Icons.light_mode),
      tooltip: esDeDia ? 'Cambiar a modo oscuro' : 'Cambiar a modo claro',
      onPressed: () => cambiarModo(!esDeDia),
    );
  }
}
