import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class PeluquerosServices extends ChangeNotifier {
  final String _baseURL =
      "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Peluquero> peluqueros = [];
  Peluquero? peluqueroSeleccionado;

  bool isLoading = true;

  PeluquerosServices() {
    this.loadPeluqueros();
  }

  Future loadPeluqueros() async {
    final url = Uri.https(_baseURL, 'peluqueros.json');
    final resp = await http.get(url);

    final Map<String, dynamic> peluquerosMap = json.decode(resp.body);

    peluquerosMap.forEach((key, value) {
      final tempPeluquero = Peluquero.fromMap(value);
      tempPeluquero.id = key;
      peluqueros.add(tempPeluquero);
    });
  }
}
