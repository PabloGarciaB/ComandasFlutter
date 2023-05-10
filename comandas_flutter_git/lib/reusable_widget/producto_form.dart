import 'package:flutter/material.dart';

class ProductoFormWidget extends StatelessWidget {
  final String nombre;
  final String costo;
  final String entrada;
  final String salida;
  final String existencia;
  final String id;
  final ValueChanged<String> onChangedNombre;
  final ValueChanged<String> onChangedCosto;
  final ValueChanged<String> onChangedEntrada;
  final ValueChanged<String> onChangedSalida;
  //final ValueChanged<String> onChangedExistencia;
  final VoidCallback onGuardarProducto;

  const ProductoFormWidget(
      {this.nombre = '',
      this.costo = '',
      this.entrada = '',
      this.salida = '',
      this.existencia = '',
      this.id = '',
      required this.onChangedNombre,
      required this.onChangedCosto,
      required this.onChangedEntrada,
      required this.onChangedSalida,
      //required this.onChangedExistencia,
      required this.onGuardarProducto,
      super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 4),
            buildCosto(),
            SizedBox(height: 4),
            buildEntrada(),
            SizedBox(height: 4),
            buildSalida(),
            SizedBox(height: 4),
            /*TextFormField(
              maxLines: 1,
              initialValue: id,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nombre',
                enabled: false,
              ),
            )*/
            //
            //No se muestra el campo pero debe mostrarse como un nuevo campo de la entrada de unidades
            //Cambio pendiente
            //buildExistencia(),
            SizedBox(height: 4),
            buildGuardarProductoButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: nombre,
        onChanged: onChangedNombre,
        validator: (nombre) {
          if (nombre!.isEmpty) {
            return 'El nombre no puede quedar vacio';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Nombre',
        ),
      );

  Widget buildCosto() => TextFormField(
        maxLines: 1,
        initialValue: costo,
        onChanged: onChangedCosto,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Precio',
        ),
      );
  Widget buildEntrada() => TextFormField(
        maxLines: 1,
        initialValue: entrada,
        onChanged: onChangedEntrada,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Entrada de unidades',
        ),
      );
  Widget buildSalida() => TextFormField(
        maxLines: 1,
        initialValue: salida,
        onChanged: onChangedSalida,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Salida de unidades',
        ),
      );
  Widget buildExistencia() => TextFormField(
        maxLines: 1,
        initialValue: existencia,
        onChanged: (value) {},
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Existencia de unidades',
        ),
      );

  Widget buildGuardarProductoButton() => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
        ),
        onPressed: onGuardarProducto,
        child: Text('Guardar'),
      );
}
