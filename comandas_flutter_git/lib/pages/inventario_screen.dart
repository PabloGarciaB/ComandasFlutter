import 'package:comandas_flutter_git/Productos/productos.dart';
import 'package:comandas_flutter_git/api/firebase_api.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';
import 'package:comandas_flutter_git/reusable_widget/reusable_widget.dart';
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
          hexStringToColor("FFD194"),
          hexStringToColor("FFD194")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: ProductoListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: hexStringToColor('D1913C'),
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AgregarProductoWidget();
            },
            barrierDismissible: false),
        child: Icon(Icons.add),
      ),
    );
  }
}
