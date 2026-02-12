import 'package:flutter/material.dart';
import 'package:material/core/colores.dart';
import 'package:material/models/sin_tareas.dart';
import 'package:material/models/tarea.dart';
import 'package:material/models/tarjeta_tarea.dart';
import 'package:material/widgets/boton_color.dart';
import 'package:material/widgets/boton_modo.dart';
import 'package:material/widgets/formulario_tarea.dart';
import 'package:material/widgets/logo.dart';

/// Pantalla principal de la aplicación que muestra la lista de tareas.
///
/// Dispone de:
/// * Una lista de [TarjetaTarea] para visualizar tareas pendientes o terminadas.
/// * Un botón flotante [FloatingActionButton] para añadir nuevas tareas.
/// * Filtros por categoría y estado para organizar la visualización.
class PaginaPrincipal extends StatefulWidget {
  /// Callback para cambiar el modo de tema (Claro/Oscuro).
  final void Function(bool) cambiarModo;

  /// Callback para cambiar el color semilla del tema.
  final void Function(int) cambiarColor;

  /// El color actualmente seleccionado.
  final Colores colorElegido;

  /// Indica si el modo actual es "Día" (claro).
  final bool esDeDia;

  /// Constructor de la página principal.
  const PaginaPrincipal({
    super.key,
    required this.cambiarModo,
    required this.cambiarColor,
    required this.colorElegido,
    required this.esDeDia,
  });

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final List<Tarea> _tareas = [];

  String _categoriaFiltro = 'Todas';
  String _estadoFiltro = 'Todas';

  List<Tarea> get _tareasVisibles {
    return _tareas.where((t) {
      bool okCategoria =
          _categoriaFiltro == 'Todas' || t.categoria == _categoriaFiltro;

      bool okEstado = true;
      if (_estadoFiltro == 'Pendientes') okEstado = !t.terminada;
      if (_estadoFiltro == 'Terminadas') okEstado = t.terminada;

      return okCategoria && okEstado;
    }).toList();
  }

  void _abrirFormulario({Tarea? tarea}) async {
    final resultado = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FormularioTarea(tarea: tarea),
    );

    if (resultado == null) return;

    setState(() {
      if (tarea != null) {
        tarea.titulo = resultado['titulo'];
        tarea.descripcion = resultado['descripcion'];
        tarea.categoria = resultado['categoria'];
      } else {
        _tareas.add(
          Tarea(
            titulo: resultado['titulo'],
            descripcion: resultado['descripcion'],
            terminada: false,
            categoria: resultado['categoria'],
          ),
        );
      }
    });
  }

  void _borrarTarea(Tarea t) {
    final index = _tareas.indexOf(t);
    setState(() {
      _tareas.remove(t);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Tarea eliminada'),
        action: SnackBarAction(
          label: 'DESHACER',
          onPressed: () {
            setState(() {
              _tareas.insert(index, t);
            });
          },
        ),
      ),
    );
  }

  void _cambiarEstado(Tarea t) {
    setState(() {
      t.terminada = !t.terminada;
    });
  }

  void _reordenarTareas(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Tarea item = _tareas.removeAt(oldIndex);
      _tareas.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        centerTitle: true,
        actions: [
          BotonColor(
            cambiarColor: widget.cambiarColor,
            colorElegido: widget.colorElegido,
          ),
          BotonModo(cambiarModo: widget.cambiarModo, esDeDia: widget.esDeDia),
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Theme.of(
              context,
            ).colorScheme.surfaceVariant.withOpacity(0.3),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _categoriaFiltro,
                    decoration: const InputDecoration(labelText: 'Categoría'),
                    items: ['Todas', 'Personal', 'Trabajo', 'Otro'].map((cat) {
                      return DropdownMenuItem(value: cat, child: Text(cat));
                    }).toList(),
                    onChanged: (val) => setState(() => _categoriaFiltro = val!),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _estadoFiltro,
                    decoration: const InputDecoration(labelText: 'Estado'),
                    items: ['Todas', 'Pendientes', 'Terminadas'].map((est) {
                      return DropdownMenuItem(value: est, child: Text(est));
                    }).toList(),
                    onChanged: (val) => setState(() => _estadoFiltro = val!),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: _tareas.isEmpty
                ? const SinTareas()
                : _tareasVisibles.isEmpty
                ? const SinTareas(
                    mensaje: 'No hay tareas con estos filtros',
                    submensaje: 'Intenta cambiar la categoría o el estado',
                  )
                : _categoriaFiltro == 'Todas' && _estadoFiltro == 'Todas'
                ? ReorderableListView.builder(
                    itemCount: _tareasVisibles.length,
                    onReorder: _reordenarTareas,
                    itemBuilder: (context, index) {
                      final tarea = _tareasVisibles[index];
                      return Dismissible(
                        key: ValueKey(tarea.id),
                        background: Container(color: Colors.red),
                        onDismissed: (_) => _borrarTarea(tarea),
                        child: TarjetaTarea(
                          key: ValueKey(tarea.id),
                          tarea: tarea,
                          onEliminar: () => _borrarTarea(tarea),
                          onCambiarEstado: () => _cambiarEstado(tarea),
                          onEditar: () => _abrirFormulario(tarea: tarea),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: _tareasVisibles.length,
                    itemBuilder: (context, index) {
                      final tarea = _tareasVisibles[index];
                      return Dismissible(
                        key: ValueKey(tarea.id),
                        background: Container(color: Colors.red),
                        onDismissed: (_) => _borrarTarea(tarea),
                        child: TarjetaTarea(
                          tarea: tarea,
                          onEliminar: () => _borrarTarea(tarea),
                          onCambiarEstado: () => _cambiarEstado(tarea),
                          onEditar: () => _abrirFormulario(tarea: tarea),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _abrirFormulario(),
      ),
    );
  }
}
