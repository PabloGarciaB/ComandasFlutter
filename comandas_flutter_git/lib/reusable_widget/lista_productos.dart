import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:comandas_flutter_git/reusable_widget/vistaProducto.dart';
import 'package:comandas_flutter_git/model/producto.dart';

class ProductoListWidget extends StatefulWidget {
  const ProductoListWidget({super.key});

  @override
  State<ProductoListWidget> createState() => _ProductoListWidgetState();
}

class _ProductoListWidgetState extends State<ProductoListWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);
    final listaproductos = provider.productos;

    return listaproductos.isEmpty
        ? const Center(
            child: Text(
              'Sin registros por mostrar',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: listaproductos.length,
            itemBuilder: (context, index) {
              final producto = listaproductos[index];
              return ProductoWidget(producto: producto);
            },
          );
  }
}
