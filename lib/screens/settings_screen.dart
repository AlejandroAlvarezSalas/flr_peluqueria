import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.secondaryTextColor),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: BigText(text: 'PELUCAPP', color: AppTheme.secondaryTextColor,),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 35),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'notificaciones');
              },
              child: const Icon(
                Icons.notifications_sharp,
                color: AppTheme.secondaryTextColor,
              )
            )
          )
        ],
      ),
    body: Column(
         children: [ Container(
          
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Icon(Icons.edit, color: Color.fromARGB(255, 6, 6, 6)),
             GestureDetector(
              
          onTap: () {
            Navigator.pushNamed(context, 'editar');
          },
          child: Text('Editar mi perfil', style: TextStyle(fontSize: 20.0)),
        ),
        
                    ],
          ),
          
        ),
        Divider(),
         Container(
          
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Icon(Icons.edit, color: Color.fromARGB(255, 6, 6, 6)),
             GestureDetector(
              
          onTap: () {
            Navigator.pushNamed(context, '');
          },
          child: Text('Cambiar foto de perfil', style: TextStyle(fontSize: 20.0)),
        ),
        
                    ],
          ),
          
        ),
         Divider(),
         ],
      ),
    );
  }
}