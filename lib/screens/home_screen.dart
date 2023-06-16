import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/gerentes_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../services/peluquerias_services.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    CitaScreen(),
    MisReservasScreen(),
    call_screen(),
    EditarPerfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GerentesServices gerentesServices =
        Provider.of<GerentesServices>(context);
    final PeluquerosServices peluqueroServices =
        Provider.of<PeluquerosServices>(context);
    final UsuariosServices usuariosServices =
        Provider.of<UsuariosServices>(context);
    final ReservaServices reservaServices =
        Provider.of<ReservaServices>(context);

    checkPeluquero() {
      for (var pel in peluqueroServices.peluqueros) {
        if (pel.telefono == usuariosServices.usuarioLogin!.telefono)
          return true;
      }
      return false;
    }

    checkGerente() {
      for (var ger in gerentesServices.gerentes) {
        print(ger.telefono);
        print(usuariosServices.usuarioLogin!.telefono);
        if (ger.telefono == usuariosServices.usuarioLogin!.telefono)
          return true;
      }
      return false;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: 20),
            child: BigText(
              text: 'PELUCAPP',
              color: AppTheme.primary,
              size: 25,
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                  bottom: 8,
                  right: 35,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'notificaciones');
                      },
                      color: AppTheme.primary,
                      icon: const Icon(Icons.notifications_sharp),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                ),
                child: Text(
                  'Gestión',
                  style: TextStyle(
                    color: AppTheme.secondaryTextColor,
                    fontSize: 24,
                  ),
                ),
              ),
              if (checkGerente())
                ListTile(
                  title: const Text('Peluqueros'),
                  onTap: () {
                    Navigator.pushNamed(context, 'gestionPeluqueros');
                  },
                ),
              if (checkGerente())
                ListTile(
                  title: const Text('Novedades'),
                  onTap: () {
                    // Update the state of the app
                    print('novedades');
                    Navigator.pushNamed(context, 'gestionNovedades');
                    // Then close the drawer
                  },
                ),
              if (checkGerente())
                ListTile(
                  title: const Text('Servicios'),
                  onTap: () {
                    // Update the state of the app
                    Navigator.pushNamed(context, 'gestionServicios');
                    // Then close the drawer
                  },
                ),
              if (checkPeluquero())
                ListTile(
                  title: const Text('Mis citas'),
                  onTap: () {
                    // Update the state of the app
                    Navigator.pushNamed(context, 'reservasPeluquero');
                    // Then close the drawer
                  },
                ),
              ListTile(
                title: const Text('Cerrar App'),
                onTap: () {
                  // Update the state of the app
                  SystemNavigator.pop();
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: const BoxDecoration(
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.cut),
                label: 'Pedir cita',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark),
                label: 'Mis reservas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Llamanos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Perfil',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}
