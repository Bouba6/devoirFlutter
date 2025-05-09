import 'dart:convert';

import 'package:flutter_application_1/interfaces/Inscription_Repositorie.dart';
import 'package:flutter_application_1/models/Eleve.dart';
import 'package:flutter_application_1/models/Inscription.dart';
import 'package:http/http.dart' as http;

class Inscriptionrepositorie extends InscriptionRepositorieInterface {
  String url = "http://192.168.1.9:3000/inscription";
  @override
  Future<List<Inscription>> getInscriptions() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = response.body;
      if (body.isEmpty) {
        print("Réponse vide");
        return [];
      }

      final data = jsonDecode(body);
      if (data is List) {
        final inscriptions = data.map((e) => Inscription.fromJson(e)).toList();
        return inscriptions;
      } else {
        throw Exception('Failed to load album');
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<List<Eleve>> getStudentsInscriptsInClasse(String nomClasse) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = response.body;

      if (body.isEmpty) {
        print("Réponse vide");
        return [];
      }

      final Map<String, dynamic> data = jsonDecode(body);

      if (!data.containsKey('inscription')) {
        throw Exception('Key "inscription" not found');
      }

      List<Eleve> students = [];

      for (var inscription in data['inscription']) {
        if (inscription.containsKey('Etudiant')) {
          for (var etudiant in inscription['Etudiant']) {
            if (etudiant['classe'] == nomClasse) {
              students.add(Eleve.fromJson(etudiant));
            }
          }
        }
      }

      return students;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<Eleve>> getElevesInscripts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = response.body;
      if (body.isEmpty) {
        print("Réponse vide");
        return [];
      }
      final data = jsonDecode(body);
      List<Eleve> eleves = [];

      for (var inscription in data['inscription']) {
        if (inscription.containsKey('Etudiant')) {
          for (var etudiant in inscription['Etudiant']) {
            eleves.add(Eleve.fromJson(etudiant));
          }
        }
      }
      return eleves;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
