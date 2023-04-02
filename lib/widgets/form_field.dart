import 'package:flutter/material.dart';

class FormFieldPers extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  final String formProperty;
  final Map<String, String> formValues;

  // Constructor del FormFieldRegi
  const FormFieldPers({
    Key? key,
    this.hintText,
    this.icon,
    this.ocultar = false,
    required this.formProperty,
    required this.formValues,
    this.keyboardType,
    this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: ocultar,
      keyboardType: keyboardType,
      initialValue: value ?? "",
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        // validacion para el form. DEFINIR
        if (value!.isEmpty) {
          return 'No puede quedar vacío';
        }
        if (value.length < 4) {
          return 'No puede tener menos de 4 caracteres';
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon),
      ),
    );
  }
}
