import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelucapp/screens/front_page_screen.dart';
import 'package:pelucapp/screens/home_screen.dart';
import 'package:pelucapp/services/novedades_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:provider/provider.dart';

class PantallaIntermediaSreen extends StatelessWidget {
  const PantallaIntermediaSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PeluquerosServices peluqueroServices =
        Provider.of<PeluquerosServices>(context);

    final NovedadesServices novedadesServices =
        Provider.of<NovedadesServices>(context);

    final ServiciosServices serviciosServices =
        Provider.of<ServiciosServices>(context);

    final ReservaServices reservaServices =
        Provider.of<ReservaServices>(context);

    peluqueroServices.reloadPeluqueros();

    reservaServices.reloadReserva();

    novedadesServices.reloadNovedades();

    serviciosServices.reloadServicios();

    Timer(const Duration(seconds: 1), () {
      Get.to(const HomeScreen());
    });
    return const Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          height: 150,
        ),
      ),
    );
  }
}
