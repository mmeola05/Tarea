import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material/models/tarea.dart';
import 'package:material/models/tarjeta_tarea.dart';

void main() {
  /// Grupo de pruebas para el widget [TarjetaTarea].
  ///
  /// Verifica la correcta visualización de la información de la tarea,
  /// el comportamiento del checkbox y los callbacks de interacción.
  group('TarjetaTarea Widget Tests', () {
    testWidgets('Debe mostrar el título, descripción y categoría de la tarea', (
      WidgetTester tester,
    ) async {
      // Arrange
      final tarea = Tarea(
        titulo: 'Comprar leche',
        descripcion: 'Desnatada',
        categoria: 'Compras',
        terminada: false,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TarjetaTarea(
              tarea: tarea,
              onEliminar: () {},
              onCambiarEstado: () {},
              onEditar: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Comprar leche'), findsOneWidget);
      expect(find.text('Desnatada'), findsOneWidget);
      expect(find.text('Compras'), findsOneWidget);
    });

    testWidgets('Debe mostrar el checkbox marcado si la tarea está terminada', (
      WidgetTester tester,
    ) async {
      // Arrange
      final tarea = Tarea(
        titulo: 'Tarea terminada',
        descripcion: '...',
        terminada: true,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TarjetaTarea(
              tarea: tarea,
              onEliminar: () {},
              onCambiarEstado: () {},
              onEditar: () {},
            ),
          ),
        ),
      );

      // Assert
      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, true);
    });

    testWidgets('Debe ejecutar callback al pulsar el checkbox', (
      WidgetTester tester,
    ) async {
      // Arrange
      bool callbackEjecutado = false;
      final tarea = Tarea(
        titulo: 'Tarea test',
        descripcion: '...',
        terminada: false,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TarjetaTarea(
              tarea: tarea,
              onEliminar: () {},
              onCambiarEstado: () {
                callbackEjecutado = true;
              },
              onEditar: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));

      // Assert
      expect(callbackEjecutado, true);
    });
  });
}
