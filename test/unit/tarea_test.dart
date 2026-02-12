import 'package:flutter_test/flutter_test.dart';
import 'package:material/models/tarea.dart';

void main() {
  /// Pruebas unitarias para el modelo [Tarea].
  ///
  /// Verifica la creación, valores por defecto y modificación de tareas.
  group('Tarea Model Tests', () {
    test('Debe crear una tarea con los valores proporcionados', () {
      final tarea = Tarea(
        titulo: 'Titulo Test',
        descripcion: 'Descripcion Test',
        terminada: true,
        categoria: 'Trabajo',
      );

      expect(tarea.titulo, 'Titulo Test');
      expect(tarea.descripcion, 'Descripcion Test');
      expect(tarea.terminada, true);
      expect(tarea.categoria, 'Trabajo');
      expect(tarea.id, isNotNull);
      expect(tarea.id, isNotEmpty);
    });

    test('Debe asignar valores por defecto correctamente', () {
      final tarea = Tarea(
        titulo: 'Titulo Defecto',
        descripcion: 'Descripcion Defecto',
        terminada: false,
      );

      expect(tarea.categoria, 'Otro');
      expect(tarea.terminada, false);
    });

    test('Debe permitir modificar sus propiedades', () {
      final tarea = Tarea(
        titulo: 'Inicial',
        descripcion: 'Inicial',
        terminada: false,
      );

      tarea.titulo = 'Modificado';
      tarea.terminada = true;

      expect(tarea.titulo, 'Modificado');
      expect(tarea.terminada, true);
    });
  });
}
