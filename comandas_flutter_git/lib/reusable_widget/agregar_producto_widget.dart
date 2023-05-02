import 'package:flutter/material.dart';

import 'producto_form.dart';

class AgregarProductoWidget extends StatefulWidget {
  const AgregarProductoWidget({super.key});

  @override
  State<AgregarProductoWidget> createState() => _AgregarProductoWidgetState();
}

class _AgregarProductoWidgetState extends State<AgregarProductoWidget> {
  String nombre = '';
  String costo = '';
  String entrada = '';
  String salida = '';
  String existencia = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agregar nuevo producto',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            ProductoFormWidget(
              onChangedNombre: (nombre) => setState(() => this.nombre = nombre),
              onChangedCosto: (costo) => setState(() => this.costo = costo),
              onChangedEntrada: (entrada) =>
                  setState(() => this.entrada = entrada),
              onChangedSalida: (salida) => setState(() => this.salida = salida),
              onChangedExistencia: (existencia) =>
                  setState(() => this.existencia = existencia),
              onGuardarProducto: () {},
            ),
          ],
        ),
      );
}
