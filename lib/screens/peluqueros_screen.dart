import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PeluquerosScreen extends StatelessWidget {
  const PeluquerosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
    final peluquerosServices = Provider.of<PeluquerosServices>(context);
    final serviciosServices = Provider.of<ServiciosServices>(context);

    PageController pageController = PageController(viewportFraction: 0.75);

    List<Peluquero> peluqueros = peluquerosServices.peluqueros;
    /*getPeluqueros(peluqueriasServices.peluqueriaSeleccionada!)*/;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SmallText(
              text: 'Elige tu pelquero favorito',
              color: AppTheme.mainTextColor,
            ),
          ),
          Container(
            height: 450,
            child: PageView.builder(
                controller: pageController,
                itemCount: peluqueros.length,
                itemBuilder: (context, index) {
                  Peluquero peluquero = peluqueros[index];
                  return _buildPeluquerosCard(peluquero, peluquerosServices,
                      serviciosServices, context);
                }),
          ),
        ],
      ),
    );
  }
}

List<Peluquero> getPeluqueros(Peluqueria peluqueria) {
  List<Peluquero> peluqueros = [];
  peluqueria.peluqueros.forEach((key, value) {
    final tempPeluquero = value;
    tempPeluquero.id = key;
    if (!value.borrado) {
      peluqueros.add(tempPeluquero);
    }
  });
  return peluqueros;
}

Widget _buildPeluquerosCard(
    Peluquero peluquero,
    PeluquerosServices peluquerosServices,
    ServiciosServices serviciosServices,
    context) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 350,
          decoration: const BoxDecoration(
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0), //(x,y)
                blurRadius: 8.0,
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            width: 290,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                BigText(
                  text: peluquero.nombre,
                  color: AppTheme.mainTextColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                BigText(
                    text: 'Servicios disponibles:',
                    color: AppTheme.mainTextColor,
                    size: 20),
                const SizedBox(
                  height: 10,
                ),
                SmallText(
                    text: _peluqueroServiciosToString(peluquero),
                    color: Colors.black45),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 5),
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.check_circle),
                    alignment: Alignment.bottomRight,
                    onPressed: () {
                      peluquerosServices.peluqueroSeleccionado = peluquero;
                      serviciosServices.deleteServiciosSeleccionados(peluquero);
                      Navigator.pushNamed(context, 'servicios');
                    },
                    color: AppTheme.primary,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: peluquero.imagen == null
            ? CircleAvatar(
                maxRadius: 80,
                backgroundImage: AssetImage('assets/salon.jpg'),
              )
            : CircleAvatar(
                maxRadius: 80,
                backgroundImage: NetworkImage(peluquero.imagen!),
              ),
      )
    ],
  );
}

_peluqueroServiciosToString(Peluquero peluquero) {
  String salida = "";
  peluquero.servicios.forEach((key, value) {
    salida += value.nombre;
    salida += ", ";
  });
  return salida.substring(0, salida.length - 2);
}
