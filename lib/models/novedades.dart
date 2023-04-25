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
  });

  String? id;
  String descripcion;
  String? imagen;
  String titulo;

  factory Novedad.fromJson(String str) => Novedad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Novedad.fromMap(Map<String, dynamic> json) => Novedad(
        titulo: json["titulo"],
        imagen: json["imagen"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "imagen": imagen,
        "titulo": titulo,
      };
}
