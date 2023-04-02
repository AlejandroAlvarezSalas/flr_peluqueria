import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class UsuariosServices extends ChangeNotifier {
  final String _baseURL =
      "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Usuario> usuarios = [];
  Usuario? usuarioLogin;
  bool isLoading = true;
  bool isSaving = false;

  UsuariosServices() {
    loadUsuarios();
  }

  Future loadUsuarios() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'usuarios.json');
    final resp = await http.get(url);
    final Map<String, dynamic> usuariosMap = json.decode(resp.body);

    usuariosMap.forEach((key, value) {
      final tempUsuario = Usuario.fromMap(value);
      tempUsuario.id = key;
      usuarios.add(tempUsuario);
    });

    isLoading = false;
    notifyListeners();

    return usuarios;
  }

  updateAvailability(bool value) {
    this.usuarioLogin!.terminos = value;
    notifyListeners();
  }

  Future<String> crearUsuario(Usuario usuario) async {
    // Conectamos a la base de datos
    final url = Uri.https(_baseURL, 'usuarios.json');
    // Queremos meter nuevo usuario, cambiamos el http.get a post
    final resp = await http.post(url, body: usuario.toJson());
    // Para que Firebase cree un ID del usuario automaticamente
    //final decodedData = json.decode(resp.body);
    //usuario.id = decodedData['nombre'];

    // ID con nuestro formato:
    int tamano = usuarios.length + 2;
    usuario.id = "USR00" + tamano.toString();

    this.usuarios.add(usuario);

    return usuario.id!;
  }

  Future<String> updateUsuario(Usuario usuario) async {
    final url = Uri.https(_baseURL, 'usuarios/${usuario.id}.json');
    final resp = await http.put(url, body: usuario.toJson());
    final decodedData = resp.body;

    return usuario.id!;
  }

  Future guardarOCrearUsuario(Usuario usuario) async {
    isSaving = true;
    notifyListeners();
    print(usuario.id);
    if (usuario.id == null) {
      // Crear
      await this.crearUsuario(usuario);
      print('creando');
    } else {
      // Actualizar
      await this.updateUsuario(usuario);
      print('updateando');
    }

    isSaving = false;
    notifyListeners();
  }
}
