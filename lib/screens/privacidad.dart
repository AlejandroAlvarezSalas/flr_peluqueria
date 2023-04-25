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
    final String privacyPolicy = '''
    Privacy Policy for Pelucapp
    
    Effective date: 11/04/2023
    
    This privacy policy governs the collection, use, and sharing of personal data by Pelucapp ("we," "us," or "our"), a mobile application developed using the Flutter framework. By using the app, you agree to the terms of this policy.
    
    Data collection
    
    We may collect the following types of personal data when you use the app:
    
    - Information you provide, such as your name, email address, and phone number, when you create an account or contact us for support.
    
    - Information about your device and usage of the app, such as your device type, operating system, IP address, and app activity logs.
    
    - Information collected through cookies and similar technologies, such as your preferences and browsing history.
    
    Data use
    
    We may use your personal data for the following purposes:
    
    - To provide and improve the app's features and services, such as personalization and analytics.
    
    - To communicate with you regarding updates, offers, and support.
    
    - To comply with legal obligations and protect our rights and property.
    
    Data sharing
    
    We may share your personal data with third parties in the following situations:
    
    - With service providers who help us operate and improve the app, such as hosting, analytics, and marketing providers.
    
    - With business partners who offer products and services that may interest you.
    
    - With law enforcement or other authorities if required by law or to protect our rights and property.
    
    Data retention
    
    We will retain your personal data for as long as necessary to fulfill the purposes outlined in this policy, unless a longer retention period is required by law or necessary for legitimate business purposes.
    
    Your rights
    
    You have the following rights regarding your personal data:
    
    - To access and receive a copy of your personal data.
    
    - To request correction or erasure of your personal data.
    
    - To object to the processing of your personal data.
    
    - To request restriction of processing of your personal data.
  ''';

    return Column(children: [
      Row(
        children: [
          /*IconButton(
            alignment: Alignment.topLeft,
            onPressed: () => {Navigator.pop(context)},
            icon:
                const Icon(Icons.arrow_back_ios, size: 28, color: Colors.black),
          ),*/
          SizedBox(height: 30),
        ],
      ),
      Text(privacyPolicy),
      SizedBox(height: 15),
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Volver', style: TextStyle(fontSize: 15)),
        ),
      ),
    ]);
  }
}
