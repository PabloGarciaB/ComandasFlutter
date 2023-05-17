import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:comandas_flutter_git/model/menu.dart';
import 'package:comandas_flutter_git/pages/menu_screen.dart';
import 'package:comandas_flutter_git/reusable_widget/menu_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgregarMenuWidget extends StatefulWidget {
  const AgregarMenuWidget({super.key});

  @override
  State<AgregarMenuWidget> createState() => _AgregarMenuWidgetState();
}

class _AgregarMenuWidgetState extends State<AgregarMenuWidget> {
  String nombrePlatillo = '';
  String descripcionPlatillo = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Agregar platillo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            MenuFormWidget(
              onChangedNombreP: (nombrePlatillo) => setState(
                () => this.nombrePlatillo = nombrePlatillo,
              ),
              onChangedDescripcionP: (descripcionPlatillo) => setState(
                  () => this.descripcionPlatillo = descripcionPlatillo),
              onGuardarPlatillo: agregarPlatillo,
            ),
          ],
        ),
      );

  void agregarPlatillo() {
    final platillo = MenuPlatillo(
      idPlatillo: DateTime.now().toString(),
      nombrePlatillo: nombrePlatillo,
      descripcionPlatillo: descripcionPlatillo,
      createdTime: DateTime.now(),
    );

    final provider = Provider.of<ProductosProvider>(context, listen: false);
    provider.addPlatillo(platillo);
    Navigator.of(context).pop();
  }
}
