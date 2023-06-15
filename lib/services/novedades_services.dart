import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class NovedadesServices extends ChangeNotifier {
  final String _baseURL =
      "recuperacion-flutter-93b2a-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Novedad> novedades = [];
  Novedad? novedadSeleccionada;
  bool isLoading = true;
  bool isSaving = false;
  bool creandoNovedad = false;

  NovedadesServices() {
    loadNovedades();
  }

  Future loadNovedades() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'Novedades.json');
    final resp = await http.get(url);

    final Map<String, dynamic> novedadesMap = json.decode(resp.body);

    novedadesMap.forEach((key, value) {
      final tempNovedad = Novedad.fromMap(value);
      tempNovedad.id = key;
      novedades.add(tempNovedad);
    });

    isLoading = false;
    notifyListeners();

    print("muestro novedades: " + novedades.toString());
    return novedades;
  }

  Future<String> crearNovedad(Novedad novedad) async {
    // Conectamos a la base de datos
    final url = Uri.https(_baseURL, 'Novedades.json');
    // Queremos meter nuevo usuario, cambiamos el http.get a post
    final resp = await http.post(url, body: novedad.toJson());
    // Para que Firebase cree un ID del usuario automaticamente
    //final decodedData = json.decode(resp.body);
    //usuario.id = decodedData['nombre'];

    // ID con nuestro formato:
    int tamano = novedades.length + 2;
    novedad.id = "NVD00" + tamano.toString();

    novedades.add(novedad);

    return novedad.id!;
  }

  updateNovedad(Novedad novedad) async {
    final url = Uri.https(_baseURL, 'Novedades/${novedad.id}.json');
    final resp = await http.put(url, body: novedad.toJson());
    final decodedData = resp.body;

    //return usuario.id!;
  }

  Future guardarOCrearNovedad(Novedad novedad) async {
    isSaving = true;
    notifyListeners();
    print(novedad.titulo);
    if (novedad.id == null) {
      // Crear
      await this.crearNovedad(novedad);
      print('creando');
    } else {
      // Actualizar
      await this.updateNovedad(novedad);
      print('updateando');
    }

    isSaving = false;
    notifyListeners();
  }
}
