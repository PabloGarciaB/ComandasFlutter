import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:comandas_flutter_git/Productos/productos.dart';

class ProductoWidget extends StatelessWidget {
  final Producto producto;

  const ProductoWidget({required this.producto, super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(producto.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () {},
              caption: 'Editar',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              onTap: () {},
              caption: 'Borrar',
            )
          ],
          child: buildProducto(context),
        ),
      );

  Widget buildProducto(BuildContext context) => Container(
        color: hexStringToColor('FFD194'),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  if (producto.costo.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        producto.costo,
                        style: TextStyle(fontSize: 12, height: 1.5),
                      ),
                    ),
                  if (producto.entrada.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        producto.entrada,
                        style: TextStyle(fontSize: 12, height: 1.5),
                      ),
                    ),
                  if (producto.salida.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        producto.salida,
                        style: TextStyle(fontSize: 12, height: 1.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
