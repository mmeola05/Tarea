import 'package:flutter/material.dart';
import 'package:material/core/colores.dart';

/// Widget que muestra un botón para seleccionar el color principal de la app.
///
/// Despliega un menú emergente con la lista de colores disponibles en [Colores].
class BotonColor extends StatelessWidget {
  const BotonColor({
    super.key,
    required this.cambiarColor,
    required this.colorElegido,
  });

  final void Function(int) cambiarColor;
  final Colores colorElegido;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.color_lens, color: colorElegido.color),
      onSelected: cambiarColor,
      itemBuilder: (context) {
        return List.generate(Colores.values.length, (index) {
          final color = Colores.values[index];
          return PopupMenuItem(
            value: index,
            child: Row(
              children: [
                Icon(Icons.circle, color: color.color),
                const SizedBox(width: 8),
                Text(color.nombre),
              ],
            ),
          );
        });
      },
    );
  }
}
