import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:comandas_flutter_git/model/menu.dart';
import 'package:flutter/material.dart';

import '../api/firebase_api.dart';

class ProductosProvider extends ChangeNotifier {
  final List<Producto> _productos = [
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso atolero',
        costo: 'Costo: \$25',
        entrada: 'Entrada de unidades: 25',
        salida: 'Salida de unidades: 0',
        existencia: 'Unidades en existencia: 25'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Domo hamburguesero',
        costo: 'Costo: \$25',
        entrada: 'Entrada de unidades: 25',
        salida: 'Salida de unidades: 0',
        existencia: 'Unidades en existencia: 25'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso de medio litro',
        costo: 'Costo: \$35',
        entrada: 'Entrada de unidades: 25',
        salida: 'Salida de unidades: 0',
        existencia: 'Unidades en existencia: 25'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Palo de elote',
        costo: 'Costo: \$40',
        entrada: 'Entrada de unidades: 1kg',
        salida: 'Salida de unidades: 0',
        existencia: 'Unidades en existencia: 1kg'),
    Producto(
        createdTime: DateTime.now(),
        nombre: 'Vaso de litro',
        costo: 'Costo: \$30',
        entrada: 'Entrada de unidades: 25',
        salida: 'Salida de unidades: 0',
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
        nombrePlatillo: 'Doriesquite',
        descripcionPlatillo:
            'Esquites preparados con mayonesa, quesito añejo, quesito amarillo, limón y fritura preferida.'),
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Esquite sencillo',
        descripcionPlatillo: 'Esquite con quesito anejo, limón y mayonesa.'),
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Elote',
        descripcionPlatillo: 'Delicioso elote con quesito anejo y mayonesa.'),
    MenuPlatillo(
        createdTime: DateTime.now(),
        nombrePlatillo: 'Elote loco',
        descripcionPlatillo:
            'Elote con mayonesa bañado en tu fritura preferida, quesito añejo y quesito amarillo.'),
  ];

  final List _comandasItems = [
    [
      "Doriesquite",
      "43",
      "lib/res/doriesquite_r_m.png",
      Colors.deepOrangeAccent.shade200
    ],
    [
      "Elote loco",
      "33",
      "lib/res/eloteL_r_m.png",
      Colors.deepOrangeAccent.shade200
    ],
    [
      "Elote sencillo",
      "23",
      "lib/res/elote_r_m.png",
      Colors.deepOrangeAccent.shade200
    ],
    [
      "Maruchan con esquite individual",
      "43",
      "lib/res/maruchan_r_m.png",
      Colors.deepOrangeAccent.shade200
    ],
    [
      "Tres Garcia",
      "98",
      "lib/res/tresG_r_m.png",
      Colors.deepOrangeAccent.shade200
    ],
    [
      "Ingrediente extra",
      "5",
      "lib/res/logo 2.png",
      Colors.deepOrangeAccent.shade200
    ],
  ];

  List _cartItems = [];

  List get comandas => _comandasItems;

  List get cartItems => _cartItems;

  List<Producto> get productos =>
      _productos.where((productos) => productos.bandera == false).toList();

  List<MenuPlatillo> get menu =>
      _platillo.where((menu) => menu.bander == false).toList();

  void addItem(int index) {
    _cartItems.add(_comandasItems[index]);
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculatedTotal() {
    double total = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toString();
  }

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
