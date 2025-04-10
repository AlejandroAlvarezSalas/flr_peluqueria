// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Reserva {
  Reserva(
      {required this.fecha,
      required this.pago,
      this.codigoBizum,
      required this.peluquero,
      required this.peluqueria,
      required this.servicios,
      required this.usuario,
      this.cancelada = false,
      this.pagada = false,
      this.telefonica = false});
  String? id;
  List<String> fecha;
  String pago;
  String peluquero;
  String peluqueria;
  Map<String, bool> servicios;
  String usuario;
  bool cancelada;
  String? codigoBizum = 'Sin código';
  bool pagada = false;
  bool telefonica = false;

  factory Reserva.fromJson(String str) => Reserva.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reserva.fromMap(Map<String, dynamic> json) => Reserva(
        fecha: List<String>.from(json['fecha'].map((x) => x.toString())),
        pago: json['pago'],
        codigoBizum: json['CodigoBizum'],
        peluquero: json['peluquero'],
        peluqueria: json['peluqueria'],
        servicios: Map.from(json['servicios'])
            .map((k, v) => MapEntry<String, bool>(k, v)),
        usuario: json['usuario'],
        cancelada: json['cancelada'],
        pagada: json['pagada'],
        telefonica: json['telefonica'],
      );

  Map<String, dynamic> toMap() => {
        'fecha': fecha,
        'pago': pago,
        'CodigoBizum': codigoBizum,
        'peluqueria': peluqueria,
        'peluquero': peluquero,
        'servicios':
            Map.from(servicios).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'usuario': usuario,
        'cancelada': cancelada,
        'pagada': pagada,
        'telefonica': telefonica
      };
}
