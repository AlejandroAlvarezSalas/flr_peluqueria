import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/novedades_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GestionServiciosScreen extends StatelessWidget {
  const GestionServiciosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ServiciosServices serviciosServices =
        Provider.of<ServiciosServices>(context);

    PageController pageController = PageController(viewportFraction: 0.75);

    List<Servicio> servicios = serviciosServices.servicios;

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
              text: 'Listado de novedades',
              color: AppTheme.mainTextColor,
            ),
          ),
          Container(
            height: 450,
            child: PageView.builder(
                controller: pageController,
                itemCount: servicios.length,
                itemBuilder: (context, index) {
                  Servicio servicio = servicios[index];
                  return _buildPeluquerosCard(
                      servicio, serviciosServices, context);
                }),
          ),
          const SizedBox(height: 80),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 70,
            child: ElevatedButton(
              onPressed:
                  /*() async {
                    if (!usuarioForm.isValidForm()) return;
                    usuarioForm.usuario?.id = usuariosServices.usuarioLogin?.id;
                    usuarioForm.usuario?.nombre = formValues['nombre']!;
                    usuarioForm.usuario?.email = formValues['email']!;
                    usuarioForm.usuario?.telefono =
                        int.parse(formValues['telefono'] ?? '000000000');
                    usuarioForm.usuario?.password = formValues['password']!;
                    usuarioForm.usuario?.verificado = true;
                    usuarioForm.usuario?.genero = formValues['genero']!;

                    await usuariosServices
                        .guardarOCrearUsuario(usuarioForm.usuario!);
                    Navigator.pushNamed(context, 'home');
                  },*/
                  () {
                serviciosServices.creandoServicio = true;
                serviciosServices.servicioSeleccionado = null;
                Navigator.pushNamed(context, 'editarServicios');
              },
              child:
                  const Text('Añadir servicio', style: TextStyle(fontSize: 30)),
            ),
          ),
        ],
      ),
    );
  }
}
/*
List<Peluquero> getPeluquerosGestion(List<Peluqueria> peluquerias) {
  List<Peluquero> peluqueros = [];
  peluquerias.forEach((Peluqueria peluqueria) {
    peluqueria.peluqueros.forEach((key, value) {
      peluqueros.add(value);
    });
  });
  return peluqueros;
}*/

Widget _buildPeluquerosCard(
    Servicio servicio, ServiciosServices serviciosServices, context) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      BigText(
                        text: servicio.nombre,
                        color: AppTheme.mainTextColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BigText(
                          text: 'Descripción:',
                          color: AppTheme.mainTextColor,
                          size: 20),
                      const SizedBox(
                        height: 5,
                      ),
                      SmallText(
                        text: servicio.descripcion,
                        color: Colors.black45,
                        size: 15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BigText(
                          text: 'Tiempo:',
                          color: AppTheme.mainTextColor,
                          size: 20),
                      const SizedBox(
                        height: 5,
                      ),
                      SmallText(
                          text: servicio.tiempo.toString(),
                          color: Colors.black45,
                          size: 15),
                      const SizedBox(
                        height: 5,
                      ),
                      BigText(
                          text: 'Precio:',
                          color: AppTheme.mainTextColor,
                          size: 20),
                      const SizedBox(
                        height: 5,
                      ),
                      SmallText(
                          text: servicio.precio.toString(),
                          color: Colors.black45,
                          size: 15),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 5),
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.edit_note_outlined),
                    alignment: Alignment.bottomRight,
                    onPressed: () {
                      serviciosServices.servicioSeleccionado = servicio;
                      Navigator.pushNamed(context, 'editarServicios');
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
        child: servicio.imagen == null
            ? CircleAvatar(
                maxRadius: 80,
                //backgroundImage: AssetImage('asset/no-image.jpg'),
              )
            : CircleAvatar(
                maxRadius: 80,
                backgroundImage: NetworkImage(servicio.imagen!),
              ),
      )
    ],
  );
}
