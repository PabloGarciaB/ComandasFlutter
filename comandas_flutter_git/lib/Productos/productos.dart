import 'package:comandas_flutter_git/api/firebase_api.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/material.dart';

class ProductosProvider extends ChangeNotifier {
  List<Producto> _productos = [];

  List<Producto> get productos =>
      _productos.where((productos) => productos.bandera == false).toList();

  void setProd(List<Producto> productos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _productos = productos;
        notifyListeners();
      });

  void agregarProducto(Producto producto) => FirebaseApi.createProd(producto);
}
