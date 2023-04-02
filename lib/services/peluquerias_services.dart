import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class PeluqueriasServices extends ChangeNotifier{
  final String _baseURL = "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Peluqueria> peluquerias = [];
  Peluqueria? peluqueriaSeleccionada;
  bool isLoading = true;

  PeluqueriasServices(){
    loadPeluquerias();
  }

  Future loadPeluquerias() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseURL, 'peluquerias.json');
    final resp = await http.get(url);

    final Map<String, dynamic> peluqueriasMap = json.decode(resp.body);

    peluqueriasMap.forEach((key, value) {
      final tempPeluqueria = Peluqueria.fromMap(value);
      tempPeluqueria.nif = key;
      peluquerias.add(tempPeluqueria);
    });

    isLoading = false;
    notifyListeners();

    return peluquerias;
  }
}