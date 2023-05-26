//import 'package:comandas_flutter_git/pages/Home.dart';
import 'package:comandas_flutter_git/pages/comandas_screen.dart';
import 'package:comandas_flutter_git/pages/inventario_screen.dart';
import 'package:comandas_flutter_git/pages/menu_screen.dart';
import 'package:flutter/material.dart';
import '../utils/colors_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List _pantallas = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _pantallas
      ..add(const Inventario())
      ..add(const Menu())
      ..add(const Comandas());

    _currentPage = const Inventario();
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
      backgroundColor: hexStringToColor("#FFDFA3"),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(100, 255, 223, 163),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Comandas",
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
