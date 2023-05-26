import 'package:flutter/material.dart';

class MenuFormWidget extends StatelessWidget {
  final String nombrePlatillo;
  final String descripcionPlatillo;
  final ValueChanged<String> onChangedNombreP;
  final ValueChanged<String> onChangedDescripcionP;
  final VoidCallback onGuardarPlatillo;

  const MenuFormWidget(
      {this.nombrePlatillo = '',
      this.descripcionPlatillo = '',
      required this.onChangedNombreP,
      required this.onChangedDescripcionP,
      required this.onGuardarPlatillo,
      super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildNombre(),
            const SizedBox(height: 8),
            buildDescripcion(),
            const SizedBox(height: 24),
            buildGuardarPlatilloButton(),
          ],
        ),
      );

  Widget buildNombre() => TextFormField(
        maxLines: 1,
        initialValue: nombrePlatillo,
        onChanged: onChangedNombreP,
        validator: (nombre) {
          if (nombre!.isEmpty) {
            return 'El nombre no puede quedar vacio';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Nombre del platillo',
        ),
      );

  Widget buildDescripcion() => TextFormField(
        maxLines: 3,
        initialValue: descripcionPlatillo,
        onChanged: onChangedDescripcionP,
        validator: (descripcionPlatillo) {
          if (descripcionPlatillo!.isEmpty) {
            return 'La descripcion no puede quedar vacio';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Descripcion del platillo',
        ),
      );

  Widget buildGuardarPlatilloButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
          onPressed: onGuardarPlatillo,
          child: const Text('Guardar'),
        ),
      );
}
