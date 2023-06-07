// To parse this JSON data, do
//
//     final producto = productoFromMap(jsonString);

import 'dart:convert';

class Usuario {
  Usuario({
    this.id,
    required this.email,
    required this.genero,
    this.imagen,
    required this.nombre,
    required this.password,
    required this.telefono,
    required this.verificado,
    this.saldo,
  });

  String? id;
  String email;
  String genero;
  String? imagen;
  String nombre;
  String password;
  int telefono;
  bool verificado;
  bool? terminos = false;
  double? saldo = 0;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        imagen: json["imagen"],
        genero: json["genero"],
        nombre: json["nombre"],
        password: json["password"],
        telefono: json["telefono"],
        verificado: json["verificado"],
        saldo: json["saldo"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "imagen": imagen,
        "genero": genero,
        "nombre": nombre,
        "password": password,
        "telefono": telefono,
        "verificado": verificado,
        "saldo": saldo
      };
}
