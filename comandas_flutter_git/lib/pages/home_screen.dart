import 'package:comandas_flutter_git/pages/Home.dart';
import 'package:comandas_flutter_git/pages/bienvenida_login.dart';
import 'package:comandas_flutter_git/pages/comandas_screen.dart';
import 'package:comandas_flutter_git/pages/inventario_screen.dart';
import 'package:comandas_flutter_git/pages/menu_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

  Widget _selectedOptionNavegar(@required Color color, @required String title,
      @required String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.only(left: 20),
      height: 120,
      width: 220,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 19,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedExtras(@required String image, @required String name) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: hexStringToColor("D1913C"), width: 3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("D1913C"),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Inicio",
          style: TextStyle(fontSize: 23),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
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
