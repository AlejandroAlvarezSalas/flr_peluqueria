import 'package:flutter/material.dart';
import 'package:pelucapp/screens/resumen_pedido.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../services/services.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class EditarReservaScreen extends StatelessWidget {
  const EditarReservaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReservaServices reservaServices =
        Provider.of<ReservaServices>(context);
    final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
    final serviciosServices = Provider.of<ServiciosServices>(context);
    final usuariosServices = Provider.of<UsuariosServices>(context);
    final peluqueroServices = Provider.of<PeluquerosServices>(context);

    List<Servicio> serviciosCita = serviciosServices.servicios
        .where((servicio) => reservaServices.reservaSeleccionada!.servicios.keys
            .toList()
            .contains(servicio.id))
        .toList();

    double sumaPrecios =
        serviciosCita.fold(0, (total, servicio) => total + servicio.precio);

    final peluqueria = peluqueriasServices.peluquerias[0];
    final peluquero = peluqueroServices.peluqueroSeleccionado!;
    final serviciosSeleccionados = serviciosServices.ServiciosSeleccionados;
    final diaSeleccionado =
        reservaServices.reservaSeleccionada!.fecha.map((strFecha) {
      DateTime fechaParseada = DateTime.parse(strFecha);
      return fechaParseada;
    }).toList(); //TOCHECK
    ResumenArgs resumen = ResumenArgs.completo(
        peluqueria, peluquero, serviciosSeleccionados, diaSeleccionado);

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
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Peluquero'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, 'peluqueros');
            },
          ),
          ListTile(
            title: Text('Servicios'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              serviciosServices.deleteServiciosSeleccionados(peluquero);
              Navigator.pushNamed(context, 'servicios');
            },
          ),
          ListTile(
            title: Text('Fecha'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, 'horario');
            },
          ),
          ListTile(
            title: Text('Método de pago'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, 'metodos_de_pago',
                  arguments: resumen);
            },
          ),
          ListTile(
              title: Text('Cambiar estado del pago'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                reservaServices.alternarPagadaReserva(
                    reservaServices.reservaSeleccionada!);
                Navigator.pushNamed(context, 'home');
              }),
          ListTile(
            title: Text('Cancelar cita'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              reservaServices
                  .cancelarReserva(reservaServices.reservaSeleccionada!);
              Navigator.pushNamed(context, 'home');
            },
          )
        ],
      ),
    );
  }
}
