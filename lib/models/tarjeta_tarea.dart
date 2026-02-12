import 'package:flutter/material.dart';
import 'package:material/core/colores_app.dart';
import 'package:material/models/tarea.dart';

/// Widget que muestra la información de una [Tarea] en una tarjeta.
///
/// Permite interactuar con la tarea: marcarla como completada, eliminarla o editarla.
class TarjetaTarea extends StatelessWidget {
  /// Crea una tarjeta para mostrar una [tarea].
  const TarjetaTarea({
    super.key,
    required this.tarea,
    required this.onEliminar,
    required this.onCambiarEstado,
    required this.onEditar,
  });

  /// La tarea que se va a mostrar.
  final Tarea tarea;

  /// Callback que se ejecuta al pulsar el botón de eliminar.
  final VoidCallback onEliminar;

  /// Callback que se ejecuta al cambiar el estado del checkbox.
  final VoidCallback onCambiarEstado;

  /// Callback que se ejecuta al pulsar el botón de editar.
  final VoidCallback onEditar;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      color: tarea.terminada
          ? colors.surface.withOpacity(0.5)
          : colors.surfaceVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: colors.outline.withOpacity(0.3)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        leading: Checkbox(
          value: tarea.terminada,
          onChanged: (value) => onCambiarEstado(),
          activeColor: colors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        title: Text(
          tarea.titulo,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: tarea.terminada
                ? colors.onSurface.withOpacity(0.5)
                : colors.onSurface,
            decoration: tarea.terminada ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tarea.descripcion.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  tarea.descripcion,
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  tarea.categoria,
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!tarea.terminada)
              IconButton(
                icon: Icon(Icons.edit, color: colors.primary),
                onPressed: onEditar,
                tooltip: 'Editar',
              ),
            IconButton(
              icon: Icon(Icons.delete, color: colors.error),
              onPressed: onEliminar,
              tooltip: 'Eliminar',
            ),
          ],
        ),
      ),
    );
  }
}
