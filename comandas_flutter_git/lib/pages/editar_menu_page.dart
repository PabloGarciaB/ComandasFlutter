import 'package:comandas_flutter_git/model/menu.dart';
import 'package:comandas_flutter_git/pages/home_screen.dart';
import 'package:comandas_flutter_git/reusable_widget/menu_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/productos.dart';
import '../utils/colors_util.dart';

class EditPlatPage extends StatefulWidget {
  final MenuPlatillo menu;
  const EditPlatPage({required this.menu, super.key});

  @override
  State<EditPlatPage> createState() => _EditPlatPageState();
}

class _EditPlatPageState extends State<EditPlatPage> {
  late String nombrePlat;
  late String descripcionPlat;

  @override
  void initState() {
    super.initState();
    nombrePlat = widget.menu.nombrePlatillo;
    descripcionPlat = widget.menu.descripcionPlatillo;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Editar articulo'),
          backgroundColor: hexStringToColor("FFFFFF"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Eliminar articulo"),
                          content: const Text("¿Quiere eliminar el articulo?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No')),
                            TextButton(
                                onPressed: () {
                                  final provider =
                                      Provider.of<ProductosProvider>(context,
                                          listen: false);
                                  provider.deletePlatillo(widget.menu);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ));
                                },
                                child: const Text("Si"))
                          ],
                        );
                      });
                },
                icon: const Icon((Icons.delete)))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("FFD194"),
              hexStringToColor("FFD194")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: MenuFormWidget(
                  nombrePlatillo: nombrePlat,
                  descripcionPlatillo: descripcionPlat,
                  onChangedNombreP: (nombrePlat) =>
                      setState(() => this.nombrePlat = nombrePlat),
                  onChangedDescripcionP: (descripcionPlat) =>
                      setState(() => this.descripcionPlat = descripcionPlat),
                  onGuardarPlatillo: savePlatillo),
            ),
          ),
        ),
      );

  void savePlatillo() {
    final provider = Provider.of<ProductosProvider>(context, listen: false);
    provider.updatePlatillo(widget.menu, nombrePlat, descripcionPlat);
    Navigator.of(context).pop();
  }
}
