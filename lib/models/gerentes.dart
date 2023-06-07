// To parse this JSON data, do
//
//     final producto = productoFromMap(jsonString);

import 'dart:convert';

class Gerente {
  Gerente({
    this.id,
    required this.nombre,
    required this.telefono,
  });

  String? id;
  String nombre;
  int telefono;

  factory Gerente.fromJson(String str) => Gerente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gerente.fromMap(Map<String, dynamic> json) => Gerente(
        nombre: json["nombre"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "telefono": telefono,
      };
}
