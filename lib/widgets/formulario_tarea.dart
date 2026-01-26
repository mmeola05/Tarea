import 'package:flutter/material.dart';
import 'package:material/models/tarea.dart';

class FormularioTarea extends StatefulWidget {
  final Tarea? tarea;

  const FormularioTarea({super.key, this.tarea});

  @override
  State<FormularioTarea> createState() => _FormularioTareaState();
}

class _FormularioTareaState extends State<FormularioTarea> {
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();

  String _categoriaSeleccionada = 'Otro';

  final List<String> _categorias = ['Personal', 'Trabajo', 'Otro'];

  @override
  void initState() {
    super.initState();
    if (widget.tarea != null) {
      _tituloController.text = widget.tarea!.titulo;
      _descripcionController.text = widget.tarea!.descripcion;
      _categoriaSeleccionada = widget.tarea!.categoria;
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  void _guardar() {
    if (_tituloController.text.isEmpty) {
      return;
    }
    Navigator.pop(context, {
      'titulo': _tituloController.text,
      'descripcion': _descripcionController.text,
      'categoria': _categoriaSeleccionada,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24.0,
        right: 24.0,
        top: 24.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            widget.tarea == null ? 'Nueva Tarea' : 'Editar Tarea',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),

          TextField(
            controller: _tituloController,
            decoration: const InputDecoration(
              labelText: 'Título',
              hintText: 'Ej. Comprar pan',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title),
            ),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _descripcionController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
            ),
          ),
          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: _categoriaSeleccionada,
            decoration: const InputDecoration(
              labelText: 'Categoría',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.category),
            ),
            items: _categorias.map((String categoria) {
              return DropdownMenuItem<String>(
                value: categoria,
                child: Text(categoria),
              );
            }).toList(),
            onChanged: (valor) {
              setState(() {
                _categoriaSeleccionada = valor!;
              });
            },
          ),
          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: _guardar,
              child: const Text('GUARDAR'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
