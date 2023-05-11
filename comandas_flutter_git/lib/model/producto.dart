import 'package:comandas_flutter_git/utils/utils.dart';

class Producto {
  //DateTime createdTime;
  String nombre;
  String costo;
  String entrada;
  String salida;
  String existencia;
  String id;
  bool bandera;

  Producto({
    //required this.createdTime,
    required this.nombre,
    this.costo = '',
    this.entrada = '',
    this.salida = '',
    this.existencia = '',
    this.id = '',
    this.bandera = false,
  });

  static Producto fromJson(Map<String, dynamic> json) => Producto(
      nombre: json['nombre'],
      costo: json['costo'],
      entrada: json['entrada'],
      salida: json['salida'],
      //existencia: json['existencia'],
      id: json['id']);

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'costo': costo,
        'entrada': entrada,
        'salida': salida,
        //'existencia': existencia,
      };
}
