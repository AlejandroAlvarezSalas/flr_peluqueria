import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/widgets/big_text.dart';
import 'package:pelucapp/widgets/small_text.dart';

import 'package:pelucapp/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final usuariosServices = Provider.of<UsuariosServices>(context);

    final Usuario usuario = usuariosServices.usuarioLogin!;
    String nombre = usuario.nombre;
    String email = usuario.email;
    String telefono = usuario.telefono.toString();
    String? imagen = usuariosServices.usuarioLogin?.imagen;
    


    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          70.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                   border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                
                ),
                    child :TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: nombre,
                       hintStyle: TextStyle(color: Colors.black),
                    
                    ), 
                    ),
                    ),
                    SizedBox(
                      height:
                          16.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                   border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                
                ),
                    child :TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: email,
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                    ),
                    SizedBox(
                      height:
                          16.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                   border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                
                ),
                    child :TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: telefono,
                       hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                    ),
                    SizedBox(
                      height:
                          16.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'editar');
                        },
                        child: Text('Editar perfil')),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
              ),
              painter: HeaderCurvedContainer(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 5.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ClipRRect(
              borderRadius: BorderRadius.only( topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              child: imagen == null
                ? Image(
                    image:  AssetImage('assets/User.png'),
                    fit: BoxFit.cover,
                  )
                : CircleAvatar(
                    maxRadius: 10,
                    backgroundImage:NetworkImage(imagen),
                  ),
            ),
                padding: EdgeInsets.all(10.0),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 13, 12, 12), width: 1),
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 252, 252),
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color.fromARGB(255, 6, 0, 0);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
