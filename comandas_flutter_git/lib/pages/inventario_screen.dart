//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comandas_flutter_git/Provider/productos.dart';
//import 'package:comandas_flutter_git/api/firebase_api.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';
import 'package:comandas_flutter_git/reusable_widget/agregar_producto_widget.dart';
import 'package:comandas_flutter_git/reusable_widget/lista_productos.dart';
import 'package:provider/provider.dart';

import '../utils/colors_util.dart';

class Inventario extends StatefulWidget {
  const Inventario({super.key});

  @override
  State<Inventario> createState() => _InventarioState();
}

class _InventarioState extends State<Inventario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("#FFDFA3"),
              hexStringToColor("#FFDFA3")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: ProductoListWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          //fondo rectangular boton
          backgroundColor: hexStringToColor('#FFDFA3'),
          onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return const AgregarProductoWidget();
              },
              barrierDismissible: false),
          child: const Icon(Icons.add),
        ));
  }
}
