import 'package:comandas_flutter_git/pages/Home.dart';
import 'package:comandas_flutter_git/pages/bienvenida_login.dart';
import 'package:comandas_flutter_git/pages/comandas_screen.dart';
import 'package:comandas_flutter_git/pages/inventario_screen.dart';
import 'package:comandas_flutter_git/pages/menu_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../Productos/productos.dart';
import '../api/firebase_api.dart';
import '../model/producto.dart';
import '../utils/colors_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List _pantallas = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _pantallas
      ..add(Home())
      ..add(Inventario())
      ..add(Menu())
      ..add(Comandas());

    _currentPage = Home();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _pantallas[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("D1913C"),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
            color: hexStringToColor("FFD194"),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: Color.fromRGBO(189, 168, 28, 74),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventario',
            backgroundColor: Color.fromRGBO(189, 168, 28, 74),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Menu",
            backgroundColor: Color.fromRGBO(138, 131, 90, 54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Comandas",
            backgroundColor: Color.fromRGBO(240, 179, 60, 94),
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
