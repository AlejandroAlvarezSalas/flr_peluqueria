// To parse this JSON data, do
//
//     final servicio = servicioFromMap(jsonString);

import 'dart:convert';

class Servicio {
  Servicio({
    required this.descripcion,
    required this.destinado,
    this.imagen,
    required this.nombre,
    required this.precio,
    required this.tiempo,
    this.borrado = false,
  });

  String? id;
  String descripcion;
  String destinado;
  String? imagen;
  String nombre;
  double precio;
  int tiempo;
  bool? selected = false;
  bool borrado;

  factory Servicio.fromJson(String str) => Servicio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Servicio.fromMap(Map<String, dynamic> json) => Servicio(
        descripcion: json["descripcion"],
        destinado: json["destinado"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"]?.toDouble(),
        tiempo: json["tiempo"],
        borrado: json["borrado"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "destinado": destinado,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
        "tiempo": tiempo,
        "borrado": borrado,
      };
}
