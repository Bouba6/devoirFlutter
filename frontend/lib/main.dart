import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/InscriptionRepositorie.dart';
import 'package:flutter_application_1/views/ELeve.dart';
import 'package:flutter_application_1/views/Inscription.dart';

void main() {
  runApp(const MyApp());
}

// pubdev
// state management :provider recommende
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Inscriptionrepositorie inscriptionrepositorie =
        Inscriptionrepositorie();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // home: const FormComptePage(), // 👈 remplace MyHomePage par HomePage
      initialRoute: '/',
      routes: {
        '/':
            (context) =>
                InscriptionPage(inscriptionrepositorie: inscriptionrepositorie),
        '/eleves':
            (context) =>
                ElevePage(inscriptionrepositorie: inscriptionrepositorie),
      },
    );
  }
}
