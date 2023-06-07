// To parse this JSON data, do
//
//     final peluqueria = peluqueriaFromMap(jsonString);

import 'dart:convert';

import 'package:pelucapp/models/models.dart';

class Novedad {
  Novedad({
    required this.titulo,
    this.imagen,
    required this.descripcion,
    this.borrado = false,
  });

  String? id;
  String descripcion;
  String? imagen;
  String titulo;
  bool borrado;

  factory Novedad.fromJson(String str) => Novedad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Novedad.fromMap(Map<String, dynamic> json) => Novedad(
        titulo: json["titulo"],
        imagen: json["imagen"],
        descripcion: json["descripcion"],
        borrado: json["borrado"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "imagen": imagen,
        "titulo": titulo,
        "borrado": borrado,
      };
}
