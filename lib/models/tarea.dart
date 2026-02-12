/// Modelo que representa una tarea individual en la lista de tareas.
///
/// Contiene la información esencial de la tarea como [titulo], [descripcion],
/// su estado [terminada] y su [categoria].
class Tarea {
  /// Crea una nueva instancia de [Tarea].
  ///
  /// El [id] se genera automáticamente basado en el timestamp actual.
  ///
  /// Requiere [titulo], [descripcion] y [terminada].
  /// [categoria] es opcional y por defecto es 'Otro'.
  Tarea({
    required this.titulo,
    required this.descripcion,
    required this.terminada,
    this.categoria = 'Otro',
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  /// Identificador único de la tarea.
  ///
  /// Se genera automáticamente al crear la instancia usando [DateTime.now].
  final String id;

  /// El título o nombre principal de la tarea.
  String titulo;

  /// Descripción detallada de la tarea.
  String descripcion;

  /// Indica si la tarea ha sido completada ([true]) o está pendiente ([false]).
  bool terminada;

  /// Categoría a la que pertenece la tarea (ej. 'Personal', 'Trabajo').
  String categoria;
}
