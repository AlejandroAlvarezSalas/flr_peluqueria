import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/novedades_services.dart';
import 'package:pelucapp/services/peluquero_services.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../theme/app_theme.dart';
import '../widgets/big_text.dart';

class EditarNovedadesScreen extends StatefulWidget {
  EditarNovedadesScreen({Key? key}) : super(key: key);

  @override
  _EditarNovedadesScreen createState() => _EditarNovedadesScreen();
}

class _EditarNovedadesScreen extends State<EditarNovedadesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _titulo = '';
  String _descripcion = '';
  String _imagen = '';
  bool _borrado = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final novedadesServices = Provider.of<NovedadesServices>(context);
    if (novedadesServices.novedadSeleccionada != null) {
      _titulo = novedadesServices.novedadSeleccionada!.titulo;
      _descripcion = novedadesServices.novedadSeleccionada!.descripcion;
      _imagen = novedadesServices.novedadSeleccionada!.imagen!;
      _borrado = novedadesServices.novedadSeleccionada!.borrado;
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
                  initialValue: _titulo,
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                    hintText: 'Ingrese el titulo de la novedad',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un título';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _titulo = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _descripcion,
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    hintText: 'Ingrese la descripción de la novedad',
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
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20.0),
                !novedadesServices.creandoNovedad
                    ? Row(
                        children: [
                          Checkbox(
                            value: _borrado,
                            onChanged: (value) {
                              print(_borrado);
                              _borrado = !_borrado;
                              if (novedadesServices.novedadSeleccionada != null)
                                novedadesServices.novedadSeleccionada!.borrado =
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
                      )
                    : SizedBox(),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (novedadesServices.novedadSeleccionada == null) {
                        novedadesServices.novedadSeleccionada = new Novedad(
                          titulo: 'default',
                          descripcion: 'nula',
                        );
                      }

                      novedadesServices.novedadSeleccionada!.titulo = _titulo;
                      novedadesServices.novedadSeleccionada!.borrado = _borrado;
                      novedadesServices.novedadSeleccionada!.imagen = _imagen;
                      novedadesServices.novedadSeleccionada!.descripcion =
                          _descripcion;
                      novedadesServices.creandoNovedad = false;
                      print("guardo");
                      await novedadesServices.guardarOCrearNovedad(
                          novedadesServices.novedadSeleccionada!);
                      novedadesServices.reloadNovedades();
                      Navigator.pushNamed(context, 'home');
                      /*if (await novedadesServices.guardarOCrearNovedad(
                          novedadesServices.novedadSeleccionada!)) {
                        Navigator.pushNamed(context, 'recargaNovedades');
                      } else {
                        //Navigator.pushNamed(context, 'home');
                        Navigator.pushNamed(context, 'recargaNovedades');
                      }*/
                    },
                    child: const Text('Guardar cambios novedad',
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
