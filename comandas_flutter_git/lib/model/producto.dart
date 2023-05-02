class ProductoField {
  static const createdTime = 'createdTime';
}

class Producto {
  DateTime createdTime;
  String nombre;
  String costo;
  String entrada;
  String salida;
  String existencia;
  String id;
  bool bandera;

  Producto({
    required this.createdTime,
    required this.nombre,
    this.costo = '',
    this.entrada = '',
    this.salida = '',
    this.existencia = '',
    this.id = '',
    this.bandera = false,
  });
}
