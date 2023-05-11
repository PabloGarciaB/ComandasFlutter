import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';

import '../api/firebase_api.dart';

class ProductosProvider extends ChangeNotifier {
  List<Producto> _productos = [
    Producto(
        //createdTime: DateTime.now(),
        nombre: 'Producto 1 Hardcoded',
        costo: 'Costo: 35',
        entrada: 'Entrada: 25',
        salida: 'Salida: 0',
        id: 'g4TYrQBlloFWFxxjGuum'),
  ];

  List<Producto> get productos =>
      _productos.where((productos) => productos.bandera == false).toList();

  void displayProd(List<Producto> productos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productos = _productos;
        notifyListeners();
      });

  void agregarProducto(Producto producto) => FirebaseApi.createProd(producto);

  void removeProd(Producto producto) => FirebaseApi.deleteProd(producto);

  void updateProd(Producto producto, String nombre, String costo,
      String entrada, String salida, String id) {
    producto.nombre = nombre;
    producto.costo = costo;
    producto.entrada = entrada;
    producto.salida = salida;
    producto.id = id;

    FirebaseApi.updateProd(producto);
  }
}
