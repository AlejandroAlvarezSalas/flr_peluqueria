import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class ServiciosServices extends ChangeNotifier {
  final String _baseURL =
      "recuperacion-flutter-93b2a-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Servicio> servicios = [];
  Servicio? servicioSeleccionado;
  List<Servicio> ServiciosSeleccionados = [];
  bool isLoading = true;
  bool isSaving = false;

  ServiciosServices() {
    loadServicios();
  }

  Future loadServicios() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseURL, 'servicios.json');
    final resp = await http.get(url);

    final Map<String, dynamic> ServiciosMap = json.decode(resp.body);

    ServiciosMap.forEach((key, value) {
      final tempServicio = Servicio.fromMap(value);
      tempServicio.id = key;
      servicios.add(tempServicio);
    });

    isLoading = false;
    notifyListeners();

    return servicios;
  }

  updateServiciosSeleccionados(bool value, Servicio servicio) {
    servicio.selected = value;
    if (servicio.selected!) {
      ServiciosSeleccionados.add(servicio);
    } else {
      if (ServiciosSeleccionados.contains(servicio)) {
        ServiciosSeleccionados.remove(servicio);
      }
    }
    notifyListeners();
  }

  deleteServiciosSeleccionados(Peluquero peluquero) {
    ServiciosSeleccionados.clear();
    peluquero.servicios.forEach((key, value) {
      value.selected = false;
    });
  }

  Future<String> crearServicio(Servicio servicio) async {
    // Conectamos a la base de datos
    final url = Uri.https(_baseURL, 'servicios.json');
    // Queremos meter nuevo usuario, cambiamos el http.get a post
    final resp = await http.post(url, body: servicio.toJson());
    // Para que Firebase cree un ID del usuario automaticamente
    //final decodedData = json.decode(resp.body);
    //usuario.id = decodedData['nombre'];

    // ID con nuestro formato:
    int tamano = servicios.length + 2;
    servicio.id = "SER00" + tamano.toString();

    this.servicios.add(servicio);

    return servicio.id!;
  }

  Future<String> updateServicio(Servicio servicio) async {
    final url = Uri.https(_baseURL, 'servicios/${servicio.id}.json');
    final resp = await http.put(url, body: servicio.toJson());
    final decodedData = resp.body;

    return servicio.id!;
  }

  Future guardarOCrearServicio(Servicio servicio) async {
    isSaving = true;
    notifyListeners();
    print(servicio.id);
    if (servicio.id == null) {
      // Crear
      await this.crearServicio(servicio);
      print('creando');
    } else {
      // Actualizar
      await this.updateServicio(servicio);
      print('updateando');
    }

    isSaving = false;
    notifyListeners();
  }
}
