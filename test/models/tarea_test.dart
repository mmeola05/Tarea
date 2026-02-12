import 'package:flutter_test/flutter_test.dart';
import 'package:material/models/tarea.dart';

void main() {
  group('Modelo Tarea', () {
    test('Debe crear una tarea con los valores proporcionados', () {
      // Arrange
      String titulo = 'Comprar pan';
      String descripcion = 'Ir a la panadería';
      bool terminada = false;
      String categoria = 'Hogar';

      // Act
      final tarea = Tarea(
        titulo: titulo,
        descripcion: descripcion,
        terminada: terminada,
        categoria: categoria,
      );

      // Assert
      expect(tarea.titulo, titulo);
      expect(tarea.descripcion, descripcion);
      expect(tarea.terminada, terminada);
      expect(tarea.categoria, categoria);
      expect(tarea.id, isNotNull);
      expect(tarea.id, isNotEmpty);
    });

    test(
      'Debe tener valor por defecto "Otro" en categoría si no se proporciona',
      () {
        // Arrange
        String titulo = 'Estudiar';
        String descripcion = 'Repasar Flutter';
        bool terminada = true;

        // Act
        final tarea = Tarea(
          titulo: titulo,
          descripcion: descripcion,
          terminada: terminada,
        );

        // Assert
        expect(tarea.categoria, 'Otro');
      },
    );

    test('Debe poder modificar el estado de terminada', () {
      // Arrange
      final tarea = Tarea(
        titulo: 'Entrenar',
        descripcion: 'Gimnasio',
        terminada: false,
      );

      // Act
      tarea.terminada = true;

      // Assert
      expect(tarea.terminada, true);
    });
  });
}
