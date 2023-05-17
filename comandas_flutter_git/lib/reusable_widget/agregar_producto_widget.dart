import 'package:comandas_flutter_git/Productos/productos.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'producto_form.dart';

class AgregarProductoWidget extends StatefulWidget {
  const AgregarProductoWidget({super.key});

  @override
  State<AgregarProductoWidget> createState() => _AgregarProductoWidgetState();
}

class _AgregarProductoWidgetState extends State<AgregarProductoWidget> {
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String costo = '';
  String entrada = '';
  String salida = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                  onChangedNombre: (nombre) =>
                      setState(() => this.nombre = nombre),
                  onChangedCosto: (costo) => setState(() => this.costo = costo),
                  onChangedEntrada: (entrada) =>
                      setState(() => this.entrada = entrada),
                  onChangedSalida: (salida) =>
                      setState(() => this.salida = salida),
                  // onChangedExistencia: (existencia) =>
                  //setState(() => this.existencia = existencia),
                  //onChangedId: (id) => setState(() => this.id = id),
                  onGuardarProducto: agregarProducto),
            ],
          ),
        ),
      );

  void agregarProducto() {
    //final isValid = _formKey.currentState?.validate();

    final prod = Producto(
      id: DateTime.now().toString(),
      nombre: nombre,
      costo: costo,
      entrada: entrada,
      salida: salida,
      createdTime: DateTime.now(),
    );

    final provider = Provider.of<ProductosProvider>(context, listen: false);
    provider.agregarProd(prod);
    Navigator.of(context).pop();
  }
}
