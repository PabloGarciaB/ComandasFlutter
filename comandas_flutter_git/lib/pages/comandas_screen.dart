import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Comandas extends StatefulWidget {
  const Comandas({super.key});

  @override
  State<Comandas> createState() => _ComandasState();
}

class _ComandasState extends State<Comandas> {
  @override
  Widget build(BuildContext context) {
    AppBar(
      title: Text('Comandas'),
    );
    return Container();
  }
}
