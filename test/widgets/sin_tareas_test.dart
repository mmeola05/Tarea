import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material/models/sin_tareas.dart';

void main() {
  /// Pruebas de widget para el componente [SinTareas].
  ///
  /// Verifica que se muestren correctamente los elementos visuales
  /// (icono y textos) cuando no hay tareas.
  testWidgets('SinTareas muestra icono y textos correctos', (
    WidgetTester tester,
  ) async {
    // Construir la app y renderizar el frame.
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: SinTareas())),
    );

    // Verificar que el icono se muestra.
    expect(find.byIcon(Icons.checklist_rtl), findsOneWidget);

    // Verificar que el texto 'No Tienes Tareas Pendientes' se muestra.
    expect(find.text('No Tienes Tareas Pendientes'), findsOneWidget);

    // Verificar que la descripción se muestra.
    expect(find.textContaining('Añade una nueva tarea'), findsOneWidget);
  });

  testWidgets('SinTareas muestra mensajes personalizados', (
    WidgetTester tester,
  ) async {
    const mensaje = 'Mensaje Personalizado';
    const submensaje = 'Submensaje de prueba';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SinTareas(mensaje: mensaje, submensaje: submensaje),
        ),
      ),
    );

    expect(find.text(mensaje), findsOneWidget);
    expect(find.text(submensaje), findsOneWidget);
  });
}
