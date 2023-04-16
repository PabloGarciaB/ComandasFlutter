import 'package:comandas_flutter_git/pages/bienvenida_login.dart';
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
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
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
            backgroundColor: Color.fromRGBO(240, 179, 60, 94))
      ]),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("D1913C"),
          hexStringToColor("FFD194")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
            color: hexStringToColor("FFD194"),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "Comienza a navegar",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 30,
                  ),
                  child: Row(
                    children: [
                      _selectedOptionNavegar(hexStringToColor("D1913C"),
                          "Ejemplo 1", "Ejemplo subtitulo"),
                      _selectedOptionNavegar(hexStringToColor("D1913C"),
                          "Ejemplo 1", "Ejemplo subtitulo"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*Text(
                      "Extras",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),*/
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Container(
                        height: 270,
                        child: GridView.count(
                          crossAxisCount: 1,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 25,
                          childAspectRatio: 1.30,
                          children: [
                            _selectedExtras(
                                "assets/images/comanda.png", "Generar comanda"),
                            _selectedExtras(
                                "assets/images/inventario.png", "Inventario"),
                            _selectedExtras(
                                "assets/images/menu.png", "Registrar ménu")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
