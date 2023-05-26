class MenuField {
  static const createdTime = 'createdTime';
}

class MenuPlatillo {
  DateTime createdTime;
  String nombrePlatillo;
  String descripcionPlatillo;
  String idPlatillo;
  bool bander;

  MenuPlatillo({
    required this.createdTime,
    required this.nombrePlatillo,
    this.descripcionPlatillo = '',
    this.idPlatillo = '',
    this.bander = false,
  });
}
