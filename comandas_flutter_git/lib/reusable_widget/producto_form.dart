import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ProductoFormWidget extends StatelessWidget {
  final String nombre;
  final String costo;
  final String entrada;
  final String salida;
  //final String existencia;
  // final String id;
  final ValueChanged<String> onChangedNombre;
  final ValueChanged<String> onChangedCosto;
  final ValueChanged<String> onChangedEntrada;
  final ValueChanged<String> onChangedSalida;
  //final ValueChanged<String> onChangedId;
  //final ValueChanged<String> onChangedExistencia;
  final VoidCallback onGuardarProducto;

  const ProductoFormWidget(
      {this.nombre = '',
      this.costo = '',
      this.entrada = '',
      this.salida = '',
      // this.existencia = '',
      //this.id = '',
      required this.onChangedNombre,
      required this.onChangedCosto,
      required this.onChangedEntrada,
      required this.onChangedSalida,
      //required this.onChangedExistencia,
      required this.onGuardarProducto,
      //required this.onChangedId,
      super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Titulo articulo
            TextFormField(
              maxLines: 1,
              initialValue: nombre,
              onChanged: onChangedNombre,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El nombre no puede quedar vacio';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 16),
            //Costo
            TextFormField(
              maxLines: 1,
              initialValue: costo,
              onChanged: onChangedCosto,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El costo no puede quedar vacio';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Costo',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 1,
              initialValue: entrada,
              onChanged: onChangedEntrada,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El nombre no puede quedar vacio';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Entrada de unidades',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 1,
              initialValue: salida,
              onChanged: onChangedSalida,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El nombre no puede quedar vacio';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Salida de unidades',
              ),
            ),

            //No se muestra el campo pero debe mostrarse como un nuevo campo de la entrada de unidades
            //Cambio pendiente
            //buildExistencia(),
            const SizedBox(height: 16),
            buildGuardarProductoButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: nombre,
        onChanged: onChangedNombre,
        validator: (nombre) {
          if (nombre == null || nombre.isEmpty) {
            return 'El nombre no puede quedar vacio';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Nombre',
        ),
      );

  Widget buildCosto() => TextFormField(
        maxLines: 1,
        initialValue: costo,
        onChanged: onChangedCosto,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Precio',
        ),
      );
  Widget buildEntrada() => TextFormField(
        maxLines: 1,
        initialValue: entrada,
        onChanged: onChangedEntrada,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Entrada de unidades',
        ),
      );
  Widget buildSalida() => TextFormField(
        maxLines: 1,
        initialValue: salida,
        onChanged: onChangedSalida,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Salida de unidades',
        ),
      );
  Widget buildExistencia() => TextFormField(
        maxLines: 1,
        initialValue: null, //existencia//,
        onChanged: (value) {},
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Existencia de unidades',
        ),
      );

  Widget buildGuardarProductoButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
          onPressed: onGuardarProducto,
          child: const Text('Guardar'),
        ),
      );
}
