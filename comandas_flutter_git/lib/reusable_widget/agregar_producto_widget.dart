import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Agregar nuevo producto',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Nombre'),
                  onChanged: (nombre) => setState(() => this.nombre = nombre),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Se requiere un nombre';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Costo'),
                  onChanged: (costo) => setState(() => this.costo = costo),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Se requiere un costo';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Entrada'),
                  onChanged: (entrada) =>
                      setState(() => this.entrada = entrada),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Se requiere una cantidad de entrada';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Salida'),
                  onChanged: (salida) => setState(() => this.salida = salida),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Si es el caso, ingrese 0, si no agregue.';
                    }
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      agregarProducto();
                      Utils.showSnackBar(
                          context, 'Producto añadido al inventario');
                    },
                    child: Text('Guardar'),
                  ),
                )
                /* ProductoFormWidget(
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
                    onGuardarProducto: agregarProducto) */
              ],
            ),
          ),
        ),
      );

  void agregarProducto() {
    if (_formKey.currentState!.validate()) {
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
}
