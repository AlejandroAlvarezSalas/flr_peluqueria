import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/novedades_services.dart';
import 'package:pelucapp/services/peluquero_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../theme/app_theme.dart';
import '../widgets/big_text.dart';

class DatosCitaScreen extends StatefulWidget {
  DatosCitaScreen({Key? key}) : super(key: key);

  @override
  _DatosCitaScreen createState() => _DatosCitaScreen();
}

class _DatosCitaScreen extends State<DatosCitaScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _nombre = '';
  String _telefono = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reservaServices = Provider.of<ReservaServices>(context);

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
                    hintText: 'Ingrese el nombre del cliente',
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
                  initialValue: _telefono,
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    hintText: 'Ingreseel teléfono del cliente',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un teléfono';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _telefono = value!;
                  },
                ),
                SizedBox(height: 20.0),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      String datos = _nombre + "/" + _telefono;
                      reservaServices.datosUsuario = datos;
                      reservaServices.desdePeluquero = true;
                      Navigator.pushNamed(context, 'peluqueros');
                    },
                    child:
                        const Text('Siguiente', style: TextStyle(fontSize: 20)),
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
