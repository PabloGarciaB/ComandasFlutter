import 'package:comandas_flutter_git/reusable_widget/vistaMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comandas_flutter_git/model/menu.dart';
import 'package:comandas_flutter_git/Provider/productos.dart';

class MenuListWidget extends StatefulWidget {
  const MenuListWidget({super.key});

  @override
  State<MenuListWidget> createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);
    final platillos = provider.menu;

    return platillos.isEmpty
        ? const Center(
            child: Text(
              'Tus platillos se mostraran aqui',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: platillos.length,
            itemBuilder: (context, index) {
              final menu = platillos[index];

              return MenuWidget(menu: menu);
            },
          );
  }
}
