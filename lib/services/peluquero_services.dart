import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class PeluquerosServices extends ChangeNotifier {
  final String _baseURL =
      "recuperacion-flutter-93b2a-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Peluquero> peluqueros = [];
  Peluquero? peluqueroSeleccionado;

  bool isLoading = true;
  bool isSaving = false;
  bool editandoPeluquero = false;
  bool creandoPeluquero = false;

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

  Future<String> crearPeluquero(Peluquero peluquero) async {
    // Conectamos a la base de datos
    final url = Uri.https(_baseURL, 'peluqueros.json');
    // Queremos meter nuevo usuario, cambiamos el http.get a post
    final resp = await http.post(url, body: peluquero.toJson());
    // Para que Firebase cree un ID del usuario automaticamente
    //final decodedData = json.decode(resp.body);
    //usuario.id = decodedData['nombre'];

    // ID con nuestro formato:
    int tamano = peluqueros.length + 2;
    peluquero.id = "PEL00" + tamano.toString();

    this.peluqueros.add(peluquero);

    return peluquero.id!;
  }

  Future<String> updatePeluquero(Peluquero peluquero) async {
    final url = Uri.https(_baseURL, 'peluqueros/${peluquero.id}.json');
    final resp = await http.put(url, body: peluquero.toJson());
    final decodedData = resp.body;

    return peluquero.id!;
  }

  Future guardarOCrearPeluquero(Peluquero peluquero) async {
    isSaving = true;
    notifyListeners();
    print(peluquero.id);
    if (peluquero.id == null) {
      // Crear
      await this.crearPeluquero(peluquero);
      print('creando');
    } else {
      // Actualizar
      await this.updatePeluquero(peluquero);
      print('updateando');
    }

    isSaving = false;
    notifyListeners();
  }
}
