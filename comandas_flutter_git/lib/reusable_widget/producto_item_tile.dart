import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:flutter/material.dart';

class ProductoItemTile extends StatelessWidget {
  final String itemNombre;
  final String itemPrecio;
  final String imagePath;
  final color;
  void Function()? onPressed;

  ProductoItemTile(
      {required this.itemNombre,
      required this.itemPrecio,
      required this.imagePath,
      required this.color,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(98, 250, 192, 85)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset(
                  imagePath,
                  height: 75,
                ),
              ),
              Text(
                itemNombre,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              Text('\$ ' + itemPrecio,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                    backgroundColor: hexStringToColor('#FAC055')),
                onPressed: onPressed,
                child: Text(
                  'Añadir',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
