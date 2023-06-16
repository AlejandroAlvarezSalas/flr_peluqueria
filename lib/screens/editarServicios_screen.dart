import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/novedades_services.dart';
import 'package:pelucapp/services/peluquero_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../theme/app_theme.dart';
import '../widgets/big_text.dart';

class EditarServiciosScreen extends StatefulWidget {
  EditarServiciosScreen({Key? key}) : super(key: key);

  @override
  _EditarServiciosScreen createState() => _EditarServiciosScreen();
}

class _EditarServiciosScreen extends State<EditarServiciosScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _nombre = '';
  String _descripcion = '';
  String _imagen = '';
  String _destinado = '';
  double _precio = 0;
  int _tiempo = 0;
  bool _borrado = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serviciosServices = Provider.of<ServiciosServices>(context);
    final peluqueroServices = Provider.of<PeluquerosServices>(context);

    if (serviciosServices.servicioSeleccionado != null) {
      _nombre = serviciosServices.servicioSeleccionado!.nombre;
      _descripcion = serviciosServices.servicioSeleccionado!.descripcion;
      _imagen = serviciosServices.servicioSeleccionado!.imagen!;
      _borrado = serviciosServices.servicioSeleccionado!.borrado;
      _precio = serviciosServices.servicioSeleccionado!.precio;
      _tiempo = serviciosServices.servicioSeleccionado!.tiempo;
      _destinado = serviciosServices.servicioSeleccionado!.destinado;
    }

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
                  initialValue: _nombre,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Ingrese el nombre del servicio',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _nombre = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _descripcion,
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    hintText: 'Ingrese la descripción del servicio',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese una descripción';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _descripcion = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _imagen,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: 'Imagen',
                    hintText: 'Ingrese la url de la imagen de la novedad',
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
                TextFormField(
                  initialValue: _precio != 0 ? _precio.toString() : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    hintText: 'Ingrese el precio del servicio',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un precio';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor, ingrese un número válido';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _precio = double.parse(value!);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _tiempo != 0 ? _tiempo.toString() : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tiempo',
                    hintText: 'Ingrese el número de minutos',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un número';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor, ingrese un número válido';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _tiempo = int.parse(value!);
                  },
                ),
                SizedBox(height: 20.0),
                ToggleSwitch(
                  minWidth: 100.0,
                  initialLabelIndex: _destinado == "hombre" ? 0 : 1,
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
                      _destinado = 'hombre';
                    } else {
                      _destinado = 'mujer';
                    }
                  },
                ),
                SizedBox(height: 20.0),
                SizedBox(height: 20.0),
                !serviciosServices.creandoServicio
                    ? Row(
                        children: [
                          Checkbox(
                            value: _borrado,
                            onChanged: (value) {
                              print(_borrado);
                              _borrado = !_borrado;
                              if (serviciosServices.servicioSeleccionado !=
                                  null)
                                serviciosServices
                                    .servicioSeleccionado!.borrado = _borrado;
                              setState(() {
                                /*peluquerosServices.peluqueroSeleccionado!.borrado =
                              value;*/

                                //_borrado = value!;
                              });
                            },
                          ),
                          Text("Borrado")
                        ],
                      )
                    : SizedBox(),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (serviciosServices.servicioSeleccionado == null) {
                        serviciosServices.servicioSeleccionado = new Servicio(
                          nombre: 'default',
                          descripcion: 'nula',
                          destinado: 'hombre',
                          precio: 0,
                          tiempo: 0,
                        );
                      }

                      serviciosServices.servicioSeleccionado!.nombre = _nombre;
                      serviciosServices.servicioSeleccionado!.borrado =
                          _borrado;
                      serviciosServices.servicioSeleccionado!.imagen = _imagen;
                      serviciosServices.servicioSeleccionado!.descripcion =
                          _descripcion;
                      serviciosServices.servicioSeleccionado!.destinado =
                          _destinado;
                      serviciosServices.servicioSeleccionado!.precio = _precio;
                      serviciosServices.servicioSeleccionado!.tiempo = _tiempo;

                      serviciosServices.creandoServicio = false;

                      print("actualizo servicios de peluqueros");

                      if (serviciosServices.servicioSeleccionado!.borrado) {
                        for (var peluquero in peluqueroServices.peluqueros) {
                          peluquero.servicios.remove(
                              serviciosServices.servicioSeleccionado!.id);
                          peluqueroServices.guardarOCrearPeluquero(peluquero);
                        }
                      } else {
                        for (var peluquero in peluqueroServices.peluqueros) {
                          if (peluquero.servicios.containsKey(
                              serviciosServices.servicioSeleccionado!.id)) {
                            peluquero.servicios[serviciosServices
                                .servicioSeleccionado!
                                .id!] = serviciosServices.servicioSeleccionado!;
                          }
                          peluqueroServices.guardarOCrearPeluquero(peluquero);
                        }
                      }

                      print("guardo");
                      await serviciosServices.guardarOCrearServicio(
                          serviciosServices.servicioSeleccionado!);
                      await serviciosServices.reloadServicios();
                      Navigator.pushNamed(context, 'home');
                      /*if (await serviciosServices.guardarOCrearServicio(
                          serviciosServices.servicioSeleccionado!)) {
                        Navigator.pushNamed(context, 'recargaServicios');
                      } else {
                        //Navigator.pushNamed(context, 'home');
                        Navigator.pushNamed(context, 'recargaServicios');
                      }*/
                    },
                    child: const Text('Guardar cambios servicio',
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
