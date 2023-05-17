import 'package:comandas_flutter_git/model/producto.dart';
import 'package:comandas_flutter_git/model/menu.dart';
import 'package:flutter/material.dart';

import '../api/firebase_api.dart';
import '../model/menu.dart';

class ProductosProvider extends ChangeNotifier {
  final List<Producto> _productos = [
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso atolero',
        costo: 'Costo: \$25',
        entrada: 'Unidades: 25',
        salida: 'Unidades: 0',
        existencia: 'Unidades en existencia: 25'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso atolero',
        costo: 'Costo: \$25',
        entrada: 'Unidades: 25',
        salida: 'Unidades: 0',
        existencia: 'Unidades en existencia: 25'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso atolero',
        costo: 'Costo: \$25',
        entrada: 'Unidades: 25',
        salida: 'Unidades: 0',
        existencia: 'Unidades en existencia: 25'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso atolero',
        costo: 'Costo: \$25',
        entrada: 'Unidades: 25',
        salida: 'Unidades: 0',
        existencia: 'Unidades en existencia: 25'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso atolero',
        costo: 'Costo: \$25',
        entrada: 'Unidades: 25',
        salida: 'Unidades: 0',
        existencia: 'Unidades en existencia: 25')
  ];

  final List<MenuPlatillo> _platillo = [
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Combo Comida',
        descripcionPlatillo:
            'Chapata a elegir, agua de fruta natural, ensalda pequeña'),
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Combo Comida',
        descripcionPlatillo:
            'Chapata a elegir, agua de fruta natural, ensalda pequeña'),
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Combo Comida',
        descripcionPlatillo:
            'Chapata a elegir, agua de fruta natural, ensalda pequeña'),
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Combo Comida',
        descripcionPlatillo:
            'Chapata a elegir, agua de fruta natural, ensalda pequeña'),
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Combo Comida',
        descripcionPlatillo:
            'Chapata a elegir, agua de fruta natural, ensalda pequeña'),
  ];

  List<Producto> get productos =>
      _productos.where((productos) => productos.bandera == false).toList();

  List<MenuPlatillo> get menu =>
      _platillo.where((menu) => menu.bander == false).toList();

  void agregarProd(Producto prod) {
    _productos.add(prod);
    notifyListeners();
  }

  void addPlatillo(MenuPlatillo platillo) {
    _platillo.add(platillo);
    notifyListeners();
  }

  void deletePlatillo(MenuPlatillo platillo) {
    _platillo.remove(platillo);
    notifyListeners();
  }

  void updatePlatillo(
      MenuPlatillo platillo, String nombre, String descripcion) {
    platillo.nombrePlatillo = nombre;
    platillo.descripcionPlatillo = descripcion;
    notifyListeners();
  }

  void removeProd(Producto prod) {
    _productos.remove(prod);
    notifyListeners();
  }

  void updateProd(Producto prod, String nombre, String costo, String entrada,
      String salida) {
    prod.nombre = nombre;
    prod.costo = costo;
    prod.entrada = entrada;
    prod.salida = salida;
    notifyListeners();
  }

  /* void displayProd(List<Producto> productos) =>
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
  }*/
}
