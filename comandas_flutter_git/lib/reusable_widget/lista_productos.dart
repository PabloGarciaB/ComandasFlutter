import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comandas_flutter_git/Productos/productos.dart';
import 'package:comandas_flutter_git/reusable_widget/vistaProducto.dart';

class ProductoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);
    final listaproductos = provider.productos;

    return listaproductos.isEmpty
        ? Center(
            child: Text(
              'No hay registro por mostrar',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: listaproductos.length,
            itemBuilder: (context, index) {
              final prod = listaproductos[index];
              return ProductoWidget(producto: prod);
            },
          );
  }
}
