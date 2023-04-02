import 'package:flutter/material.dart';
import 'package:pelucapp/screens/home_screen.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class call_screen extends StatelessWidget {
    const call_screen({super.key});
  
   @override
  Widget build(BuildContext context) {
    
     
    return Scaffold(
        body: Center(
          child: Column(  
             mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Padding(
              padding: EdgeInsets.all(16.0),
              child: const Text('Contáctanos llamandonos', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
            
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                   onPressed: () => launch('tel:+670896756'),
                    
                  
                  child: const Text('670 89 67 56', style: TextStyle( fontSize: 20)),
                  
                ),
                
              ),

              const SizedBox( height: 30,),
               Padding(
              padding: EdgeInsets.all(16.0),
              child: const Text('O mandanos un correo', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),
              Container(
                
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () => launch('mailto:Pelucapp@gmail.com?subject=Asunto&body=Cuerpo del correo electrónico'),
                  child: const Text('Pelucapp@gmail.com', style: TextStyle( fontSize: 20)),
            
                ),
              ),
            ],
              ),
          ),
        );      
  }
}  
