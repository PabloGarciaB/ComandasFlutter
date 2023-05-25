import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:comandas_flutter_git/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:comandas_flutter_git/Provider/productos.dart';

import '../pages/editar_producto_page.dart';

class ProductoWidget extends StatelessWidget {
  final Producto producto;

  const ProductoWidget({required this.producto, super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          key: Key(producto.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editProd(context, producto),
              caption: 'Editar',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              onTap: () => deleteProd(context, producto),
              caption: 'Borrar',
            )
          ],
          child: buildProducto(context),
        ),
      );

  Widget buildProducto(BuildContext context) => GestureDetector(
      onTap: () => editProd(context, producto),
      child: Container(
        //rectangulo tarjeta producto
        color: hexStringToColor('#fac055'),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  if (producto.costo.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        producto.costo,
                        style: const TextStyle(fontSize: 12, height: 1.5),
                      ),
                    ),
                  if (producto.entrada.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        producto.entrada,
                        style: const TextStyle(fontSize: 12, height: 1.5),
                      ),
                    ),
                  if (producto.salida.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        producto.salida,
                        style: const TextStyle(fontSize: 12, height: 1.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ));

  void deleteProd(BuildContext context, Producto producto) {
    final provider = Provider.of<ProductosProvider>(context, listen: false);
    provider.removeProd(producto);

    Utils.showSnackBar(context, 'Producto eliminado correctamente');
  }

  void editProd(BuildContext context, Producto producto) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditProdPage(producto: producto),
        ),
      );
}
