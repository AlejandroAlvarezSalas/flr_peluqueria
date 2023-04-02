import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class ServiciosServices extends ChangeNotifier{
  final String _baseURL = "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Servicio> Servicios = [];
  List<Servicio> ServiciosSeleccionados = [];
  bool isLoading = true;

  ServiciosServices(){
    loadServicios();
  }

  Future loadServicios() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https( _baseURL, 'servicios.json');
    final resp = await http.get(url);

    final Map<String, dynamic> ServiciosMap = json.decode(resp.body);

    ServiciosMap.forEach((key, value) {
      final tempServicio = Servicio.fromMap(value);
      tempServicio.id = key;
      Servicios.add(tempServicio);
    });

    isLoading = false;
    notifyListeners();

    return Servicios;
  }

  updateServiciosSeleccionados ( bool value, Servicio servicio ){
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

  deleteServiciosSeleccionados(Peluquero peluquero){
    ServiciosSeleccionados.clear();
    peluquero.servicios.forEach((key, value) {value.selected = false;});
  }
}