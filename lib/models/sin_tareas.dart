import 'package:flutter/material.dart';
import 'package:material/core/colores_app.dart';

/// Widget que se muestra cuando no hay tareas visibles en la lista.
///
/// Muestra un icono central y un mensaje invitando al usuario a crear una nueva tarea.
class SinTareas extends StatelessWidget {
  /// Mensaje principal a mostrar.
  final String? mensaje;

  /// Mensaje secundario a mostrar.
  final String? submensaje;

  /// Constructor constante de [SinTareas].
  const SinTareas({super.key, this.mensaje, this.submensaje});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: ColoresApp.primaryColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.checklist_rtl,
                size: 80,
                color: ColoresApp.primaryColor,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              mensaje ?? 'No Tienes Tareas Pendientes',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              submensaje ??
                  'Añade una nueva tarea para empezar a organizarte. ¡Pulsa el botón + para comenzar!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
