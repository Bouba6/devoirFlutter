enum Typecompte {
  EPARGNE,
  CHEQUE,
}

Typecompte getTypeCompte(String type) =>
    Typecompte.values.firstWhere((element) => element.name == type);

String getTypeCompteString(Typecompte type) => type.name;
