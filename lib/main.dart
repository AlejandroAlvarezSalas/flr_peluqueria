import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/reservas_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => PeluquerosServices()),
      ChangeNotifierProvider(create: (context) => PeluqueriasServices()),
      ChangeNotifierProvider(create: (context) => ServiciosServices()),
      ChangeNotifierProvider(create: (context) => UsuariosServices()),
      ChangeNotifierProvider(create: (context) => ReservaServices()),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PelucApp',
      theme: AppTheme.lightTheme,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'front_page': (context) => FrontPageScreen(),
        'home': (context) => HomeScreen(),
        'citas': (context) => CitaScreen(),
        'login': (context) => LogInScreen(),
        'register': (context) => RegisterScreen(),
        'mis_reservas': (context) => MisReservasScreen(),
        'peluqueros': (context) => PeluquerosScreen(),
        'servicios': (context) => ServiciosScreen(),
        'notificaciones': (context) => NotificacionesScreen(),
        'resumen': (context) => ResumenPedidoScreen(),
        'editar': (context) => EditarPerfilScreen(),
        'perfil': (context) => ProfileHomePage(),
        'ajustes': (context) => Settings(),
        'email': (context) => EmailScreen(),
        'horario': (context) => HorarioScreen(),
        'metodos_de_pago': (context) => MetodosDePagoScreen(),
        'pasarela_de_pago': (context) => PasarelaDePagoScreen(),
        'loading': (context) => LoadingScreen(),
        'privacidad': (context) => PrivacidadScreen(),
        'gestionPeluqueros': (context) => GestionPeluquerosScreen(),
        'editarPeluquero': (context) => EditarPeluqueroScreen(),
      },
    );
  }
}
