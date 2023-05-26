import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../Provider/productos.dart';
import '../model/menu.dart';
import '../pages/editar_menu_page.dart';
import '../utils/utils.dart';

class MenuWidget extends StatelessWidget {
  final MenuPlatillo menu;
  const MenuWidget({required this.menu, super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          key: Key(menu.idPlatillo),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editPlat(context, menu),
              caption: 'Editar',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              onTap: () => deletePlatillo(context, menu),
              caption: 'Borrar',
            )
          ],
          child: buildMenu(context),
        ),
      );

  Widget buildMenu(BuildContext context) => GestureDetector(
        onTap: () => editPlat(context, menu),
        child: Container(
          padding: const EdgeInsets.all(20),
          //FONDO articulo
          color: hexStringToColor('#fac055'),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.nombrePlatillo,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    if (menu.descripcionPlatillo.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Text(
                          menu.descripcionPlatillo,
                          style: const TextStyle(fontSize: 12, height: 1.5),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deletePlatillo(BuildContext context, MenuPlatillo menu) {
    final provider = Provider.of<ProductosProvider>(context, listen: false);
    provider.deletePlatillo(menu);

    Utils.showSnackBar(context, 'Platillo eliminado correctamente');
  }

  void editPlat(BuildContext context, MenuPlatillo menu) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditPlatPage(menu: menu),
        ),
      );
}
