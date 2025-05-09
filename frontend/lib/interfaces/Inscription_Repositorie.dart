import 'package:flutter_application_1/models/Eleve.dart';
import 'package:flutter_application_1/models/Inscription.dart';

abstract class InscriptionRepositorieInterface {
  Future<List<Inscription>> getInscriptions();

  Future<List<Eleve>> getStudentsInscriptsInClasse(String nomClasse);

  Future <List<Eleve>> getElevesInscripts ();
}
