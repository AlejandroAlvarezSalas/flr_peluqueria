import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
    final peluquerosServices = Provider.of<PeluquerosServices>(context);
    final serviciosServices = Provider.of<ServiciosServices>(context);
    final usuariosServices = Provider.of<UsuariosServices>(context);

    //final peluqueria = peluqueriasServices.peluqueriaSeleccionada!;
    final peluquero = peluquerosServices.peluqueroSeleccionado!;
    final usuario = usuariosServices.usuarioLogin;
    List<Servicio> serviciosDisponibles = _getListServicios(peluquero, usuario!);

    PageController pageController = PageController(viewportFraction: 0.75);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,
              color: AppTheme.mainTextColor),
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
              text: 'Servicios',
              color: AppTheme.mainTextColor,
            ),
          ),
          Container(
            height: 450,
            child: PageView.builder(
                controller: pageController,
                itemCount: serviciosDisponibles.length,
                itemBuilder: (context, index) {
                  Servicio servicio = serviciosDisponibles[index];
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 350,
                          decoration: const BoxDecoration(
                            color: AppTheme.backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1.0, 1.0), //(x,y)
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
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
                                  text: servicio.nombre,
                                  color: AppTheme.mainTextColor,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse_outlined,
                                      color: Colors.black38,
                                    ),
                                    SmallText(
                                      text: servicio.tiempo.toString() +
                                          " minutos",
                                      color: Colors.black38,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SmallText(
                                    text: servicio.descripcion,
                                    color: Colors.black45),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: Checkbox(
                                        value: servicio.selected,
                                        onChanged:  ((value) => (serviciosServices.updateServiciosSeleccionados(value!, servicio)))
                                      ),
                                    )
                                  ),
                                )
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
                            backgroundImage: AssetImage('assets/servicio.png')
                            ) 
                          : CircleAvatar(
                            maxRadius: 80,
                            backgroundImage: NetworkImage( servicio.imagen! ),
                          ),
                          
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: serviciosServices.ServiciosSeleccionados.length,
                          itemBuilder: (context, index) {
                            Servicio _servicio = serviciosServices.ServiciosSeleccionados[index];
                            return Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(_servicio.nombre),
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                        onPressed: serviciosServices.ServiciosSeleccionados.isEmpty
                            ? null
                            : () => {Navigator.pushNamed(context, 'horario')},
                        child: const Text('Siguiente',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
          )
        ],
      ));
  }
}

List<Servicio> _getListServicios(Peluquero peluquero, Usuario usuario) {
  List<Servicio> salida = [];
  peluquero.servicios.forEach((key, value) {
    Servicio tempServicio = value;
    tempServicio.id = key;
    String servicioDestinado = tempServicio.destinado;
    String generoUsuario = usuario.genero;
    print('Servicio destinado = ${servicioDestinado}, Genero usuario = ${generoUsuario}, iguales = ${generoUsuario == servicioDestinado}');  
    if (servicioDestinado == generoUsuario) {
      salida.add(tempServicio);
    }
  });
  peluquero.servicios.forEach((key, value) {
    Servicio tempServicio = value;
    tempServicio.id = key;
    String servicioDestinado = tempServicio.destinado;
    String generoUsuario = usuario.genero;
    print('Servicio destinado = ${servicioDestinado}, Genero usuario = ${generoUsuario}, iguales = ${generoUsuario == servicioDestinado}');  
    if (servicioDestinado != generoUsuario) {
      salida.add(tempServicio);
    }
  });
  return salida;
}
