import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../reusable_widget/producto_item_tile.dart';
import '../utils/utils.dart';
import 'add_comanda.dart';

class Comandas extends StatefulWidget {
  const Comandas({super.key});

  @override
  State<Comandas> createState() => _ComandasState();
}

class _ComandasState extends State<Comandas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddComanda();
            },
          ),
        ),
        backgroundColor: hexStringToColor('#FFDFA3'),
        child: Icon(Icons.navigate_next),
      ),
      backgroundColor: Color.fromARGB(100, 255, 223, 163),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Center(
              child: Text(
                'Pulsa el boton de esquina inferior derecha para ver el total',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Productos disponibles',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Builder(builder: (context) {
                return Consumer<ProductosProvider>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      padding: EdgeInsets.all(2),
                      itemCount: value.comandas.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                      itemBuilder: (context, index) {
                        return ProductoItemTile(
                          itemNombre: value.comandas[index][0],
                          itemPrecio: value.comandas[index][1],
                          imagePath: value.comandas[index][2],
                          color: value.comandas[index][3],
                          onPressed: () {
                            Provider.of<ProductosProvider>(context,
                                    listen: false)
                                .addItem(index);
                            Utils.showSnackBar(context, 'Producto añadido');
                          },
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
