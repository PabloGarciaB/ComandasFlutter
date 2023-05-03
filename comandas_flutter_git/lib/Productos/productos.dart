import 'package:comandas_flutter_git/api/firebase_api.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';

class ProductosProvider extends ChangeNotifier {
  List<Producto> _productos = [
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: 'Costo: 35',
        entrada: 'Entrada: 25',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: 'Costo: 35',
        entrada: 'Entrada: 25',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: 'Costo: 35',
        entrada: 'Entrada: 25',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: 'Costo: 35',
        entrada: 'Entrada: 25',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: 'Costo: 35',
        entrada: 'Entrada: 25',
        salida: 'Salida: 0'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: 'Costo: 35',
        entrada: 'Entrada: 25',
        salida: 'Salida: 0'),
  ];

  List<Producto> get productos =>
      _productos.where((productos) => productos.bandera == false).toList();

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  void removeProd(Producto producto) {
    _productos.remove(producto);

    notifyListeners();
  }

  void updateProd(
    Producto producto,
    String nombre,
    String costo,
    String entrada,
    String salida,
  ) {
    producto.nombre = nombre;
    producto.costo = costo;
    producto.entrada = entrada;
    producto.salida = salida;

    notifyListeners();
  }
}
