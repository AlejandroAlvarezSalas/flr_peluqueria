import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:pelucapp/services/services.dart';

class GerentesServices extends ChangeNotifier {
  final String _baseURL =
      "recuperacion-flutter-93b2a-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Gerente> gerentes = [];
  bool isLoading = true;
  bool isSaving = false;

  GerentesServices() {
    loadGerentes();
  }

  Future loadGerentes() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'gerentes.json');
    final resp = await http.get(url);
    final Map<String, dynamic> usuariosMap = json.decode(resp.body);

    usuariosMap.forEach((key, value) {
      final tempGerente = Gerente.fromMap(value);
      tempGerente.id = key;
      gerentes.add(tempGerente);
    });

    isLoading = false;
    notifyListeners();

    return gerentes;
  }

  Future<String> crearGerente(Gerente gerente) async {
    // Conectamos a la base de datos
    final url = Uri.https(_baseURL, 'gerentes.json');
    // Queremos meter nuevo gerente, cambiamos el http.get a post
    final resp = await http.post(url, body: gerente.toJson());
    // Para que Firebase cree un ID del gerente automaticamente
    //final decodedData = json.decode(resp.body);
    //gerente.id = decodedData['nombre'];

    // ID con nuestro formato:
    int tamano = gerentes.length + 2;
    gerente.id = "USR00" + tamano.toString();

    this.gerentes.add(gerente);

    return gerente.id!;
  }

  Future<String> updateGerente(Gerente gerente) async {
    final url = Uri.https(_baseURL, 'gerentes/${gerente.id}.json');
    final resp = await http.put(url, body: gerente.toJson());
    final decodedData = resp.body;

    return gerente.id!;
  }

  Future guardarOCrearGerente(Gerente gerente) async {
    isSaving = true;
    notifyListeners();
    print(gerente.id);
    if (gerente.id == null) {
      // Crear
      await this.crearGerente(gerente);
      print('creando');
    } else {
      // Actualizar
      await this.updateGerente(gerente);
      print('updateando');
    }

    isSaving = false;
    notifyListeners();
  }
}
