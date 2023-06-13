import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/peluquero_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../theme/app_theme.dart';
import '../widgets/big_text.dart';

class EditarPeluqueroScreen extends StatefulWidget {
  Peluquero? peluquero = new Peluquero(
      atiende: "", horario: {}, nombre: "", servicios: {}, telefono: 0);

  EditarPeluqueroScreen({Key? key, this.peluquero}) : super(key: key);

  @override
  _EditarPeluqueroScreen createState() => _EditarPeluqueroScreen();
}

class _EditarPeluqueroScreen extends State<EditarPeluqueroScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _atiende = 'hombre';
  int _telefono = 0;
  Map<String, bool> _horario = {
    'Lunes': false,
    'Martes': false,
    'Miercoles': false,
    'Jueves': false,
    'Viernes': false,
    'Sabado': false,
    'Domingo': false,
  };
  Map<String, Servicio> _servicios = {
    'a': new Servicio(
        descripcion: 'descripcion',
        destinado: 'destinado',
        nombre: 'nombre',
        precio: 0,
        tiempo: 0)
  };
  String _imagen = '';
  bool _borrado = false;
  /*bool _10_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['10:00'] ?? false;
  bool _10_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['10:30'] ?? false;
  bool _11_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['11:00'] ?? false;
  bool _11_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['11:30'] ?? false;
  bool _12_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['12:00'] ?? false;
  bool _12_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['12:30'] ?? false;
  bool _13_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['13:00'] ?? false;
  bool _13_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['13:30'] ?? false;
  bool _17_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['17:00'] ?? false;
  bool _17_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['17:30'] ?? false;
  bool _18_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['18:00'] ?? false;
  bool _18_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['18:30'] ?? false;
  bool _19_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['19:00'] ?? false;
  bool _19_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['19:30'] ?? false;
  bool _20_00 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['20:00'] ?? false;
  bool _20_30 = false;
  //peluquerosServices.peluqueroSeleccionado?.horario['20:30'] ?? false;
  */
  /*
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
*/
  Color _colorboton1000 = AppTheme.backgroundColor;

  Color _colorboton1030 = AppTheme.backgroundColor;

  Color _colorboton1100 = AppTheme.backgroundColor;

  Color _colorboton1130 = AppTheme.backgroundColor;

  Color _colorboton1200 = AppTheme.backgroundColor;

  Color _colorboton1230 = AppTheme.backgroundColor;

  Color _colorboton1300 = AppTheme.backgroundColor;

  Color _colorboton1330 = AppTheme.backgroundColor;

  Color _colorboton1700 = AppTheme.backgroundColor;

  Color _colorboton1730 = AppTheme.backgroundColor;

  Color _colorboton1800 = AppTheme.backgroundColor;

  Color _colorboton1830 = AppTheme.backgroundColor;

  Color _colorboton1900 = AppTheme.backgroundColor;

  Color _colorboton1930 = AppTheme.backgroundColor;

  Color _colorboton2000 = AppTheme.backgroundColor;

  Color _colorboton2030 = AppTheme.backgroundColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final peluquerosServices = Provider.of<PeluquerosServices>(context);
    final servicioServices = Provider.of<ServiciosServices>(context);
    if (peluquerosServices.peluqueroSeleccionado != null) {
      _name = peluquerosServices.peluqueroSeleccionado!.nombre;
      _atiende = peluquerosServices.peluqueroSeleccionado!.atiende;
      _telefono = peluquerosServices.peluqueroSeleccionado!.telefono;
      _horario = peluquerosServices.peluqueroSeleccionado!.horario;
      //_servicios = peluquerosServices.peluqueroSeleccionado!.servicios;
      _imagen = peluquerosServices.peluqueroSeleccionado!.imagen!;
      _borrado = peluquerosServices.peluqueroSeleccionado!.borrado;
    }
