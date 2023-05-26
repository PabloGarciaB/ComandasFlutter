import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:comandas_flutter_git/model/menu.dart';
import 'package:comandas_flutter_git/pages/menu_screen.dart';
import 'package:comandas_flutter_git/reusable_widget/menu_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class AgregarMenuWidget extends StatefulWidget {
  const AgregarMenuWidget({super.key});

  @override
  State<AgregarMenuWidget> createState() => _AgregarMenuWidgetState();
}

class _AgregarMenuWidgetState extends State<AgregarMenuWidget> {
  final _formKey = GlobalKey<FormState>();
  String nombrePlatillo = '';
  String descripcionPlatillo = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Agregar platillo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(hintText: 'Nombre del platillo'),
                onChanged: (nombrePlatillo) =>
                    setState(() => this.nombrePlatillo = nombrePlatillo),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Se requiere un nombre';
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Descripcion'),
                onChanged: (descripcionPlatillo) => setState(
                    () => this.descripcionPlatillo = descripcionPlatillo),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Se requiere una descrpcion';
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    agregarPlatillo();
                    Utils.showSnackBar(context, 'Platillo añadido al menu');
                  },
                  child: Text('Guardar'),
                ),
              )
              /*  MenuFormWidget(
                onChangedNombreP: (nombrePlatillo) => setState(
                  () => this.nombrePlatillo = nombrePlatillo,
                ),
                onChangedDescripcionP: (descripcionPlatillo) => setState(
                    () => this.descripcionPlatillo = descripcionPlatillo),
                onGuardarPlatillo: agregarPlatillo,
              ), */
            ],
          ),
        ),
      );

  void agregarPlatillo() {
    if (_formKey.currentState!.validate()) {
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
}
