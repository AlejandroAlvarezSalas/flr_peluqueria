import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/reservas_services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/form_credit_card_cvv.dart';
import 'package:pelucapp/widgets/form_credit_card_date.dart';
import 'package:pelucapp/widgets/form_credit_card_number.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PasarelaDePagoScreen extends StatelessWidget {
  const PasarelaDePagoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    Reserva reserva = ModalRoute.of(context)!.settings.arguments as Reserva;

    final reservaServices = Provider.of<ReservaServices>(context);

    return Scaffold(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
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
          const SizedBox(width: 20, height: 10),
          Container(
            child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/40/40857.png',
                fit: BoxFit.cover,
                width: 200,
                height: 200),
          ),
          const SizedBox(width: 20, height: 60),
          TextFormField(
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.text,
            initialValue: "",
            validator: (value) {
              // validacion para el form. DEFINIR
              if (value!.isEmpty) {
                return 'No puede quedar vacío';
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "Nomrbre del propietario",
              suffixIcon: Icon(Icons.credit_card_rounded),
            ),
          ),
          const SizedBox(width: 20, height: 20),
          FormCreditCardNumber(
            ocultar: false,
            hintText: 'Número de tarjeta',
            keyboardType: TextInputType.number,
            icon: Icons.numbers_outlined,
          ),
          const SizedBox(width: 20, height: 20),
          FormCreditCardDate(
            value: "",
            ocultar: false,
            hintText: 'Fecha de expiración',
            keyboardType: TextInputType.datetime,
            icon: Icons.calendar_month_outlined,
          ),
          const SizedBox(width: 20, height: 20),
          FormCreditCardCvv(
            value: "",
            ocultar: false,
            keyboardType: TextInputType.number,
            hintText: 'CVV',
            icon: Icons.key_outlined,
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
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                if (!myFormKey.currentState!.validate()) {
                  print('Credenciales incorrectas');
                  return;
                } else {
                  reserva.pago = "Tarjeta";
                  if (reservaServices.desdePeluquero) reserva.telefonica = true;
                  reservaServices.desdePeluquero = false;
                  await reservaServices.guardarOCrearReserva(reserva);
                  /*if (reservaServices
                      .guardarOCrearReserva(reserva)) {
                    Navigator.pushNamed(context, 'recargaReservas');
                  }*/
                  reservaServices.reloadReserva();
                  Navigator.pushNamed(context, 'home');
                  /*Navigator.pushNamed(context, 'recargaReservas');*/
                }
              },
              child: const Text('Pagar', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(height: 10),
        ]),
      ),
    ));
  }
}
