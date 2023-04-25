import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {'email': '', 'password': ''};

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _FormLogIn(myFormKey: myFormKey, formValues: formValues),
        )
      ],
    ));
  }
}

class _FormLogIn extends StatelessWidget {
  const _FormLogIn({
    super.key,
    required this.myFormKey,
    required this.formValues,
  });

  final GlobalKey<FormState> myFormKey;
  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    final UsuariosServices usuariosServices =
        Provider.of<UsuariosServices>(context);
    Usuario usuario;
    bool _visible = false;
    return Form(
      key: myFormKey,
      child: Column(children: [
        const SizedBox(height: 20),
        Row(
          children: [
            IconButton(
              alignment: Alignment.topLeft,
              onPressed: () => {Navigator.pop(context)},
              icon: Icon(Icons.arrow_back_ios, size: 28, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 60),
        Container(
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/40/40857.png',
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
        ),
        const SizedBox(width: 20, height: 80),
        FormEmail(
          ocultar: false,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          icon: Icons.email_outlined,
          formProperty: 'email',
          formValues: formValues,
        ),
        const SizedBox(width: 20, height: 20),
        FormFieldPers(
          icon: Icons.key,
          ocultar: true,
          hintText: 'Contraseña',
          formProperty: 'password',
          formValues: formValues,
        ),
        const SizedBox(width: 20, height: 40),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'email');
          },
          child: const Text('¿Has olvidado tu contraseña?',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 20, height: 40),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              print('Activo');
              FocusScope.of(context).requestFocus(FocusNode());
              // Primero tengo que recorrer el array de usuarios que me da el usuariosServices
              for (int i = 0; i < usuariosServices.usuarios.length; i++) {
                print(
                    'Recorro usuarios con una longitud de ${usuariosServices.usuarios.length}');
                // Por cada item, le asigno sus valores a usuario y comparo con los datos introducidos en el formulario
                usuario = usuariosServices.usuarios[i];
                if (usuario.email == formValues['email'] &&
                    usuario.password == formValues['password']) {
                  usuariosServices.usuarioLogin = usuario;
                  // Cuando estos coincidan, dejo que acceda con el navigator
                  Navigator.pushNamed(context, 'home');
                } else {
                  // Si una o ambas credenciales no corresponen entonces muestro los mensajes de validación (por si los campos están vacíos)
                  if (!myFormKey.currentState!.validate()) {
                    print('Credenciales incorrectas');
                    return;
                  }
                }
              }
            },
            child: const Text('Log in', style: TextStyle(fontSize: 20)),
          ),
        ),
        const SizedBox(height: 60)
      ]),
    );
  }
}
