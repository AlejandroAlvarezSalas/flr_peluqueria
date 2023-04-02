import 'package:flutter/material.dart';

class PrivacidadScreen extends StatelessWidget {
  const PrivacidadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: _privacidadBody(),
    ));
  }
}

class _privacidadBody extends StatelessWidget {
  const _privacidadBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          IconButton(
            alignment: Alignment.topLeft,
            onPressed: () => {Navigator.pop(context)},
            icon:
                const Icon(Icons.arrow_back_ios, size: 28, color: Colors.black),
          ),
        ],
      ),
      const Text('Ejemplo política privacidad'),
      const SizedBox(height: 55),
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          child: const Text('He leído la política de privacidad',
              style: TextStyle(fontSize: 15)),
        ),
      ),
    ]);
  }
}
