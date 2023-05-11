import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comandas_flutter_git/model/producto.dart';

class FirebaseApi {
  static Future<String> createProd(Producto producto) async {
    final docProd = FirebaseFirestore.instance.collection('productos').doc();
    producto.id = docProd.id;
    await docProd.set(producto.toJson());

    return docProd.id;
  }

  static Future<void> updateProd(Producto producto) {
    return FirebaseFirestore.instance
        .collection('productos')
        .doc(producto.id)
        .update(producto.toJson())
        .then((value) => print('Producto actualizado'))
        .catchError((error) => print("$error"));
  }

  static Future deleteProd(Producto producto) async {
    final docProd =
        FirebaseFirestore.instance.collection('productos').doc(producto.id);

    await docProd.delete();
  }
}
