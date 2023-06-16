import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/models/usuario.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/reservas_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:provider/provider.dart';

import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ReservasPeluqueroScreen extends StatefulWidget {
  const ReservasPeluqueroScreen({super.key});

  @override
  _ReservasPeluqueroScreen createState() => _ReservasPeluqueroScreen();
}

class _ReservasPeluqueroScreen extends State<ReservasPeluqueroScreen> {
  static final double radius = 20;
/*
  static const List<Widget> _pages = <Widget>[
    CitaScreen(),
    MisReservasScreen(),
    call_screen(),
    ProfileHomePage(),
    PeluquerosScreen(),
  ];
*/
  UniqueKey? keyTile;
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ReservaServices reservaServices =
        Provider.of<ReservaServices>(context);

    List<Reserva> obtenerReservasPeluquero(String peluquero_id) {
      List<Reserva> reservas = reservaServices.reservas;
      List<Reserva> reservasPeluquero = [];
      final usuariosServices = Provider.of<UsuariosServices>(context);
      for (var reserva in reservas) {
        List<Usuario> usuarioReserva = [];
        usuarioReserva = usuariosServices.usuarios
            .where((usuario) =>
                usuario.id == reserva.usuario ||
                reserva
                    .telefonica) //o el usuario existe o la cita es telefonica
            .toList(); //para quitarme los usuarios que ya no existan pero tengan reserva
        if (reserva.peluquero == peluquero_id &&
            !reserva.cancelada &&
            !usuarioReserva.isEmpty) {
          reservasPeluquero.add(reserva);
        }
      }
      return reservasPeluquero;
    }

    final usuariosServices = Provider.of<UsuariosServices>(context);
    final Usuario usuario = usuariosServices.usuarioLogin!;

    final peluquerosServices = Provider.of<PeluquerosServices>(context);
    final Peluquero peluquero = peluquerosServices.peluqueros.firstWhere(
        (peluquero) =>
            peluquero.telefono ==
            usuario
                .telefono); //uso el numero de telefono como identificador de los peluqueros
    List<Reserva> reservas = obtenerReservasPeluquero(peluquero.id.toString());
    reservas.sort((a, b) => a.fecha.first.compareTo(b.fecha.first));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.mainTextColor),
        ),
        title: BigText(
          text: 'PELUCAPP',
          color: AppTheme.primary,
          size: 25,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, 'datosCita');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: reservas.length /*peluqueriasServices.peluquerias.length*/,
        itemBuilder: (BuildContext context, int index) {
          final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
          while (peluqueriasServices.peluquerias.isEmpty) {}
          Peluqueria peluqueria = peluqueriasServices.peluquerias.firstWhere(
              (peluqueria) => peluqueria.nif == reservas[index].peluqueria,
              orElse: () => new Peluqueria(
                  direccion: "calle no encontrada",
                  nombre: "Peluqueria por defecto",
                  telefono: 658453326,
                  imagen: "imagenNoEncontrada",
                  peluqueros: <String, Peluquero>{}));
          peluqueria = peluqueriasServices.peluquerias[0];

          return GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context, 'product');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      buildImage(peluqueria.imagen!),
                      buildText(context, reservas[index]),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildImage(String url) => Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
      );

  Widget buildText(BuildContext context, Reserva reserva) {
    final ReservaServices reservaServices =
        Provider.of<ReservaServices>(context);
    final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
    final serviciosServices = Provider.of<ServiciosServices>(context);
    final usuariosServices = Provider.of<UsuariosServices>(context);
    final peluqueroServices = Provider.of<PeluquerosServices>(context);

    /*print(
        'nif de peluqueria: ${peluqueriasServices.peluquerias[1].nif}, nif de reserva: ${reserva.peluqueria}}');*/

    Peluqueria peluqueriaCita = peluqueriasServices.peluquerias[
        0]; /*
        .firstWhere((peluqueria) => peluqueria.nif == reserva.peluqueria);*/
    print('DATOSCLIENTE: ${peluqueriaCita.peluqueros.toString()}');
    Usuario usuarioCita = usuariosServices.usuarios.firstWhere(
        (usuario) => usuario.id == reserva.usuario,
        orElse: () => new Usuario(
            email: 'default@gmail.com',
            genero: 'hombre',
            nombre: reserva.usuario ?? 'noname',
            password: 'nopass',
            telefono: 0,
            verificado: true));
    final Usuario usuario = usuariosServices.usuarioLogin!;

    final Peluquero peluquero = peluqueroServices.peluqueros
        .firstWhere((peluquero) => peluquero.telefono == usuario.telefono);

    List<Servicio> serviciosCita = serviciosServices.servicios
        .where(
            (servicio) => reserva.servicios.keys.toList().contains(servicio.id))
        .toList();
    List<String> nombresServicios = serviciosCita.map((s) => s.nombre).toList();

    List<Servicio> filterServicios(List<Servicio> servicios, List<String> ids) {
      return servicios.where((servicio) => ids.contains(servicio.id)).toList();
    }

    double sumaPrecios =
        serviciosCita.fold(0, (total, servicio) => total + servicio.precio);

    int sumaTiempo = serviciosCita.fold<int>(
        0, (previousValue, servicio) => previousValue + servicio.tiempo);
    String portada =
        usuarioCita.nombre + ': ' + reserva.fecha /*.values.toList()*/ .first;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        key: keyTile,
        initiallyExpanded: isExpanded,
        childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
        title: Text(
          /*
          '${peluqueriaCita.nombre}'*/
          portada.substring(0, portada.length - 7),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        children: [
          Text('Peluquería:  ${peluqueriaCita.nombre}'),
          Text('Usuario: ${usuarioCita.nombre}'),
          Text('Dirección: ${peluqueriaCita.direccion}'),
          Text('Fecha: ${reserva.fecha.toString()}'),
          Text('Servicios: ${nombresServicios.toString()}'),
          Text('Pago: ${reserva.pago}'),
          Text('Código: ${reserva.codigoBizum}'),
          Text('Coste total: ${sumaPrecios}'),
          Text('Tiempo total: ${sumaTiempo}'),
          Text('Pagada: ${reserva.pagada}'),
          ElevatedButton(
              onPressed: () {
                //meter el sueldo
                /*usuarioCita.saldo = usuarioCita.saldo ?? 0 + sumaPrecios;
                usuariosServices.updateUsuario(usuarioCita);
                reservaServices.cancelarReserva(reserva);*/
                reservaServices.reservaSeleccionada = reserva;
                peluqueroServices.peluqueroSeleccionado = peluquero;
                serviciosServices.ServiciosSeleccionados = serviciosCita;
                Navigator.pushNamed(context, 'editarReserva');
                //seleccionado = true;
              },
              child: Text('Editar')),
        ],
        /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
          ),*/
      ),
    );
  }
}
