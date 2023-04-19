import 'package:flutter/material.dart';
import 'package:comandas_flutter_git/reusable_widget/reusable_widget.dart';

import '../utils/colors_util.dart';

class Inventario extends StatefulWidget {
  const Inventario({super.key});

  @override
  State<Inventario> createState() => _InventarioState();
}

class _InventarioState extends State<Inventario> {
  TextEditingController _nombreProd = TextEditingController();
  TextEditingController _unidadEntra = TextEditingController();
  TextEditingController _unidadSale = TextEditingController();
  TextEditingController _unidadExistencia = TextEditingController();
  TextEditingController _costoUnidad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("FFD194"),
          hexStringToColor("FFD194")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Titulo'),
            ],
          ),
        ),
      ),
    );
  }
}
