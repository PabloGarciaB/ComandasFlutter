import 'package:comandas_flutter_git/reusable_widget/lista_menu.dart';
import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:flutter/material.dart';

import '../reusable_widget/agregar_menu_widget.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("FFD194"),
              hexStringToColor("FFD194")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: const MenuListWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: hexStringToColor('D1913C'),
          onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return const AgregarMenuWidget();
              },
              barrierDismissible: false),
          child: const Icon(Icons.add),
        ));
  }
}
