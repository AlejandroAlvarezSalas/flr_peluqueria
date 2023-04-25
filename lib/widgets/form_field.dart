import 'package:flutter/material.dart';

class FormFieldPers extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;
  final bool hideable;

  final String formProperty;
  final Map<String, String> formValues;

  const FormFieldPers({
    Key? key,
    this.hintText,
    this.icon,
    this.ocultar = false,
    required this.formProperty,
    required this.formValues,
    this.keyboardType,
    this.value,
    this.hideable = false,
  }) : super(key: key);

  @override
  _FormFieldPersState createState() => _FormFieldPersState();
}

class _FormFieldPersState extends State<FormFieldPers> {
  late bool _verpassword;

  @override
  void initState() {
    super.initState();
    _verpassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: widget.hideable ?? false ? _verpassword : widget.ocultar,
      keyboardType: widget.keyboardType,
      initialValue: widget.value ?? "",
      onChanged: (value) => widget.formValues[widget.formProperty] = value,
      validator: (value) {
        if (value!.isEmpty) {
          return 'No puede quedar vacío';
        }
        if (value.length < 4) {
          return 'No puede tener menos de 4 caracteres';
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.hideable
            ? IconButton(
                icon: Icon(
                  _verpassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _verpassword = !_verpassword;
                  });
                },
              )
            : Icon(widget.icon),
      ),
    );
  }
}
