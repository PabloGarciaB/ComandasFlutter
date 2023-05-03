import 'package:comandas_flutter_git/Productos/productos.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:comandas_flutter_git/reusable_widget/producto_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProdPage extends StatefulWidget {
  final Producto producto;

  const EditProdPage({super.key, required this.producto});

  @override
  State<EditProdPage> createState() => _EditProdPageState();
}

class _EditProdPageState extends State<EditProdPage> {
  final _formKey = GlobalKey<FormState>();

  late String nombre;
  late String costo;
  late String entrada;
  late String salida;
  late String existencia;

  @override
  void initState() {
    super.initState();
    nombre = widget.producto.nombre;
    costo = widget.producto.costo;
    entrada = widget.producto.entrada;
    salida = widget.producto.salida;
    existencia = widget.producto.existencia;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ProductoFormWidget(
              nombre: nombre,
              costo: costo,
              entrada: entrada,
              salida: salida,
              onChangedNombre: (nombre) => setState(() => this.nombre = nombre),
              onChangedCosto: (costo) => setState(() => this.costo = costo),
              onChangedEntrada: (entrada) =>
                  setState(() => this.entrada = entrada),
              onChangedSalida: (salida) => setState(() => this.salida = salida),
              onChangedExistencia: (existencia) =>
                  setState(() => this.existencia = existencia),
              onGuardarProducto: saveProd,
            ),
          ),
        ),
      );

  void saveProd() {
    final isValid = _formKey.currentState?.validate();

    final provider = Provider.of<ProductosProvider>(context, listen: false);

    provider.updateProd(widget.producto, nombre, costo, entrada, salida);

    Navigator.of(context).pop();
  }
}
