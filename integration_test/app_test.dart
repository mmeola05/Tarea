import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material/main.dart' as app;

/// Prueba de integración completa (E2E) para la aplicación de Tareas.
///
/// Simula un flujo de usuario completo:
/// 1. Inicia la app.
/// 2. Verifica estado inicial vacío.
/// 3. Crea una nueva tarea.
/// 4. Marca la tarea como terminada.
/// 5. Elimina la tarea.
/// 6. Verifica vuelta al estado inicial.
void main() {
  // 2. Inicialización
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Flujo completo: Crear, marcar como terminada y eliminar tarea', (
    WidgetTester tester,
  ) async {
    // 3. Inicio de la aplicación
    app.main();
    // 4. Esperar a que la aplicación se estabilice
    await tester.pumpAndSettle();

    // 5. Encontrar Widgets y Verificar estado inicial (sin tareas)
    expect(find.text('No Tienes Tareas Pendientes'), findsOneWidget);

    // 6. Interacción del usuario: Añadir una nueva tarea
    final Finder fab = find.byType(FloatingActionButton);
    await tester.tap(fab);
    await tester.pumpAndSettle();

    // Escribir título en el campo de texto
    await tester.enterText(
      find.byType(TextFormField).first,
      'Tarea Integración',
    );
    await tester.pumpAndSettle();

    // Pulsar botón de guardar
    await tester.tap(find.text('GUARDAR'));
    await tester.pumpAndSettle();

    // 7. Verificar estado final tras añadir (Tarea aparece)
    expect(find.text('Tarea Integración'), findsOneWidget);
    expect(find.text('No Tienes Tareas Pendientes'), findsNothing);

    // Interacción: Marcar como terminada
    final Finder checkbox = find.byType(Checkbox);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();

    // Verificar que el checkbox está marcado
    final widgetCheckbox = tester.widget<Checkbox>(checkbox);
    expect(widgetCheckbox.value, true);

    // Interacción: Eliminar la tarea
    final Finder iconoBorrar = find.byIcon(Icons.delete);
    await tester.tap(iconoBorrar);
    await tester.pumpAndSettle();

    // Si aparece diálogo de confirmación, confirmar
    if (find.text('Eliminar').evaluate().isNotEmpty) {
      await tester.tap(find.text('Eliminar'));
      await tester.pumpAndSettle();
    }

    // Verificar vuelta al estado inicial
    expect(find.text('No Tienes Tareas Pendientes'), findsOneWidget);
  });
}
