import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class ReservaServices extends ChangeNotifier {
  final String _baseURL =
      "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Reserva> reservas = [];
  Reserva? reservaSeleccionada;

  bool isLoading = true;

  ReservaServices() {
    this.loadReserva();
  }

  Future loadReserva() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'reserva.json');
    final resp = await http.get(url);

    print("hola, he pasado del await");
    print(resp.body);

    final Map<String, dynamic> reservaMap = json.decode(resp.body);

    reservaMap.forEach((key, value) {
      final tempReserva = Reserva.fromMap(value);
      tempReserva.id = key;
      print('listo reserva:');
      print('id: ${tempReserva.id}, fecha:${tempReserva.fecha}');
      print('pago: ${tempReserva.pago}, peluqueria:${tempReserva.peluqueria}');
      print(
          'peluquero: ${tempReserva.peluquero}, usuario:${tempReserva.usuario}');
      print(
          'servicios: ${tempReserva.servicios.toString()}, cancelada: ${tempReserva.cancelada}');
      reservas.add(tempReserva);
    });
    isLoading = false;
    notifyListeners();
  }

  Future create(Reserva reserva) async {
    final url = Uri.https(_baseURL, 'reserva.json');
    await http.post(url, body: reserva.toJson());

    reservas.add(reserva);
  }

  Future update(Reserva reserva) async {
    final url = Uri.https(_baseURL, 'reserva/${reserva.id}.json');
    final resp = await http.put(url, body: reserva.toJson());
    final decodedData = resp.body;
  }

  Future guardarOCrearUsuario(Reserva reserva) async {
    if (reserva.id == null) {
      // Crear
      await this.create(reserva);
    } else {
      // Actualizar
      await this.update(reserva);
    }
  }

  Future cancelarReserva(Reserva reserva) async {
    reserva.cancelada = true;
    update(reserva);

    //cambio la hora a true en el peluquero TODO
  }
}
