import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/comandas.dart';
import '../utils/colors_util.dart';
import '../utils/utils.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'home_screen.dart';

class AddComanda extends StatelessWidget {
  CollectionReference productos =
      FirebaseFirestore.instance.collection('productos');
  AddComanda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<ProductosProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.asset(value.cartItems[index][2]),
                              title: Text(value.cartItems[index][0]),
                              subtitle: Text('\$' + value.cartItems[index][1]),
                              trailing: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  Provider.of<ProductosProvider>(context,
                                          listen: false)
                                      .removeItem(index);
                                  Utils.showSnackBar(
                                      context, 'Producto eliminado');
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$ ' + value.calculatedTotal(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: Text('Finalizar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
