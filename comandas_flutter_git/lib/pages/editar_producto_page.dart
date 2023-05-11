import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comandas_flutter_git/Productos/productos.dart';
import 'package:comandas_flutter_git/api/firebase_api.dart';
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
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('productos').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  children: snapshot.data!.docs.map((snap) {
                    var a = Producto(
                      //createdTime: snap["fechaCreacion"].toDate(),
                      nombre: snap["nombre"],
                      costo: snap["costo"],
                      entrada: snap["entrada"],
                      salida: snap["salida"],
                      id: snap.id,
                    );
                    return ProductoFormWidget(
                      nombre: nombre,
                      costo: costo,
                      entrada: entrada,
                      salida: salida,
                      //id: snap.id,
                      onChangedNombre: (nombre) =>
                          setState(() => this.nombre = nombre),
                      onChangedCosto: (costo) =>
                          setState(() => this.costo = costo),
                      onChangedEntrada: (entrada) =>
                          setState(() => this.entrada = entrada),
                      onChangedSalida: (salida) =>
                          setState(() => this.salida = salida),
                      // onChangedExistencia: (existencia) =>
                      //setState(() => this.existencia = existencia),
                      onGuardarProducto: () {
                        FirebaseApi.updateProd(a);
                        Navigator.of(context).pop();
                      },
                    );
                  }).toList(),
                  //child: Form(
                  //key: _formKey,
                  //),
                ),
              );
            } else {
              return Container();
            }
          }));

  void saveProd() {
    final provider = Provider.of<ProductosProvider>(context, listen: false);

    provider.updateProd(widget.producto, nombre, costo, entrada, salida, id);

    Navigator.of(context).pop();
  }

  Future<void> updateString() {
    return FirebaseFirestore.instance
        .collection('productos')
        .doc("g4TYrQBlloFWFxxjGuum")
        .update({
      "nombre": "nombreP",
      "costo": "costoP",
      "entrada": "entradaP",
      "salida": "salidaP"
    });
  }
}
