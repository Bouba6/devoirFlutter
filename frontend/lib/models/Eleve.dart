// ignore_for_file: public_member_api_docs, sort_constructors_first

class Eleve {
  late String _id;
  late String nom;
  late String prenom;
  late String classe;
  late String matiere;
  late String note;

  Eleve({
    required id,
    required nom,
    required prenom,
    required classe,
    required matiere,
    required note,
  });

  Eleve.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    classe = json['classe'];
    matiere = json['matiere'];
    note = json['note'];
  }

  get id => _id;

  @override
  String toString() {
    return 'Eleve(nom: $nom, prenom: $prenom, classe: $classe, matiere: $matiere, note: $note)';
  }
}
