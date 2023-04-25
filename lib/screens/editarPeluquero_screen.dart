import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';

class EditarPeluqueroScreen extends StatefulWidget {
  Peluquero? peluquero = new Peluquero(
      atiende: "", horario: {}, nombre: "", servicios: {}, telefono: 0);

  EditarPeluqueroScreen({Key? key, this.peluquero}) : super(key: key);

  @override
  _EditarPeluqueroScreen createState() => _EditarPeluqueroScreen();
}

class _EditarPeluqueroScreen extends State<EditarPeluqueroScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _atiende;
  late int _telefono;
  late Map<String, bool> _horario = {
    'Lunes': false,
    'Martes': false,
    'Miercoles': false,
    'Jueves': false,
    'Viernes': false,
    'Sabado': false,
    'Domingo': false,
  };
  late Map<String, Servicio> _servicios;
  late String _imagen;
  late bool _borrado;
  late bool _10_00;
  late bool _10_30;
  late bool _11_00;
  late bool _11_30;
  late bool _12_00;
  late bool _12_30;
  late bool _13_00;
  late bool _13_30;
  late bool _17_00;
  late bool _17_30;
  late bool _18_00;
  late bool _18_30;
  late bool _19_00;
  late bool _19_30;
  late bool _20_00;
  late bool _20_30;

  @override
  void initState() {
    super.initState();
    _name = widget.peluquero?.nombre ?? '';
    _atiende = widget.peluquero?.atiende ?? '';
    _telefono = widget.peluquero?.telefono ?? 0;
    _horario = widget.peluquero?.horario ?? {};
    _servicios = widget.peluquero?.servicios ?? {};
    _imagen = widget.peluquero?.imagen ?? '';
    _borrado = widget.peluquero?.borrado ?? false;
    _10_00 = widget.peluquero?.horario['10:00'] ?? false;
    _10_30 = widget.peluquero?.horario['10:30'] ?? false;
    _11_00 = widget.peluquero?.horario['11:00'] ?? false;
    _11_30 = widget.peluquero?.horario['11:30'] ?? false;
    _12_00 = widget.peluquero?.horario['12:00'] ?? false;
    _12_30 = widget.peluquero?.horario['12:30'] ?? false;
    _13_00 = widget.peluquero?.horario['13:00'] ?? false;
    _13_30 = widget.peluquero?.horario['13:30'] ?? false;
    _17_00 = widget.peluquero?.horario['17:00'] ?? false;
    _17_30 = widget.peluquero?.horario['17:30'] ?? false;
    _18_00 = widget.peluquero?.horario['18:00'] ?? false;
    _18_30 = widget.peluquero?.horario['18:30'] ?? false;
    _19_00 = widget.peluquero?.horario['19:00'] ?? false;
    _19_30 = widget.peluquero?.horario['19:30'] ?? false;
    _20_00 = widget.peluquero?.horario['20:00'] ?? false;
    _20_30 = widget.peluquero?.horario['20:30'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Peluquero'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Ingrese el nombre del peluquero',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un nombre';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _atiende,
                  decoration: InputDecoration(
                    labelText: 'Atiende',
                    hintText: 'Ingrese el nombre del atiende',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese el nombre del atiende';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _atiende = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _telefono != 0 ? _telefono.toString() : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    hintText: 'Ingrese el teléfono del peluquero',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un teléfono';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor, ingrese un número válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _telefono = int.parse(value!);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _imagen,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: 'Imagen',
                    hintText: 'Ingrese la url de la imagen del peluquero',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese una url';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor, ingrese una url válida';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _imagen = value!;
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _borrado,
                      onChanged: (value) {
                        setState(() {
                          _borrado = value!;
                        });
                      },
                    ),
                    Text("Borrado")
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _10_00,
                      onChanged: (value) {
                        setState(() {
                          _10_00 = value!;
                        });
                      },
                    ),
                    Text("10:00"),
                    Checkbox(
                      value: _10_30,
                      onChanged: (value) {
                        setState(() {
                          _10_30 = value!;
                        });
                      },
                    ),
                    Text("10:30"),
                    Checkbox(
                      value: _11_00,
                      onChanged: (value) {
                        setState(() {
                          _11_00 = value!;
                        });
                      },
                    ),
                    Text("11:00"),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _11_30,
                      onChanged: (value) {
                        setState(() {
                          _11_30 = value!;
                        });
                      },
                    ),
                    Text("11:30"),
                    Checkbox(
                      value: _12_00,
                      onChanged: (value) {
                        setState(() {
                          _12_00 = value!;
                        });
                      },
                    ),
                    Text("12:00"),
                    Checkbox(
                      value: _12_30,
                      onChanged: (value) {
                        setState(() {
                          _12_30 = value!;
                        });
                      },
                    ),
                    Text("12:30"),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _13_00,
                      onChanged: (value) {
                        setState(() {
                          _13_00 = value!;
                        });
                      },
                    ),
                    Text("13:00"),
                    Checkbox(
                      value: _13_30,
                      onChanged: (value) {
                        setState(() {
                          _13_30 = value!;
                        });
                      },
                    ),
                    Text("13:30"),
                    Checkbox(
                      value: _17_00,
                      onChanged: (value) {
                        setState(() {
                          _17_00 = value!;
                        });
                      },
                    ),
                    Text("17:00"),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _17_30,
                      onChanged: (value) {
                        setState(() {
                          _17_30 = value!;
                        });
                      },
                    ),
                    Text("17:30"),
                    Checkbox(
                      value: _18_00,
                      onChanged: (value) {
                        setState(() {
                          _18_00 = value!;
                        });
                      },
                    ),
                    Text("18:00"),
                    Checkbox(
                      value: _18_30,
                      onChanged: (value) {
                        setState(() {
                          _18_30 = value!;
                        });
                      },
                    ),
                    Text("18:30"),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _19_00,
                      onChanged: (value) {
                        setState(() {
                          _19_00 = value!;
                        });
                      },
                    ),
                    Text("19:00"),
                    Checkbox(
                      value: _19_30,
                      onChanged: (value) {
                        setState(() {
                          _19_30 = value!;
                        });
                      },
                    ),
                    Text("19:30"),
                    Checkbox(
                      value: _20_00,
                      onChanged: (value) {
                        setState(() {
                          _20_00 = value!;
                        });
                      },
                    ),
                    Text("20:00"),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _20_30,
                      onChanged: (value) {
                        setState(() {
                          _20_30 = value!;
                        });
                      },
                    ),
                    Text("20:30"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