/*
    _10_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['10:00'] ?? false;
    _10_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['10:30'] ?? false;
    _11_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['11:00'] ?? false;
    _11_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['11:30'] ?? false;
    _12_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['12:00'] ?? false;
    _12_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['12:30'] ?? false;
    _13_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['13:00'] ?? false;
    _13_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['13:30'] ?? false;
    _17_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['17:00'] ?? false;
    _17_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['17:30'] ?? false;
    _18_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['18:00'] ?? false;
    _18_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['18:30'] ?? false;
    _19_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['19:00'] ?? false;
    _19_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['19:30'] ?? false;
    _20_00 =
        peluquerosServices.peluqueroSeleccionado?.horario['20:00'] ?? false;
    _20_30 =
        peluquerosServices.peluqueroSeleccionado?.horario['20:30'] ?? false;
*/
    /*_colorboton1000 = _10_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1030 = _10_30 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1100 = _11_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1130 = _11_30 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1200 = _12_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1230 = _12_30 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1300 = _13_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1330 = _13_30 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1700 = _17_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1730 = _17_30 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1800 = _18_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1830 = _18_30 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1900 = _19_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton1930 = _19_30 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton2000 = _20_00 ? AppTheme.backgroundColor : AppTheme.secondary;

    _colorboton2030 = _20_30 ? AppTheme.backgroundColor : AppTheme.secondary;
*/
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: BigText(
            text: 'PELUCAPP',
            color: AppTheme.primary,
            size: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(20.0),
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
                  onChanged: (value) {
                    _name = value!;
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
                  onChanged: (value) {
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
                  onChanged: (value) {
                    _imagen = value!;
                  },
                ),
                SizedBox(height: 20.0),
                /*Row(
                  children: [
                    Checkbox(
                      value: _10_00,
                      onChanged: (value) {
                        setState(() {
                          _10_00 = value!;
                        });
                      },
                    ),
                    GestureDetector(
                        child: Text("10:00"),
                        onTap: () {
                          print("10:00->$_10_00");
                          _10_00 = !_10_00;
                        }),
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
                ),*/

                /*Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1000,
                                    ),
                                    onPressed: () {
                                      _10_00 = !_10_00;
                                      _colorboton1000 = _10_00
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "10:00",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1030,
                                    ),
                                    onPressed: () {
                                      _10_30 = !_10_30;
                                      _colorboton1030 = _10_30
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "10:30",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1100,
                                    ),
                                    onPressed: () {
                                      _11_00 = !_11_00;
                                      _colorboton1100 = _11_00
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "11:00",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1130,
                                    ),
                                    onPressed: () {
                                      _11_30 = !_11_30;
                                      _colorboton1130 = _11_30
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "11:30",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1200,
                                    ),
                                    onPressed: () {
                                      _12_00 = !_12_00;
                                      _colorboton1200 = _12_00
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "12:00",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1230,
                                    ),
                                    onPressed: () {
                                      _12_30 = !_12_30;
                                      _colorboton1230 = _12_30
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "12:30",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1300,
                                    ),
                                    onPressed: () {
                                      _13_00 = !_13_00;
                                      _colorboton1300 = _13_00
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "13:00",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1330,
                                    ),
                                    onPressed: () {
                                      _13_30 = !_13_30;
                                      _colorboton1330 = _13_30
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "13:30",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1700,
                                    ),
                                    onPressed: () {
                                      print("hola $_17_00");

                                      setState(() {
                                        _17_00 = !_17_00;
                                        _colorboton1700 = _17_00
                                            ? AppTheme.secondary
                                            : AppTheme.backgroundColor;
                                      });
                                    },
                                    child: Text(
                                      "17:00",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1730,
                                    ),
                                    onPressed: () {
                                      _17_30 = !_17_30;
                                      _colorboton1730 = _17_30
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "17:30",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1800,
                                    ),
                                    onPressed: () {
                                      _18_00 = !_18_00;
                                      _colorboton1800 = _18_00
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "18:00",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 2, color: AppTheme.primary),
                                      primary: _colorboton1830,
                                    ),
                                    onPressed: () {
                                      _18_30 = !_18_30;
                                      _colorboton1830 = _18_30
                                          ? AppTheme.secondary
                                          : AppTheme.backgroundColor;
                                      setState(() {});
                                    },
                                    child: Text(
                                      "18:30",
                                      style: TextStyle(
                                          color: AppTheme.mainTextColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, left: 5.0),
                              child: SizedBox(
                                width: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2, color: AppTheme.primary),
                                    primary: _colorboton1900,
                                  ),
                                  onPressed: () {
                                    _19_00 = !_19_00;
                                    _colorboton1900 = _19_00
                                        ? AppTheme.secondary
                                        : AppTheme.backgroundColor;
                                    setState(() {});
                                  },
                                  child: Text(
                                    "19:00",
                                    style: TextStyle(
                                        color: AppTheme.mainTextColor),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, left: 5.0),
                              child: SizedBox(
                                width: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2, color: AppTheme.primary),
                                    primary: _colorboton1930,
                                  ),
                                  onPressed: () {
                                    _19_30 = !_19_30;
                                    _colorboton1930 = _19_30
                                        ? AppTheme.secondary
                                        : AppTheme.backgroundColor;
                                    setState(() {});
                                  },
                                  child: Text(
                                    "19:30",
                                    style: TextStyle(
                                        color: AppTheme.mainTextColor),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, left: 5.0),
                              child: SizedBox(
                                width: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2, color: AppTheme.primary),
                                    primary: _colorboton2000,
                                  ),
                                  onPressed: () {
                                    _20_00 = !_20_00;
                                    _colorboton2000 = _20_00
                                        ? AppTheme.secondary
                                        : AppTheme.backgroundColor;
                                    setState(() {});
                                  },
                                  child: Text(
                                    "20:00",
                                    style: TextStyle(
                                        color: AppTheme.mainTextColor),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, left: 5.0),
                              child: SizedBox(
                                width: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2, color: AppTheme.primary),
                                    primary: _colorboton2030,
                                  ),
                                  onPressed: () {
                                    _20_30 = !_20_30;
                                    _colorboton2030 = _20_30
                                        ? AppTheme.secondary
                                        : AppTheme.backgroundColor;
                                    setState(() {});
                                  },
                                  child: Text(
                                    "20:30",
                                    style: TextStyle(
                                        color: AppTheme.mainTextColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),*/
                SizedBox(
                  height: 20,
                ),
                ToggleSwitch(
                  minWidth: 100.0,
                  initialLabelIndex: _atiende == "hombre" ? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['Hombre', 'Mujer'],
                  icons: [Icons.male, Icons.female],
                  activeBgColors: [
                    [Colors.blue],
                    [Colors.pink]
                  ],
                  onToggle: (index) {
                    if (index == 0) {
                      _atiende = 'hombre';
                    } else {
                      _atiende = 'mujer';
                    }
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _borrado,
                      onChanged: (value) {
                        print(_borrado);
                        _borrado = !_borrado;
                        if (peluquerosServices.peluqueroSeleccionado != null)
                          peluquerosServices.peluqueroSeleccionado!.borrado =
                              _borrado;
                        setState(() {
                          /*peluquerosServices.peluqueroSeleccionado!.borrado =
                              value;*/

                          //_borrado = value!;
                        });
                      },
                    ),
                    Text("Borrado")
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      /*if (peluquerosServices.peluqueroSeleccionado == null) {
                        peluquerosServices.peluqueroSeleccionado =
                            new Peluquero(
                                atiende: 'hombre',
                                horario: {'p': true},
                                nombre: 'default',
                                servicios: {
                                  'a': new Servicio(
                                      descripcion: 'descripcion',
                                      destinado: 'destinado',
                                      nombre: 'nombre',
                                      precio: 0,
                                      tiempo: 0,
                                      borrado: false)
                                },
                                imagen: '',
                                telefono: 000000000);
                      }*/

                      /*peluquerosServices.peluqueroSeleccionado!.atiende =
                          _atiende;
                      peluquerosServices.peluqueroSeleccionado!.borrado =
                          _borrado;
                      peluquerosServices.peluqueroSeleccionado!.imagen =
                          _imagen;
                      peluquerosServices.peluqueroSeleccionado!.nombre = _name;
                      peluquerosServices.peluqueroSeleccionado!.telefono =
                          _telefono;*/

                      /*peluquerosServices.peluqueros
                          .add(peluquerosServices.peluqueroSeleccionado!);*/
                      /*peluquerosServices.peluqueroSeleccionado!.horario =*/
                      print("guardo");
                      /*await peluquerosServices.guardarOCrearPeluquero(
                          peluquerosServices.peluqueroSeleccionado!);*/
                      //await peluquerosServices.loadPeluqueros();
                      Navigator.pushNamed(context, 'servicios');
                    },
                    child: const Text('Editar servicios',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 150),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (peluquerosServices.peluqueroSeleccionado == null) {
                        peluquerosServices.peluqueroSeleccionado =
                            new Peluquero(
                                atiende: 'hombre',
                                horario: {'p': true},
                                nombre: 'default',
                                servicios: {
                                  'a': new Servicio(
                                      descripcion: 'descripcion',
                                      destinado: 'destinado',
                                      nombre: 'nombre',
                                      precio: 0,
                                      tiempo: 0,
                                      borrado: false)
                                },
                                imagen: '',
                                telefono: 000000000);
                      }

                      peluquerosServices.peluqueroSeleccionado!.atiende =
                          _atiende;
                      peluquerosServices.peluqueroSeleccionado!.borrado =
                          _borrado;
                      peluquerosServices.peluqueroSeleccionado!.imagen =
                          _imagen;
                      peluquerosServices.peluqueroSeleccionado!.nombre = _name;
                      peluquerosServices.peluqueroSeleccionado!.telefono =
                          _telefono;

                      /*Map<String, Servicio> serviciosFinales = {};
                      for (var serv
                          in servicioServices.ServiciosSeleccionados) {
                        serviciosFinales[serv.id!] = serv;
                      }

                      peluquerosServices.peluqueroSeleccionado!.servicios =
                          serviciosFinales;*/

                      /*peluquerosServices.peluqueros
                          .add(peluquerosServices.peluqueroSeleccionado!);*/
                      /*peluquerosServices.peluqueroSeleccionado!.horario =*/
                      print("guardo");
                      await peluquerosServices.guardarOCrearPeluquero(
                          peluquerosServices.peluqueroSeleccionado!);
                      //await peluquerosServices.loadPeluqueros();

                      peluquerosServices.editandoPeluquero = false;
                      Navigator.pushNamed(context, 'home');
                    },
                    child: const Text('Guardar cambios usuario',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
