// To parse this JSON data, do
//
//     final peluqueria = peluqueriaFromMap(jsonString);

import 'dart:convert';

import 'package:pelucapp/models/models.dart';

class Peluqueria {
    Peluqueria({
        required this.direccion,
        this.imagen,
        required this.nombre,
        required this.peluqueros,
        required this.telefono,
    });

    String? nif; 
    String direccion;
    String? imagen;
    String nombre;
    Map<String, Peluquero> peluqueros;
    int telefono;

    factory Peluqueria.fromJson(String str) => Peluqueria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Peluqueria.fromMap(Map<String, dynamic> json) => Peluqueria(
        direccion: json["direccion"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        peluqueros: Map.from(json["peluqueros"]).map((k, v) => MapEntry<String, Peluquero>(k, Peluquero.fromMap(v))),
        telefono: json["telefono"],
    );

    Map<String, dynamic> toMap() => {
        "direccion": direccion,
        "imagen": imagen,
        "nombre": nombre,
        "peluqueros": Map.from(peluqueros).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "telefono": telefono,
    };
}
