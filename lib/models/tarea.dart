class Tarea {
  Tarea({
    required this.titulo,
    required this.descripcion,
    required this.terminada,
    this.categoria = 'Otro',
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  final String id;
  String titulo;
  String descripcion;
  bool terminada;
  String categoria;
}
