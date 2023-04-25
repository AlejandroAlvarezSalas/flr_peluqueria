import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/providers/usuario_form_provider.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuariosServices usuariosServices = Provider.of<UsuariosServices>(context);

    return ChangeNotifierProvider(
      create: ((context) => UsuarioFormProvider(usuariosServices.usuarioLogin)),
      child: RegisterScreenBody(usuariosServices: usuariosServices),
    );
  }
}

class RegisterScreenBody extends StatefulWidget {
  final UsuariosServices usuariosServices;
  const RegisterScreenBody({Key? key, required this.usuariosServices})
      : super(key: key);

  @override
  State<RegisterScreenBody> createState() =>
      _RegisterScreenState(usuariosServices);
}

//bool _checkedP = false;
bool _termChecked = false;
final Map<String, String> formValues = {
  'nombreusuario': '',
  'telefono': '',
  'email': '',
  'password': '',
  'confirmacion': '',
  'genero': '',
};

class _RegisterScreenState extends State<RegisterScreenBody> {
  final UsuariosServices usuariosServices;

  _RegisterScreenState(this.usuariosServices);

  bool _verpassword = true;
  bool _verpasswordconfig = true;

  @override
  Widget build(BuildContext context) {
    final usuarioForm = Provider.of<UsuarioFormProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: usuarioForm.formKey,
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
          const SizedBox(width: 20, height: 60),
          Container(
            child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/40/40857.png',
                fit: BoxFit.cover,
                width: 200,
                height: 200),
          ),
          const SizedBox(width: 20, height: 80),
          FormFieldPers(
            value: formValues['nombreusuario'],
            ocultar: false,
            hintText: 'Nombre de usuario',
            icon: Icons.group_outlined,
            formProperty: 'nombreusuario',
            formValues: formValues,
          ),
          const SizedBox(width: 20, height: 20),
          FormEmail(
            value: formValues['email'],
            ocultar: false,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email_outlined,
            formProperty: 'email',
            formValues: formValues,
          ),
          const SizedBox(width: 20, height: 20),
          FormFieldPers(
            value: formValues['telefono'],
            ocultar: false,
            keyboardType: TextInputType.number,
            hintText: 'Teléfono',
            icon: Icons.phone_android_outlined,
            formProperty: 'telefono',
            formValues: formValues,
          ),
          const SizedBox(width: 20, height: 20),
          /*
          FormFieldPers(
            value: formValues['genero'],
            ocultar: false,
            keyboardType: TextInputType.text,
            hintText: 'Género',
            icon: Icons.person_outlined,
            formProperty: 'genero',
            formValues: formValues,
          ),        
          const SizedBox(width: 20, height: 20),
          */
          ToggleSwitch(
            minWidth: 100.0,
            initialLabelIndex: 1,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            labels: ['Hombre', 'Mujer'],
            icons: [Icons.male, Icons.female],
            activeBgColors: [
              [Colors.blue],
              [Colors.pink]
            ],
            onToggle: (index) {
              if (index == 0) {
                formValues['genero'] = 'hombre';
              } else {
                formValues['genero'] = 'mujer';
              }
            },
          ),
          const SizedBox(width: 20, height: 20),
          FormFieldPers(
            value: formValues['password'],
            ocultar: true,
            keyboardType: TextInputType.text,
            hintText: 'Contraseña',
            icon: Icons.key,
            formProperty: 'password',
            formValues: formValues,
            hideable: true,
          ),
          const SizedBox(width: 20, height: 20),
          FormFieldPers(
            value: formValues['confirmacion'],
            ocultar: true,
            keyboardType: TextInputType.text,
            hintText: 'Confirma contraseña',
            icon: Icons.key,
            formProperty: 'confirmacion',
            formValues: formValues,
            hideable: true,
          ),
          /*
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text(
                'Acepto recibir notificaciones sobre las novedades de la app'),
            value: _checkedP,
            onChanged: (value) {
              setState(() {
                _checkedP = value!;
              });
            },
          ),
          */
          const SizedBox(height: 20),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text.rich(
              TextSpan(
                //text: 'Click here to visit ',
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'He leido',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, 'privacidad');
                      },
                  ),
                  TextSpan(
                    text: ' y acepto los términos y condiciones de uso',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ) /*const Text(
                'He leido y acepto los términos y condiciones de uso')*/
            ,
            value: _termChecked,
            onChanged: (value) {
              setState(() {
                _termChecked = value!;
                //Navigator.pushNamed(context, 'privacidad');
              });
            },
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: _termChecked
                  ? () async {
                      if (!usuarioForm.isValidForm()) return;
                      usuarioForm.usuario = Usuario(
                        nombre: formValues['nombreusuario']!,
                        email: formValues['email']!,
                        genero: formValues['genero']!,
                        telefono:
                            int.parse(formValues['telefono'] ?? '000000000'),
                        password: formValues['password']!,
                        verificado: true,
                      );
                      //print(usuarioForm.usuario);
                      await usuariosServices
                          .guardarOCrearUsuario(usuarioForm.usuario!);
                      Navigator.pushNamed(context, 'login');
                    }
                  : null,
              child: const Text('Registrarse', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(height: 40),
        ]),
      ),
    ));
  }
}
