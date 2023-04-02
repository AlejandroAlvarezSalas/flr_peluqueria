// To parse this JSON data, do
//
//     final peluqueros = peluquerosFromMap(jsonString);

import 'dart:convert';

import 'package:pelucapp/models/models.dart';

class Peluquero {
    Peluquero({
        required this.atiende,
        required this.horario,
        this.imagen,
        required this.nombre,
        required this.servicios,
        required this.telefono,
    });

    String? id;
    String atiende;
    Map<String, bool> horario;
    String? imagen;
    String nombre;
    Map<String, Servicio> servicios;
    int telefono;

    factory Peluquero.fromJson(String str) => Peluquero.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Peluquero.fromMap(Map<String, dynamic> json) => Peluquero(
        atiende: json["atiende"],
        horario: Map.from(json["horario"]).map((k, v) => MapEntry<String, bool>(k, v)),
        imagen: json["imagen"],
        nombre: json["nombre"],
        servicios: Map.from(json["servicios"]).map((k, v) => MapEntry<String, Servicio>(k, Servicio.fromMap(v))),
        telefono: json["telefono"],
    );

    Map<String, dynamic> toMap() => {
        "atiende": atiende,
        "horario": Map.from(horario).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "imagen": imagen,
        "nombre": nombre,
        "servicios": Map.from(servicios).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "telefono": telefono,
    };
}
