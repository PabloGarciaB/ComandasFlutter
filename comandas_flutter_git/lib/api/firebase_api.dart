import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comandas_flutter_git/model/producto.dart';
import 'package:comandas_flutter_git/utils/utils.dart';

class FirebaseApi {
  static Future<String> createProd(Producto producto) async {
    final docProd = FirebaseFirestore.instance.collection('productos').doc();
    producto.id = docProd.id;
    await docProd.set(producto.toJson());

    return docProd.id;
  }

  static Stream<List<Producto>> readProd() => FirebaseFirestore.instance
      .collection('productos')
      .orderBy(ProductoField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Producto.fromJson));
}
