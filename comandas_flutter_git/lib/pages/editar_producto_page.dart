import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:comandas_flutter_git/api/firebase_api.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:comandas_flutter_git/pages/home_screen.dart';
import 'package:comandas_flutter_git/reusable_widget/producto_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors_util.dart';

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
  late String id;

  @override
  void initState() {
    super.initState();
    nombre = widget.producto.nombre;
    costo = widget.producto.costo;
    entrada = widget.producto.entrada;
    salida = widget.producto.salida;
    existencia = widget.producto.existencia;
    id = widget.producto.id;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Editar articulo'),
          backgroundColor: hexStringToColor("D1913C"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Eliminar articulo"),
                          content: const Text("¿Quiere eliminar el articulo?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No')),
                            TextButton(
                                onPressed: () {
                                  final provider =
                                      Provider.of<ProductosProvider>(context,
                                          listen: false);
                                  provider.removeProd(widget.producto);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ));
                                },
                                child: const Text("Si"))
                          ],
                        );
                      });
                },
                icon: const Icon((Icons.delete)))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("FFD194"),
              hexStringToColor("FFD194")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ProductoFormWidget(
                nombre: nombre,
                costo: costo,
                entrada: entrada,
                salida: salida,
                onChangedNombre: (nombre) =>
                    setState(() => this.nombre = nombre),
                onChangedCosto: (costo) => setState(() => this.costo = costo),
                onChangedEntrada: (entrada) =>
                    setState(() => this.entrada = entrada),
                onChangedSalida: (salida) =>
                    setState(() => this.salida = salida),
                onGuardarProducto: saveProd,
              ),
            ),
          ),
        ),
      );

  void saveProd() {
    final provider = Provider.of<ProductosProvider>(context, listen: false);

    provider.updateProd(widget.producto, nombre, costo, entrada, salida);

    Navigator.of(context).pop();
  }
}
