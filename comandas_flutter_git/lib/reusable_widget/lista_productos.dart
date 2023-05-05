import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comandas_flutter_git/Productos/productos.dart';
import 'package:comandas_flutter_git/reusable_widget/vistaProducto.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:flutter/foundation.dart';

class ProductoListWidget extends StatefulWidget {
  @override
  State<ProductoListWidget> createState() => _ProductoListWidgetState();
}

class _ProductoListWidgetState extends State<ProductoListWidget> {
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
        : StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('productos').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    children: snapshot.data!.docs.map((snap) {
                      print(snapshot.data!.docs[0].id);
                      var a = new Producto(
                        createdTime: snap["fechaCreacion"].toDate(),
                        nombre: snap["nombre"],
                        costo: snap["costo"],
                        entrada: snap["entrada"],
                        salida: snap["salida"],
                      );
                      return ProductoWidget(
                        producto: a,
                      );
                    }).toList(),
                  ),
                );
              } else {
                return Container();
              }
            });
  }
}
