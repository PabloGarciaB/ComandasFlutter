import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';

class ProductosProvider extends ChangeNotifier {
  List<Producto> _productos = [
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: "Precio: \$20 mxn",
        entrada: 'Entrada: 30',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: "Precio: \$20 mxn",
        entrada: 'Entrada: 30',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: "Precio: \$20 mxn",
        entrada: 'Entrada: 30',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: "Precio: \$20 mxn",
        entrada: 'Entrada: 30',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: "Precio: \$20 mxn",
        entrada: 'Entrada: 30',
        salida: 'Salida: 0'),
  ];

  List<Producto> get productos =>
      _productos.where((productos) => productos.bandera == false).toList();
}
