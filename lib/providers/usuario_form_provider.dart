import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';

class UsuarioFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Usuario? usuario;

  UsuarioFormProvider(this.usuario);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
