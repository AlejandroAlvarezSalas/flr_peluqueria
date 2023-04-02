import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class NotificacionesScreen extends StatelessWidget {
   
  const NotificacionesScreen ({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {  
    return  Scaffold(
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
      body: Center(   
         child: Text(
          'Oops parece que no tienes notificaciones aún',
          style: TextStyle(
          fontSize: 14, // tamaño de fuente en puntos
          color: Color.fromARGB(255, 190, 174, 174),
           // color de texto
      ),
         ),
         
      ),
    );
  }
}