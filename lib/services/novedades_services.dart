import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class NovedadesServices extends ChangeNotifier {
  final String _baseURL =
      "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Novedad> novedades = [];
  Novedad? novedadSeleccionada;
  bool isLoading = true;
  bool isSaving = false;

  PeluqueriasServices() {
    loadNovedades();
  }

  Future loadNovedades() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'novedades.json');
    final resp = await http.get(url);

    final Map<String, dynamic> peluqueriasMap = json.decode(resp.body);

    peluqueriasMap.forEach((key, value) {
      final tempNovedad = Novedad.fromMap(value);
      novedades.add(tempNovedad);
    });

    isLoading = false;
    notifyListeners();

    return novedades;
  }

  Future<String> crearUsuario(Novedad novedad) async {
    // Conectamos a la base de datos
    final url = Uri.https(_baseURL, 'novedades.json');
    // Queremos meter nuevo usuario, cambiamos el http.get a post
    final resp = await http.post(url, body: novedad.toJson());
    // Para que Firebase cree un ID del usuario automaticamente
    //final decodedData = json.decode(resp.body);
    //usuario.id = decodedData['nombre'];

    // ID con nuestro formato:
    int tamano = novedades.length + 2;
    novedad.id = "NVD00" + tamano.toString();

    this.novedades.add(novedad);

    return novedad.id!;
  }

  updateUsuario(Novedad novedad) async {
    final url = Uri.https(_baseURL, 'novedades/${novedad.id}.json');
    final resp = await http.put(url, body: novedad.toJson());
    final decodedData = resp.body;

    //return usuario.id!;
  }

  Future guardarOCrearUsuario(Novedad novedad) async {
    isSaving = true;
    notifyListeners();
    print(novedad.titulo);
    if (novedad.titulo == null) {
      // Crear
      await this.crearUsuario(novedad);
      print('creando');
    } else {
      // Actualizar
      await this.updateUsuario(novedad);
      print('updateando');
    }

    isSaving = false;
    notifyListeners();
  }
}
